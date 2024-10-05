class FirebaseAuthExceptionHandler {
  // A method to handle FirebaseAuth exceptions
  final String code;

  FirebaseAuthExceptionHandler(this.code);

  String get message {
    switch (code) {
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support.';
      case 'user-not-found':
        return 'No user found with this email address. Please sign up first.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'This email address is already registered. Please use a different email or log in.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Please contact support.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
      case 'requires-recent-login':
        return 'Please log in again to perform this action.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different account.';
      case 'invalid-credential':
        return 'The credential provided is malformed or has expired.';
      case 'invalid-verification-code':
        return 'The verification code entered is invalid. Please try again.';
      case 'invalid-verification-id':
        return 'The verification ID provided is invalid. Please request a new one.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email address but different sign-in credentials. Please use another sign-in method.';
      case 'invalid-password':
        return 'The password entered is invalid. Please try again.';
      case 'invalid-user-token':
        return 'The user credential has expired or is invalid. Please log in again.';
      case 'user-token-expired':
        return 'Your session has expired. Please log in again.';
      case 'user-mismatch':
        return 'The provided credentials do not correspond to the current user.';
      case 'provider-already-linked':
        return 'This provider is already linked to your account.';
      case 'no-such-provider':
        return 'The requested provider is not available for this account.';
      case 'invalid-phone-number':
        return 'The phone number entered is invalid. Please enter a valid phone number.';
      case 'invalid-action-code':
        return 'The action code is invalid. It may have expired or already been used.';
      case 'missing-verification-code':
        return 'The verification code is missing. Please check your messages and try again.';
      case 'missing-verification-id':
        return 'The verification ID is missing. Please retry the verification process.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication. Please verify your Firebase project settings.';
      default:
        return 'An unknown error occurred. Please try again later.';
    }
  }
}