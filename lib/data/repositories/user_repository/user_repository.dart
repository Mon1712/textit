import 'package:chateo/data/models/contact_model/contact_model.dart';
import 'package:chateo/data/models/message_model/message_model.dart';
import 'package:chateo/data/models/user_model/user_model.dart';
import 'package:chateo/services/user_authentication/user_authentication.dart';
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

  /// snapshot of specific Users
  Future<DocumentSnapshot<Map<String,dynamic>>> getSpecificUser({required String fromId}){
    return _db.collection("User").doc(fromId).get();
  }


  /// This function will generate the chat room between 2 users
  String generateChatRoom({required String receiverId}) => UserAuthentication.instance.user!.uid.hashCode <= receiverId.hashCode?
      "${UserAuthentication.instance.user!.uid}_$receiverId":"${receiverId}_${UserAuthentication.instance.user!.uid}";

  /// snapshot of all Chat between 2 users
  Stream<QuerySnapshot<Map<String,dynamic>>> getAllChats({required String receiverId,}){
    return _db.collection("Chat")
        .doc(generateChatRoom(receiverId: receiverId))
        .collection("messages").orderBy("dateAndTime", descending: false)
        .snapshots();  // This listens to changes in the 'messages' collection
  }


  /// snapshot of list of all chats
  Stream<QuerySnapshot<Map<String,dynamic>>> getChatList(){
    return _db.collection("Chat").snapshots();  // This listens to changes in the 'messages' collection
  }

  /// save basic info in chat room docs
  Future<void> updateChatRoomFields({required String receiverId, required String fromId,required String toId,required String lastMessage,required String timeStamp,}) async{
    await _db.collection("Chat").doc(generateChatRoom(receiverId: receiverId)).set({
      "fromId":fromId,
      "toId":toId,
      "lastMessage":lastMessage,
      "timeStamp":timeStamp
    });  // This listens to changes in the 'messages' collection
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


  /// save users Chat records
  Future<void> saveChatRecords({required String receiverId, required MessageModel messageModel}) async{
    try{
       await _db.collection("Chat").doc(generateChatRoom(receiverId: receiverId)).collection("messages").doc().set(messageModel.toMap());
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

  /// save users Chat records
  Future<void> updateSingleField({required String receiverId,required String docId}) async{
    try{
       await _db.collection("Chat").doc(generateChatRoom(receiverId: receiverId)).collection("messages").doc(docId).update(
          {"read": true});
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