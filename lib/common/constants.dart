// ignore_for_file: constant_identifier_names

enum ResultType { success, error }

class Constants {
  static const AUTH0_DOMAIN = String.fromEnvironment('AUTH0_DOMAIN');
  static const AUTH0_CLIENT_ID = String.fromEnvironment('AUTH0_CLIENT_ID');
  static const AUTH0_ISSUER = "https://$AUTH0_DOMAIN";
  static const BUNDLE_IDENTIFIER = "com.example.booksella";
  static const AUTH0_REDIRECT_URI = "$BUNDLE_IDENTIFIER://login-callback";
  static const Refresh_TOKEN_KEY = "refresh_token";
  static const STREAM_API_KEY = String.fromEnvironment('STREAM_API_KEY');

  //Images
  static const chaticonImage = 'assets/images/chat_icon.png';
}
