import 'dart:developer';

import 'package:chateo/utils/exception_handling/firebase_auth_exception.dart';
import 'package:chateo/utils/exception_handling/firebase_exception.dart';
import 'package:chateo/utils/exception_handling/format_exception.dart';
import 'package:chateo/utils/exception_handling/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserAuthentication{

  // Create a private constructor
  UserAuthentication._privateConstructor();

  // The single instance of the class (lazily initialized)
  static final UserAuthentication _instance = UserAuthentication._privateConstructor();

  // A static method to access the singleton instance
  static UserAuthentication get instance => _instance;

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signUpByEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final UserCredential credential =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch (e) {
      // Log the error for debugging
      throw "$e";

    }
  }

}