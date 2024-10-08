import 'dart:io';

import 'package:chateo/utils/constants/app_assets/app_assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:chateo/utils/exception_handling/firebase_auth_exception.dart';
import 'package:chateo/utils/exception_handling/firebase_exception.dart';
import 'package:chateo/utils/exception_handling/format_exception.dart';
import 'package:chateo/utils/exception_handling/platform_exception.dart';
import 'dart:typed_data';

class UserAssets {

  // Create a private constructor
  UserAssets._privateConstructor();

  // The single instance of the class (lazily initialized)
  static final UserAssets _instance = UserAssets._privateConstructor();

  // A static method to access the singleton instance
  static UserAssets get instance => _instance;

  // Firebase Firestore instance
  final FirebaseStorage _storage = FirebaseStorage.instance;

  ///upload Default Image if user didn't select any image
  Future<String> uploadDefaultImage() async {
    try {
      // Load the image from the assets
      ByteData data = await rootBundle.load(AppAssets.icPerson);
      Uint8List bytes = data.buffer.asUint8List();

      // Upload the image
      String fileName = 'profileImage.png';
      Reference ref = _storage.ref().child('images/$fileName');
      await ref.putData(bytes);

      // Optionally, get the download URL
      String downloadURL = await ref.getDownloadURL();
      return downloadURL;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

  ///  save user image
  Future<String> saveUserProfileImage({required String uid, required File image}) async {
    try {
      final ref = _storage.ref("Users/Images/").child(uid);
      await ref.putFile(image);
      final downloadUrl = await ref.getDownloadURL();
      return downloadUrl;
    }  on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptionHandler(e.code).message;
    } on FirebaseException catch (e) {
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e) {
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e) {
      throw PlatformExceptionHandler(e.code).message;
    } catch (e) {
      throw "Something went wrong";
    }
  }

}