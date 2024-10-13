import 'dart:developer';

import 'package:chateo/data/models/contact_detail_model/contact_detail_model.dart';
import 'package:chateo/data/models/contact_model/contact_model.dart';
import 'package:chateo/routes/app_pages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_contacts/flutter_contacts.dart';

class ContactsController extends GetxController {

  /// Variables
  List<Contact> contacts = []; // Contains contacts fetch from device contacts
  List<ContactDetails> contactDetailsList = []; // Contains contacts which doesn't exists in firestore db

  /// move to single chat screen
  void moveToSingleChatScreen(ContactModel contactModel){

    Get.toNamed(Routes.singleChat, arguments: contactModel);
  }

  @override
  void onInit() {
    super.onInit();
    fetchContacts();
  }

  /// Fetch contacts from device
  Future<void> fetchContacts() async {
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
  }

  /// Get New ChatModel lists
  List<ContactModel> filteredList(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot, List<Contact> contacts) {
    // Initialize a list to store matching contacts
    List<ContactModel> matchingContacts = [];

    // Firebase snapshot data
    var snapShotData = snapshot.data!.docs.map((data) =>
        ContactModel.fromJson(data.data()));

    // Use a more efficient matching approach, e.g., using a set of phone numbers
    Set<String> contactNumbers = contacts.expand((contact) =>
        contact.phones.map((phone) => phone.normalizedNumber)).toSet();

    // Use a more efficient matching approach, e.g., using a set of phone numbers
    var newCon = contacts
        .where((contact) =>
    contact.phones.isNotEmpty &&
        contact.phones.first.normalizedNumber.isNotEmpty)
        .map((contact) {
      String normalizedNumber = contact.phones.first.normalizedNumber;
      return ContactDetails(
        phoneNumber: normalizedNumber,
        name: contact.displayName,
        profileImage: contact.photo, // Optional: Add photo if you need it
      );
    }).toList();

    // Loop through all Firestore contacts and compare
    for (var firestoreContact in snapShotData) {
      String firestorePhoneNumber = "+91${firestoreContact.phoneNumber
          ?.trim()}";

      // Check if Firestore contact matches any phone number in device contacts
      if (contactNumbers.contains(firestorePhoneNumber)) {
        matchingContacts.add(ContactModel(
          id: firestoreContact.id,
          name: firestoreContact.name,
          phoneNumber: firestoreContact.phoneNumber,
          profileImage: firestoreContact.profileImage,
        ));
      }
    }

    // create a new list that does not contains phone number
    for (var contactDetails in newCon) {
      String firestorePhoneNumber = "+91${snapShotData.first.phoneNumber
          ?.trim()}";

      // Check if the phone number is different and not already in the list
      bool alreadyInList = contactDetailsList
          .any((detail) => detail.phoneNumber == contactDetails.phoneNumber);

      // Add contact numbers to inviteContacts if not already present in Firestore
      if (contactDetails.phoneNumber != firestorePhoneNumber &&
          !alreadyInList) {
        contactDetailsList.add(contactDetails);
      }
    }
    update(); // Update the UI
    return matchingContacts;
  }
}



// Loop through device contacts and add non-matching contacts to invite list
// for (var contactNumber in contactNumbers) {
//   String firestorePhoneNumber = "+91${snapShotData.first.phoneNumber
//       ?.trim()}";
//
//   // Add contact numbers to inviteContacts if not already present in Firestore
//   if (contactNumber != firestorePhoneNumber &&
//       !inviteContacts.contains(contactNumber)) {
//     inviteContacts.add(contactNumber);
//   }
// }
// log("Number of unmatched contacts (invite): ${inviteContacts.length}");