import 'dart:async';
import 'dart:developer';

import 'package:booksella/chat/bloc/chat_bloc.dart';
import 'package:booksella/common/repository/auth_service.dart';
import 'package:booksella/common/repository/chat_repositoy.dart';
import 'package:booksella/sign_in/bloc/sign_in_bloc.dart';
import 'package:booksella/splash/bloc/splash_bloc.dart';
import 'package:booksella/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runZonedGuarded(
    () => runApp(MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Auth0Service>(create: (context) => Auth0Service()),
        RepositoryProvider<ChatRepository>(
            create: (context) => ChatRepository()),
      ],
      child: const MyApp(),
    )),
    (error, stackTrace) => log(error.toString(), stackTrace: stackTrace),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInBloc>(
          create: (BuildContext context) => SignInBloc(),
        ),
        BlocProvider<ChatBloc>(
          create: (BuildContext context) => ChatBloc(),
        ),
        BlocProvider<SplashBloc>(
          create: (BuildContext context) => SplashBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Lato',
          primarySwatch: Colors.blue,
          inputDecorationTheme: const InputDecorationTheme(
            floatingLabelStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w700),
            suffixIconColor: Colors.grey,
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
