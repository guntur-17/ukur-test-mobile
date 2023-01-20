import 'data.dart';

class UsersModel {
  int? id;
  String? statusMsg;
  int? statusCode;
  Data? data;

  UsersModel({this.id, this.statusMsg, this.statusCode, this.data});

  factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        id: json['id'] as int?,
        statusMsg: json['status_msg'] as String?,
        statusCode: json['status_code'] as int?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status_msg': statusMsg,
        'status_code': statusCode,
        'data': data?.toJson(),
      };
}
