// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat/bloc/chat_event.dart';
import 'package:booksella/chat/bloc/chat_state.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  Auth0Profile? userProfile;

  ChatBloc() : super(InitialChatState()) {
    on<LogOutChatEvnet>((event, emit) async {
      try {
        final authService = RepositoryProvider.of<Auth0Service>(event.context);
        var result = await authService.logOut();
        if (result) {
          Navigator.of(event.context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) {
            return const SignInScreen();
          }), (route) => false);
        }
      } catch (e, s) {
        LogPrint.error('$e Log out all news event $s');
      }
    });
  }
}
