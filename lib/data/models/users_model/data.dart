import 'user.dart';

class Data {
  dynamic previous;
  int? current;
  int? next;
  List<User>? users;

  Data({this.previous, this.current, this.next, this.users});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        previous: json['previous'] as dynamic,
        current: json['current'] as int?,
        next: json['next'] as int?,
        users: (json['users'] as List<dynamic>?)
            ?.map((e) => User.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'previous': previous,
        'current': current,
        'next': next,
        'users': users?.map((e) => e.toJson()).toList(),
      };
}
