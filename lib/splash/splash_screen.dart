import 'package:booksella/common/widgets/into_widget.dart';
import 'package:booksella/splash/bloc/splash_bloc.dart';
import 'package:booksella/splash/bloc/splash_event.dart';
import 'package:booksella/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SplashBloc, SplashStates>(
        builder: (context, state) {
          if (state is InitialSplashState) {
            BlocProvider.of<SplashBloc>(context)
                .add(ReValidateRefreshTokenSplashEvent(context: context));
          }

          return IntroWidget(
            dyanmicWidget: state is LoadingSplashState
                ? Expanded(
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 50),
                      child: SizedBox(
                        height: 25,
                        width: 25,
                        child: CircularProgressIndicator(
                          color: Colors.blue[800]!,
                          strokeWidth: 2.5,
                        ),
                      ),
                    ),
                  )
                : Container(),
          );
        },
      ),
    );
  }
}
