import 'package:chateo/data/models/contact_model/contact_model.dart';
import 'package:chateo/data/models/user_model/user_model.dart';
import 'package:chateo/utils/exception_handling/firebase_auth_exception.dart';
import 'package:chateo/utils/exception_handling/firebase_exception.dart';
import 'package:chateo/utils/exception_handling/format_exception.dart';
import 'package:chateo/utils/exception_handling/platform_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class UserRepository {

  // Create a private constructor
  UserRepository._privateConstructor();

  // The single instance of the class (lazily initialized)
  static final UserRepository _instance = UserRepository._privateConstructor();

  // A static method to access the singleton instance
  static UserRepository get instance => _instance;

  // Firebase Firestore instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// User getter method
  FirebaseFirestore? get db => FirebaseFirestore.instance;

/// snapshot of all Users
Stream<QuerySnapshot<Map<String,dynamic>>> get getAllUser{
    return _db.collection("User").snapshots();
  }

  // Stream to get users
  Stream<List<ContactModel>> get contactsStream {
    return _db.collection("User").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ContactModel.fromJson(doc.data());
      }).toList();
    });
  }

  /// save user records
  Future<void> storeUserRecord({required UserModel userModel}) async{
    try{
      return await _db.collection("User").doc(userModel.id).set(userModel.toJson());
    }on FirebaseAuthException catch (e){
      throw FirebaseAuthExceptionHandler(e.code).message;
    }on FirebaseException catch(e){
      throw FirebaseExceptionHandler(e.code).message;
    } on FormatException catch (e){
      throw FormatExceptionHandler.handleException(e);
    } on PlatformException catch (e){
      throw PlatformExceptionHandler(e.code).message;
    }catch (e) {
      throw "Something went wrong";
    }
  }

}