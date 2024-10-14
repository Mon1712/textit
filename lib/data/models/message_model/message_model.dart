
import 'package:cloud_firestore/cloud_firestore.dart';

enum Type{text,image,video,audio}

class MessageModel {
  String? id;
   String? fromId;
   String? dateAndTime;
   String? toId;
   bool? read;
   String? sent;
   String? msg;
   Type? type;

  MessageModel({
    this.id,
     this.fromId,
    this.dateAndTime,
     this.toId,
     this.read,
     this.sent,
     this.msg,
     this.type,
  });

  // Convert a MessageModel into a Map to store in a database like Firestore
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fromId': fromId,
      'toId': toId,
      'read': read,
      'dateAndTime':dateAndTime,
      'sent': sent,
      'msg': msg,
      'type': type?.toString().split('.').last,
    };
  }

  // Create a MessageModel from a Map (used when fetching data from Firestore or other sources)
  factory MessageModel.fromMap(DocumentSnapshot<Map<String, dynamic>> map) {
    return MessageModel(
      id: map.id,
      fromId: map['fromId'],
      toId: map['toId'],
      read:  map['read'],
      sent: map['sent'],
      msg: map['msg'],
      dateAndTime: map['dateAndTime'],
      type: Type.values.firstWhere(
            (e) => e.toString() == 'Type.${map['type']}',
        orElse: () => Type.text, // Default to 'text' if type is not found
      ),
    );
  }
}

