import 'package:blood_donation/controller/route.dart';
import 'package:blood_donation/controller/utls.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '/controller/route.dart' as route;

//! akbar
class Authentication {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  get user => _auth.currentUser;

  //! for auto login
  static Future<FirebaseApp> initializeFirebase({
    required BuildContext context,
  }) async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
   
    User? user = await FirebaseAuth.instance.currentUser;

    if (user != null) {
      Navigator.of(context).pushReplacementNamed(
        route.homePage,
      );
    }

    return firebaseApp;
  }

  //! sign in with google
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        // if (!kIsWeb) {
        //    GoogleAuthProvider authProvider = GoogleAuthProvider();
        // }
        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Utils().toast(
              context,
              'The account already exists with a different credential.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          ScaffoldMessenger.of(context).showSnackBar(
            Utils().toast(
              context,
              'Error occurred while accessing credentials. Try again.',
            ),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          Utils().toast(
            context,
            'Error occurred using Google Sign-In. Try again.',
          ),
        );
      }

      return user;
    }
    return null;
  }
  //! sign out method

  static Future<void> signOut({required BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (!kIsWeb) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        Utils().toast(
          context,
          'Error signing out. Try again.',
        ),
      );
    }
  }

//!  SIGN UP WITH EMAIL AND PASSWORD
  Future<String?> signUpWithMailId(
      {required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'Signup success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      print(e);
    }
    return 'Signup failed';
  }

  //!  SIGN IN WITH EMAIL AND PASSWORD
  Future<String?> signInWithMailId(
      {required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return 'Signin success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    }

    return 'Signin failed';
  }


  
}
