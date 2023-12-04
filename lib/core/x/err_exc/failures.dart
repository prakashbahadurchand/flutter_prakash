// import 'package:equatable/equatable.dart';
//
// abstract class Failure extends Equatable{
//   @override
//   List<Object?> get props => [];
// }
//
// class ServerFailure extends Failure{
//
// }

class Failure {
  String message;
  Failure(this.message);

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server Error');
}

class CacheFailure extends Failure {
  CacheFailure() : super('Cache Error');
}

class NetworkFailure extends Failure {
  NetworkFailure() : super('Network Error');
}

class DatabaseFailure extends Failure {
  DatabaseFailure() : super('Database Error');
}

class PermissionFailure extends Failure {
  PermissionFailure() : super('Permission Denied Error');
}

class TimeoutFailure extends Failure {
  TimeoutFailure() : super('Request Timeout Error');
}
