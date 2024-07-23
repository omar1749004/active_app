import 'package:active_app/core/class/auth_result.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:sign_in_with_apple/sign_in_with_apple.dart';


class SocialMediaAuth {
  
  GoogleSignIn _googleSignIn = GoogleSignIn();
  FacebookAuth _facebookAuth = FacebookAuth.instance;

  String? userEmail;
  String? userId;
  // Function to sign in with Google
   

  // Function to sign in with Google
  Future<AuthResult> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        userEmail = googleSignInAccount.email;
        userId = googleSignInAccount.id; // Get user ID
        print("Google User Email: $userEmail");
        print("Google User ID: $userId");
        return AuthResult.success;
      } else {
        // User canceled sign-in
        print('Google sign-in canceled by user.');
        return AuthResult.cancelled;
      }
    } catch (e) {
      print("Error signing in with Google: $e");
      return AuthResult.error;
    }
  }

  // Function to sign in with Facebook
  Future<AuthResult> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult result = await _facebookAuth.login();
      if (result.status == LoginStatus.success) {
        final userData = await _facebookAuth.getUserData(fields: "email,id");
        userEmail = userData["email"];
        userId = userData["id"]; // Get user ID
        print("Facebook User Email: $userEmail");
        print("Facebook User ID: $userId");
        return AuthResult.success;
      } else if (result.status == LoginStatus.cancelled) {
        print('Facebook sign-in canceled by user.');
        return AuthResult.cancelled;
      } else {
        print('Error signing in with Facebook: ${result.message}');
        return AuthResult.error;
      }
    } catch (e) {
      print("Error signing in with Facebook: $e");
      return AuthResult.error;
    }
  }


  // Function to sign in with Apple
  // Future<void> signInWithApple() async {
  //   try {
  //     final result = await SignInWithApple.getAppleIDCredential(
  //       scopes: [
  //         'email',
  //         // Add additional scopes if needed
  //       ],
  //     );
  //     final AuthorizationCredentialAppleID credential = result.credential!;
  //     userEmail = credential.email;
  //     // Set other user information if needed
  //   } catch (e) {
  //     print("Error signing in with Apple: $e");
  //   }
  // }

  // Function to sign out
Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _facebookAuth.logOut();
      userEmail = null;
      userId = null;
      // Add sign out code for Apple if needed
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}