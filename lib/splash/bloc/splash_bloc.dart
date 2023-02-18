// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat/chat_screen.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/sign_in/sign_in_screen.dart';
import 'package:booksella/splash/bloc/splash_event.dart';
import 'package:booksella/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashBloc extends Bloc<SplashEvents, SplashStates> {
  bool isUserReValidated = false;

  SplashBloc() : super(InitialSplashState()) {
    on<ReValidateRefreshTokenSplashEvent>((event, emit) async {
      try {
        emit(LoadingSplashState());
        final authService = RepositoryProvider.of<Auth0Service>(event.context);

        isUserReValidated = await authService.revalidateUser();

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
