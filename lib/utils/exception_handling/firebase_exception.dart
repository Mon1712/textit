class FirebaseExceptionHandler {

  final String code;

  FirebaseExceptionHandler(this.code);

  String get message{
    switch (code) {
    // General Firebase Error Cases
      case 'permission-denied':
        return 'You do not have permission to access this resource.';
      case 'unavailable':
        return 'The requested service is temporarily unavailable. Please try again later.';
      case 'resource-exhausted':
        return 'Resource limit exceeded. Please try again later or contact support.';
      case 'not-found':
        return 'The requested resource could not be found.';
      case 'already-exists':
        return 'The resource you are trying to create already exists.';
      case 'cancelled':
        return 'The operation was cancelled.';
      case 'invalid-argument':
        return 'The provided arguments are invalid. Please check your inputs.';
      case 'deadline-exceeded':
        return 'The operation took too long to complete. Please try again later.';
      case 'data-loss':
        return 'Data loss occurred. Please contact support.';
      case 'failed-precondition':
        return 'Failed precondition. Ensure the system is in the correct state.';
      case 'aborted':
        return 'The operation was aborted. Please retry.';
      case 'out-of-range':
        return 'The operation is out of the valid range.';
      case 'internal':
        return 'An internal server error occurred. Please try again later.';
      case 'unauthenticated':
        return 'You need to sign in to perform this action.';
      case 'unknown':
        return 'An unknown error occurred. Please try again later.';
      case 'network-error':
        return 'A network error occurred. Please check your connection.';
      case 'timeout':
        return 'The request timed out. Please try again.';
      case 'channel-error':
        return 'Unable to establish connection on channel.';

    // Firebase Auth Error Cases
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password. Please try again.';
      case 'email-already-in-use':
        return 'The email is already in use by another account.';
      case 'invalid-email':
        return 'The email address is not valid.';
      case 'weak-password':
        return 'The password is too weak. It should be at least 6 characters long.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many requests. Please try again later.';
      case 'operation-not-allowed':
        return 'This sign-in method is not allowed. Contact support.';
      case 'invalid-verification-code':
        return 'The verification code is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID is invalid.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with a different credential.';
      case 'invalid-credential':
        return 'The credential is malformed or has expired.';
      case 'invalid-phone-number':
        return 'The phone number is not valid.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user.';
      case 'requires-recent-login':
        return 'This operation requires recent authentication. Please log in again.';
      case 'provider-already-linked':
        return 'This account is already linked to this provider.';
      case 'second-factor-required':
        return 'Second-factor authentication is required to complete the sign-in.';

    // Firebase Storage Error Cases
      case 'object-not-found':
        return 'No object exists at the desired reference.';
      case 'unauthorized':
        return 'User does not have permission to access the object.';
      case 'storage/quota-exceeded':
        return 'Quota exceeded. You cannot perform this action until quota is increased.';
      case 'storage/retry-limit-exceeded':
        return 'Max retry time for operation exceeded, try again later.';
      case 'storage/canceled':
        return 'User canceled the upload/download.';
      case 'storage/unknown':
        return 'Unknown error occurred. Please try again later.';

    // Firebase Cloud Functions Error Cases
      case 'functions/invalid-argument':
        return 'Invalid argument passed to a cloud function.';
      case 'functions/deadline-exceeded':
        return 'Cloud function execution time exceeded the deadline.';
      case 'functions/not-found':
        return 'The requested cloud function does not exist.';
      case 'functions/permission-denied':
        return 'You do not have permission to execute this function.';
      case 'functions/internal':
        return 'Internal error occurred in cloud function. Please try again later.';
      case 'functions/unavailable':
        return 'Cloud function service is unavailable. Please try again later.';
      case 'functions/aborted':
        return 'Cloud function execution aborted. Retry the operation.';

    // Realtime Database Error Cases
      case 'database/disconnected':
        return 'The connection to the Realtime Database was lost.';
      case 'database/permission-denied':
        return 'Permission denied for Realtime Database access.';
      case 'database/timeout':
        return 'The operation timed out on the Realtime Database.';
      case 'database/network-error':
        return 'A network error occurred while accessing Realtime Database.';

      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
