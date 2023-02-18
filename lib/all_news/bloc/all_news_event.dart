import 'package:flutter/material.dart';

abstract class AllNewsEvent {}

class LogOutAllNewsEvnet extends AllNewsEvent {
  final BuildContext context;

  LogOutAllNewsEvnet({required this.context});
}
