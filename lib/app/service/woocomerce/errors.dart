abstract class IFailure implements Exception {
  String get message;
}

// class InvalidRequets extends IFailure {
//   final String message;
//   InvalidTask({required this.message});
//   @override
//   String toString() {
//     return message;
//   }
// }

class DatabaseError extends IFailure {
  final String message;
  DatabaseError({required this.message});
}

class SomeThingsWentWrong extends IFailure {
  final String message = 'Some things went wrong';
  SomeThingsWentWrong();
}
