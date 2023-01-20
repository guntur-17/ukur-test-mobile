class Profile {
  String? picture;
  int? age;
  String? eyeColor;
  String? name;
  String? gender;
  String? email;
  String? phone;
  String? address;

  Profile({
    this.picture,
    this.age,
    this.eyeColor,
    this.name,
    this.gender,
    this.email,
    this.phone,
    this.address,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        picture: json['picture'] as String?,
        age: json['age'] as int?,
        eyeColor: json['eyeColor'] as String?,
        name: json['name'] as String?,
        gender: json['gender'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as String?,
        address: json['address'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'picture': picture,
        'age': age,
        'eyeColor': eyeColor,
        'name': name,
        'gender': gender,
        'email': email,
        'phone': phone,
        'address': address,
      };
}
