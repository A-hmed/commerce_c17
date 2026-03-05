class AppErrors {
  String message;

  AppErrors(this.message);
}

class ServerError extends AppErrors {
  ServerError({String message = "Server is down please try again later"})
    : super(message);
}

class ApiError extends AppErrors {
  ApiError({String message = "Something went wrong please try again later"})
    : super(message);
}

class NetworkError extends AppErrors {
  NetworkError({String message = "Please check your internet connection"})
    : super(message);
}

class IgnoredErrors extends AppErrors {
  IgnoredErrors({String message = ""}) : super(message);
}

class UnknownErrors extends AppErrors {
  UnknownErrors({
    String message = "Something went wrong please try again later",
  }) : super(message);
}
