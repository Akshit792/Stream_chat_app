import 'package:booksella/chat/bloc/chat_bloc.dart';
import 'package:booksella/chat/bloc/chat_event.dart';
import 'package:booksella/chat/bloc/chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class AllBooksScreen extends StatefulWidget {
  const AllBooksScreen({super.key});

  @override
  State<AllBooksScreen> createState() => _AllBooksScreenState();
}

class _AllBooksScreenState extends State<AllBooksScreen> {
  Channel? channel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        if (state is InitialChatState) {
          BlocProvider.of<ChatBloc>(context)
              .add(CreateChatChannelEvent(context: context));
        }

        if (state is ChannelCreatedState) {
          channel = BlocProvider.of<ChatBloc>(context).channel;
        }
        return Scaffold(
            appBar: AppBar(
              title: const Text('Chat room'),
              actions: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ChatBloc>(context)
                        .add(LogOutChatEvnet(context: context));
                  },
                  icon: const Icon(Icons.power_settings_new),
                )
              ],
            ),
            body: state is InitialChatState
                ? messageBox(messageText: 'Creating chat channel')
                : channel == null
                    ? messageBox(
                        messageText: 'You are not in the queue plz wait')
                    : streamChatWidget());
      },
    );
  }

  Widget streamChatWidget() {
    return StreamChannel(
        channel: channel!,
        child: Column(
          children: const [
            Expanded(child: StreamMessageListView()),
            StreamMessageInput()
          ],
        ));
  }

  Widget messageBox({required String messageText}) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      child: Text(
        messageText,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
