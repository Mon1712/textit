class FormatExceptionHandler {
  static String handleException(FormatException e) {
    switch (e.message) {
    // Common FormatException Cases
      case 'Unexpected end of input':
        return 'The input is incomplete. Please check your input and try again.';
      case 'Invalid radix':
        return 'The provided number has an invalid radix.';
      case 'Invalid date format':
        return 'The date format is invalid. Please use a valid date format (e.g., YYYY-MM-DD).';
      case 'Invalid number format':
        return 'The number format is invalid. Please provide a valid number.';
      case 'Invalid character':
        return 'The input contains an invalid character. Please correct it.';
      case 'Too few arguments':
        return 'Not enough arguments provided. Please supply all required information.';
      case 'Non-string data':
        return 'The input is expected to be a string but contains other data types.';
      case 'Unexpected character':
        return 'The input contains an unexpected character. Please check and correct it.';
      case 'Integer overflow':
        return 'The input value is too large to be processed. Please provide a smaller number.';
      case 'Number out of range':
        return 'The number is out of the valid range. Please enter a valid number within the allowed range.';
      case 'JSON format error':
        return 'There was an error in parsing the JSON format. Please check your JSON structure.';
      case 'URL format error':
        return 'The URL format is incorrect. Please provide a valid URL.';

    // Additional cases for common format issues
      case 'Base64 decoding failed':
        return 'Failed to decode the input from Base64. Please check your Base64 encoded string.';
      case 'Currency format invalid':
        return 'The currency format is invalid. Please enter a valid currency value.';
      case 'Invalid input length':
        return 'The input length is invalid. Ensure that the input has the required number of characters.';

      default:
        return 'An unknown formatting error occurred. Please check your input.';
    }
  }
}
