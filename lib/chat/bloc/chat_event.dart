import 'package:booksella/common/models/auth0_profile.dart';
import 'package:flutter/material.dart';

abstract class ChatEvent {}

class LogOutChatEvnet extends ChatEvent {
  final BuildContext context;

  LogOutChatEvnet({required this.context});
}

class CreateChatChannelEvent extends ChatEvent {
  BuildContext context;

  CreateChatChannelEvent({required this.context});
}
