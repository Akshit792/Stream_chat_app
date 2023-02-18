import 'package:flutter/material.dart';

abstract class SignInEvent {}

class Auth0SignInEvent extends SignInEvent {
  final BuildContext context;

  Auth0SignInEvent({required this.context});
}

class ReValidateTokenSignInEvent extends SignInEvent {
  final BuildContext context;

  ReValidateTokenSignInEvent({required this.context});
}
