// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat/chat_screen.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/common/repository/chat_repositoy.dart';
import 'package:booksella/sign_in/sign_in_screen.dart';
import 'package:booksella/splash/bloc/splash_event.dart';
import 'package:booksella/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SplashBloc extends Bloc<SplashEvents, SplashStates> {
  bool isUserReValidated = false;
  Auth0Profile? userProfile;

  SplashBloc() : super(InitialSplashState()) {
    on<ReValidateRefreshTokenSplashEvent>((event, emit) async {
      try {
        emit(LoadingSplashState());
        final authService = RepositoryProvider.of<Auth0Service>(event.context);
        final chatRepo = RepositoryProvider.of<ChatRepository>(event.context);
        final client = StreamChat.of(event.context).client;

        isUserReValidated = await authService.revalidateUser();

        if (client.wsConnectionStatus != ConnectionStatus.connected) {
          if (authService.auth0Profile != null) {
            userProfile = await chatRepo.connectUser(authService.auth0Profile!);
          }
        }

        if (isUserReValidated) {
          _navigate(event.context, const AllBooksScreen(), emit);
        } else {
          _navigate(event.context, const SignInScreen(), emit);
        }
      } catch (e, s) {
        LogPrint.error('$e Re Validate Refresh Token $s');
      }
    });
  }

  _navigate(BuildContext context, Widget screen, Emitter<SplashStates> emit) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return screen;
    }));
    emit(LoadedSplashState());
  }
}
