// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat_room/chat_screen.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/common/repository/chat_repositoy.dart';
import 'package:booksella/sign_in/bloc/sign_in_event.dart';
import 'package:booksella/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool isUserLoggedIn = false;
  Auth0Profile? userProfile;
  SignInBloc() : super(InitialSignInState()) {
    on<Auth0SignInEvent>((event, emit) async {
      try {
        emit(LoadingSignInState());
        final authService = RepositoryProvider.of<Auth0Service>(event.context);
        final chatRepo = RepositoryProvider.of<ChatRepository>(event.context);
        final client = StreamChat.of(event.context).client;

        isUserLoggedIn = await authService.logIn();

        // connect only if the user is not connected otherwise it will show an error user is alredy connected.
        if (client.wsConnectionStatus != ConnectionStatus.connected) {
          if (authService.auth0Profile != null) {
            userProfile = await chatRepo.connectUser(authService.auth0Profile!);
          }
        }
        print('isUserLogedIn: $isUserLoggedIn');
        if (isUserLoggedIn) {
          Navigator.of(event.context)
              .push(MaterialPageRoute(builder: (context) {
            return const AllBooksScreen();
          }));
          emit(LoadedSignInState());
        } else {
          emit(LoadedSignInState());
        }
      } catch (e, s) {
        LogPrint.error('$e Auth0 Sign In Event $s');
      }
    });
  }
}
