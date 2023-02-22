import 'package:booksella/common/constants.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

// This will be true for the production and false for the debug and profile.
const bool isProduction = bool.fromEnvironment('dart.vm.product');

class ChatRepository {
  // Create client
  final client = StreamChatClient(
    Constants.STREAM_API_KEY,
    logLevel: isProduction ? Level.OFF : Level.INFO,
  );

  // connect the user to the client
  Future<Auth0Profile> connectUser(Auth0Profile authUser) async {
    await client.connectUser(
        User(id: authUser.userId, extraData: {
          'picture': authUser.picture,
          'name': authUser.name,
          'email': authUser.email,
        }),
        // replace with production token in prod env
        client.devToken(authUser.userId).rawValue);
    return authUser;
  }
}
