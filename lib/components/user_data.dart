import 'package:meta/meta.dart';

class User {
  final String number;
  final String result;


   User({
    required this.number,
    required this.result,
  });

  static User fromJson(json) => User(
    number: json['number'],
    result: json['result'],
  );
}