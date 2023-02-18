import 'package:flutter/material.dart';

abstract class ChatEvent {}

class LogOutChatEvnet extends ChatEvent {
  final BuildContext context;

  LogOutChatEvnet({required this.context});
}
