import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:booksella/common/constants.dart';
import 'package:booksella/common/models/auth0_id_token.dart';
import 'package:booksella/common/models/auth0_profile.dart';
import 'package:booksella/common/models/logger.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

typedef AsyncCallBackbool = Future<bool> Function();

class Auth0Service {
  final appAuth = const FlutterAppAuth();
  final secureStorage = const FlutterSecureStorage();
  String? accessToken;
  Auth0IdToken? idToken;
  Auth0Profile? auth0Profile;

  Future<bool> logIn() async {
    return await errorHandler(
      () async {
        var authorizationTokenRequest = AuthorizationTokenRequest(
            Constants.AUTH0_CLIENT_ID, Constants.AUTH0_REDIRECT_URI,
            issuer: Constants.AUTH0_ISSUER,
            scopes: [
              'openid',
              'profile',
              'email',
              'offline_access',
            ],
            promptValues: [
              'login'
            ]);

        AuthorizationTokenResponse? authResponse =
            await appAuth.authorizeAndExchangeCode(authorizationTokenRequest);

        final result = await setLocalVariables(authResponse: authResponse);

        return result == ResultType.success;
      },
    );
  }

  Future<bool> revalidateUser() async {
    return await errorHandler(() async {
      var secureRefreshToken =
          await secureStorage.read(key: Constants.Refresh_TOKEN_KEY);
      if (secureRefreshToken == null) {
        return false;
      }

      //Use refresh token to re-validate the user
      TokenRequest tokenRequest = TokenRequest(
        Constants.AUTH0_CLIENT_ID,
        Constants.AUTH0_REDIRECT_URI,
        issuer: Constants.AUTH0_ISSUER,
        refreshToken: secureRefreshToken,
      );

      TokenResponse? tokenResponse = await appAuth.token(tokenRequest);

      final result = await setLocalVariables(authResponse: tokenResponse);

      return result == ResultType.success;
    });
  }

  Future<bool> logOut() async {
    return await errorHandler(() async {
      await secureStorage.delete(key: Constants.Refresh_TOKEN_KEY);
      // EndSessionRequest request = EndSessionRequest(
      //   idTokenHint: jsonEncode(idToken),
      //   issuer: Constants.AUTH0_ISSUER,
      //   postLogoutRedirectUrl:
      //       "${Constants.BUNDLE_IDENTIFIER}://logout-callback",
      // );

      // await appAuth.endSession(request);
      return true;
    });
  }

  Future<ResultType> setLocalVariables({TokenResponse? authResponse}) async {
    if (isAuthResponseValid(authResponse: authResponse)) {
      accessToken = authResponse!.accessToken;
      idToken = parseIdToken(idToken: authResponse.idToken!);

      var result = await getUserDetails(accessToken!);

      if (result == ResultType.error) {
        return ResultType.error;
      }

      if (authResponse.refreshToken != null) {
        await secureStorage.write(
          key: Constants.Refresh_TOKEN_KEY,
          value: authResponse.refreshToken,
        );
      }
      return ResultType.success;
    } else {
      return ResultType.error;
    }
  }

  Future<ResultType> getUserDetails(String accessToken) async {
    try {
      final url = Uri.https(Constants.AUTH0_DOMAIN, "/userinfo");

      final response = await http.get(url, headers: {
        "Authorization": "Bearer $accessToken",
      });

      if (response.statusCode == 200) {
        auth0Profile = Auth0Profile.fromJson(jsonDecode(response.body));
      }

      return ResultType.success;
    } on UserProfileException catch (e) {
      LogPrint.error(e.message);
      return ResultType.error;
    } catch (e) {
      return ResultType.error;
    }
  }

  Auth0IdToken parseIdToken({required String idToken}) {
    final parts = idToken.split(r'.');

    Map<String, dynamic> json = jsonDecode(
      utf8.decode(
        base64Url.decode(
          base64Url.normalize(parts[1]),
        ),
      ),
    );
    return Auth0IdToken.fromJson(json);
  }

  bool isAuthResponseValid({TokenResponse? authResponse}) {
    return (authResponse != null &&
        authResponse.accessToken != null &&
        authResponse.idToken != null);
  }

  Future<bool> errorHandler(AsyncCallBackbool callBack) async {
    try {
      return await callBack();
    } on TimeoutException catch (e) {
      LogPrint.error(e.message ?? 'Timeout error');
      return false;
    } on SocketException catch (e) {
      LogPrint.error(e.message);
      return false;
    } on PlatformException catch (e) {
      LogPrint.error(e.message ?? 'Platform exception');
      return false;
    } on FormatException catch (e) {
      LogPrint.error(e.message);
      return false;
    } catch (e) {
      LogPrint.error('Unkown error: $e ${e.runtimeType}');
      return false;
    }
  }
}

class UserProfileException implements Exception {
  final String message;

  UserProfileException({required this.message});
}
