import 'package:flutter/material.dart';

abstract class SplashEvents {}

class ReValidateRefreshTokenSplashEvent extends SplashEvents {
  final BuildContext context;

  ReValidateRefreshTokenSplashEvent({required this.context});
}
