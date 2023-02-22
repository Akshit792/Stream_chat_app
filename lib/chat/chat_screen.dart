import 'package:booksella/chat/bloc/chat_bloc.dart';
import 'package:booksella/chat/bloc/chat_event.dart';
import 'package:booksella/chat/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Container(
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
            child: Column(
              children: [
                const Text('User successfully logged in'),
                MaterialButton(
                  color: Colors.black,
                  onPressed: () {
                    BlocProvider.of<ChatBloc>(context)
                        .add(LogOutChatEvnet(context: context));
                        
                  },
                  child: const Text(
                    'log out',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
