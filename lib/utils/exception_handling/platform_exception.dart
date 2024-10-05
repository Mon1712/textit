class PlatformExceptionHandler {

  final String code;

  PlatformExceptionHandler(this.code);

 String get message {
    switch (code) {
    // Common Platform Error Cases
      case 'not-implemented':
        return 'This feature is not available on your current platform.';
      case 'network_error':
        return 'A network error occurred. Please check your internet connection.';
      case 'permission-denied':
        return 'You do not have permission to access this resource.';
      case 'service-unavailable':
        return 'The service is temporarily unavailable. Please try again later.';
      case 'timeout':
        return 'The request timed out. Please try again.';
      case 'canceled':
        return 'The operation was canceled.';
      case 'already-exists':
        return 'The resource you are trying to create already exists.';
      case 'invalid-argument':
        return 'The provided arguments are invalid. Please check your inputs.';
      case 'not-found':
        return 'The requested resource could not be found.';
      case 'quota-exceeded':
        return 'Resource quota exceeded. Please try again later.';
      case 'unavailable':
        return 'The requested service is currently unavailable.';
      case 'database-error':
        return 'A database error occurred. Please try again later.';
      case 'unauthenticated':
        return 'You need to sign in to perform this action.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'failed-precondition':
        return 'Failed precondition. Please check your inputs or system state.';
      case 'aborted':
        return 'The operation was aborted. Please try again.';
      case 'data-loss':
        return 'Data loss occurred. Please try again or contact support.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'out-of-range':
        return 'The operation is out of the valid range.';
      case 'unknown':
        return 'An unknown error occurred. Please try again later.';

    // Android Specific Error Cases
      case 'activity-not-found':
        return 'The requested activity could not be found on this device.';
      case 'invalid-activity':
        return 'The requested activity is invalid on this platform.';
      case 'missing-permission':
        return 'Required permissions are missing for this operation.';

    // iOS Specific Error Cases
      case 'not-supported-on-ios':
        return 'This feature is not supported on iOS devices.';
      case 'missing-entitlement':
        return 'Missing required entitlement for this operation.';
      case 'camera-access-denied':
        return 'Camera access was denied. Please enable it in settings.';
      case 'camera-unavailable':
        return 'The camera is unavailable. Try restarting your device.';

    // Bluetooth Error Cases
      case 'bluetooth-disabled':
        return 'Bluetooth is disabled. Please enable it to proceed.';
      case 'bluetooth-permission-denied':
        return 'Bluetooth permission was denied.';
      case 'bluetooth-unavailable':
        return 'Bluetooth is not available on this device.';

    // Location Error Cases
      case 'location-service-disabled':
        return 'Location services are disabled. Please enable them in settings.';
      case 'location-permission-denied':
        return 'Location permission was denied.';
      case 'location-unavailable':
        return 'Location information is unavailable.';

    // File Handling Error Cases
      case 'file-not-found':
        return 'The requested file could not be found.';
      case 'file-already-exists':
        return 'The file already exists at the target location.';
      case 'file-permission-denied':
        return 'Permission denied to access the file.';
      case 'file-read-failed':
        return 'Failed to read the file.';
      case 'file-write-failed':
        return 'Failed to write to the file.';

      default:
        return 'An unexpected error occurred. Please try again later.';
    }
  }
}
