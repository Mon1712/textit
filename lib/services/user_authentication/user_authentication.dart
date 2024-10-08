import 'package:chateo/utils/exception_handling/firebase_auth_exception.dart';
import 'package:chateo/utils/exception_handling/firebase_exception.dart';
import 'package:chateo/utils/exception_handling/format_exception.dart';
import 'package:chateo/utils/exception_handling/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserAuthentication{

  // Create a private constructor
  UserAuthentication._privateConstructor();

  // The single instance of the class (lazily initialized)
  static final UserAuthentication _instance = UserAuthentication._privateConstructor();

  // A static method to access the singleton instance
  static UserAuthentication get instance => _instance;

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// User getter method
  User? get user => _auth.currentUser;


  ///[EmailAuthentication] Sign up by email and password
  Future<UserCredential> signUpByEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  ///[EmailAuthentication] Sign in by email and password
  Future<UserCredential> signInByEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

  ///------------------------------[GoogleSignIn]--------------------------------///

  Future<UserCredential> signInByGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser
          ?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw "$e";
    }
  }

}