// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat/chat_screen.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/sign_in/bloc/sign_in_event.dart';
import 'package:booksella/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  bool isUserLoggedIn = false;

  SignInBloc() : super(InitialSignInState()) {
    on<Auth0SignInEvent>((event, emit) async {
      try {
        emit(LoadingSignInState());
        final authService = RepositoryProvider.of<Auth0Service>(event.context);

        isUserLoggedIn = await authService.logIn();
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
    on<ReValidateTokenSignInEvent>((event, emit) async {});
  }
}
