import 'package:booksella/all_news/bloc/all_news_bloc.dart';
import 'package:booksella/all_news/bloc/all_news_event.dart';
import 'package:booksella/all_news/bloc/all_news_state.dart';
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
      body: BlocBuilder<AllNewsBloc, AllNewsState>(
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
                    BlocProvider.of<AllNewsBloc>(context)
                        .add(LogOutAllNewsEvnet(context: context));
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
