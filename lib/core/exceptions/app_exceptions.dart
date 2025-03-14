class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix = 'Something went wrong']);

  @override
  String toString() {
    return _message ?? _prefix;
  }
}

class NoInternetException extends AppException {
  NoInternetException([String? message])
      : super(message, 'No Internet Connection');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message])
      : super(message, 'You don\'t have access to this');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([String? message])
      : super(message, 'Request Time out');
}

class FetchDateException extends AppException {
  FetchDateException([String? message]) : super(message, 'Fetch Data Failed');
}
