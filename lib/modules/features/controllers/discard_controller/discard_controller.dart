// import 'dart:developer';
// import 'package:chateo/modules/features/screens/single_chat_screen/single_chat_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class DiscardController extends GetxController{
//
//   /// Method for signing in using Google
// Future<void> _signInWithGoogle() async {
//   try {
//     final googleUser = await GoogleSignIn(scopes: ['email']).signIn();
//     final googleAuth = await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//     final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//     final authUser = userCredential.user;
//     final firstName = authUser?.displayName!.substring(0, authUser.displayName!.lastIndexOf(' '));
//     final lastName = authUser?.displayName!.substring(authUser.displayName!.lastIndexOf(" ") + 1);
//     log("id--->${authUser?.uid}");
//     log("google email ---->${authUser?.email}");
//     log("google name ---->$firstName");
//     log("lastName--->$lastName");
//
//   } catch (e) {
//     // Catch and handle other types of exceptions
//      print('Exception -> $e');
//   }
// }
//
// Future<void> getToNextPage()async{
//  await _signInWithGoogle().then((credential){
//    Get.to(()=>const SingleChatScreen());
//  });
// }
//
//
// }
//
