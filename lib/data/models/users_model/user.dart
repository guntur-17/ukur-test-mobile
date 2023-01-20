import 'profile.dart';

class User {
  String? id;
  bool? isActive;
  Profile? profile;
  String? company;
  String? about;
  String? registered;

  User({
    this.id,
    this.isActive,
    this.profile,
    this.company,
    this.about,
    this.registered,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as String?,
        isActive: json['isActive'] as bool?,
        profile: json['profile'] == null
            ? null
            : Profile.fromJson(json['profile'] as Map<String, dynamic>),
        company: json['company'] as String?,
        about: json['about'] as String?,
        registered: json['registered'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'isActive': isActive,
        'profile': profile?.toJson(),
        'company': company,
        'about': about,
        'registered': registered,
      };
}
