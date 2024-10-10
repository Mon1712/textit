import 'package:flutter/services.dart';

class ContactDetails {
  String phoneNumber;
  String name;
  Uint8List? profileImage;  // Assuming the photo is in Uint8List format

  ContactDetails({required this.phoneNumber, required this.name, this.profileImage});
}