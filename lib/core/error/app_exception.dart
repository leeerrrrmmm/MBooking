sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Network error']);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server error', this.statusCode]);

  final int? statusCode;
}

class AuthException extends AppException {
  const AuthException([super.message = 'Authentication error']);
}

class ParsingException extends AppException {
  const ParsingException([super.message = 'Invalid response']);
}
