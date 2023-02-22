import 'package:booksella/common/widgets/into_widget.dart';
import 'package:booksella/sign_in/bloc/sign_in_bloc.dart';
import 'package:booksella/sign_in/bloc/sign_in_event.dart';
import 'package:booksella/sign_in/bloc/sign_in_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  FocusNode focusNode = FocusNode();
  FocusNode focusNode1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return IntroWidget(
            dyanmicWidget: _buildAuthButton(state),
          );
        },
      ),
    );
  }

  Widget _buildAuthButton(SignInState state) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(
          left: 50,
          right: 50,
          bottom: 40,
        ),
        alignment: Alignment.bottomCenter,
        child: MaterialButton(
          elevation: 8,
          height: 50,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 15),
          color: Colors.blue[800],
          minWidth: double.infinity,
          onPressed: () {
            if (state is LoadingSignInState) {
              return;
            }
            BlocProvider.of<SignInBloc>(context)
                .add(Auth0SignInEvent(context: context));
          },
          child: state is LoadingSignInState
              ? const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2.5,
                  ))
              : const Text(
                  'Sign in/Sign up',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
        ),
      ),
    );
  }
}
