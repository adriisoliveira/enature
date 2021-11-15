import 'dart:html';
import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/auth/auth_controller.dart';
import 'package:payflow/shared/models/user_model.dart';

class LoginController {
  final authController = AuthController();

  get logger => null;
  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      final response = await _googleSignIn.signIn();
      final user =
          UserModel(name: response!.displayName!, photoURL: response.photoUrl);
      authController.setUser(context, user);
      print(response);
      logger.write(context);
    } catch (error) {
      authController.setUser(context, null);
      print(error);
      logger.write(context);
    }
    logger.write(context);
  }
}

require(String s) {
  var functions;
  functions.logger.log("Hello from info. Here's an object:", AuthController);
}
