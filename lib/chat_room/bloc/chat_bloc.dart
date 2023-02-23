// ignore_for_file: use_build_context_synchronously

import 'package:booksella/chat_room/bloc/chat_event.dart';
import 'package:booksella/chat_room/bloc/chat_state.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/common/repository/chat_repositoy.dart';
import 'package:booksella/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  Auth0Profile? userProfile;
  Channel? channel;

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
          // await chatRepo.disconnectClient();
        }
      } catch (e, s) {
        LogPrint.error('$e Log out all news event $s');
      }
    });
    on<CreateChatChannelEvent>((event, emit) async {
      try {
        final chatRepo = RepositoryProvider.of<ChatRepository>(event.context);
        channel = await chatRepo.createSupportChat();
        emit(ChannelCreatedState());
      } catch (e, s) {
        LogPrint.error('$e Create chat channel event $s');
      }
    });
  }
}
