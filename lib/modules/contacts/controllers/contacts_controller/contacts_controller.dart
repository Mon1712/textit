import 'dart:developer';

import 'package:chateo/data/models/contact_model/contact_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsController extends GetxController{


  /// variables
 late List<Contact>? contacts;

 @override
 void onInit() {
   super.onInit();
   fetchContacts();
 }


  Future<void> fetchContacts() async {
    var permissionStatus = await Permission.contacts.status;

    // Request permission if not granted
    if (permissionStatus.isDenied) {
      permissionStatus = await Permission.contacts.request();
    }
    if (permissionStatus.isPermanentlyDenied) {
      // Permission permanently denied, direct user to app settings
      openAppSettings();
    }

    if (permissionStatus.isGranted) {
      try {
         contacts = await FlutterContacts.getContacts(
          withThumbnail: true,
          withPhoto: true,
          withAccounts: true,
          withGroups: true,
          withProperties: true,
        );
      } catch (e) {
        log("Error fetching contacts: $e");
      }
    } else {
      log("Permission denied");
    }
  }

  /// get New ChatModel lists
  List<ContactModel> filteredList(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot,List<Contact> contacts) {

   // Initialize a list to store matching contacts
    List<ContactModel> matchingContacts = [];

    // firebase snapshot data
    var snapShotData = snapshot.data!.docs.map((data) =>
        ContactModel.fromJson(data.data()));

    // Use a more efficient matching approach, e.g., using a set of phone numbers
    Set<String> contactNumbers = contacts
        .expand((contact) =>
        contact.phones.map((phone) => phone.normalizedNumber ?? ""))
        .toSet();

    for (var firestoreContact in snapShotData) {
      String firestorePhoneNumber = "+91${firestoreContact.phoneNumber
          ?.trim()}" ?? "";

      if (contactNumbers.contains(firestorePhoneNumber)) {
        log("$firestorePhoneNumber matches a contact");
        matchingContacts.add(ContactModel(id: firestoreContact.id,
            name: firestoreContact.name,
            phoneNumber: firestoreContact.phoneNumber,
            profileImage: firestoreContact.profileImage));
      } else {
        log("$firestorePhoneNumber does not match");
      }
    }
    log("$matchingContacts");
    return matchingContacts;
  }

  }


