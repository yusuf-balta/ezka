import 'dart:convert';

class UserModel {
  String? name;
  String? surName;
  String? birthDate;
  String? email;
  String? password;
  UserModel({
    this.name,
    this.surName,
    this.birthDate,
    this.email,
    this.password,
  });

  UserModel copyWith({
    String? name,
    String? surName,
    String? birthDate,
    String? email,
    String? password,
  }) {
    return UserModel(
      name: name ?? this.name,
      surName: surName ?? this.surName,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surName': surName,
      'birthDate': birthDate,
      'email': email,
      'password': password,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      surName: map['surName'],
      birthDate: map['birthDate'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, surName: $surName, birthDate: $birthDate, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.name == name && other.surName == surName && other.birthDate == birthDate && other.email == email && other.password == password;
  }

  @override
  int get hashCode {
    return name.hashCode ^ surName.hashCode ^ birthDate.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
