import 'dart:convert';

class UserModel {
  String? name;
  String? surName;
  String? birthDate;
  String? email;
  String? password;
  String? cityName;
  String? streetName;
  String? countyName;
  UserModel({
    this.name,
    this.surName,
    this.birthDate,
    this.email,
    this.password,
    this.cityName,
    this.streetName,
    this.countyName,
  });

  UserModel copyWith({
    String? name,
    String? surName,
    String? birthDate,
    String? email,
    String? password,
    String? cityName,
    String? streetName,
    String? countyName,
  }) {
    return UserModel(
      name: name ?? this.name,
      surName: surName ?? this.surName,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      password: password ?? this.password,
      cityName: cityName ?? this.cityName,
      streetName: streetName ?? this.streetName,
      countyName: countyName ?? this.countyName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'surName': surName,
      'birthDate': birthDate,
      'email': email,
      'password': password,
      'cityName': cityName,
      'streetName': streetName,
      'countyName': countyName,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      surName: map['surName'],
      birthDate: map['birthDate'],
      email: map['email'],
      password: map['password'],
      cityName: map['cityName'],
      streetName: map['streetName'],
      countyName: map['countyName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(name: $name, surName: $surName, birthDate: $birthDate, email: $email, password: $password, cityName: $cityName, streetName: $streetName, countyName: $countyName)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel && other.name == name && other.surName == surName && other.birthDate == birthDate && other.email == email && other.password == password && other.cityName == cityName && other.streetName == streetName && other.countyName == countyName;
  }

  @override
  int get hashCode {
    return name.hashCode ^ surName.hashCode ^ birthDate.hashCode ^ email.hashCode ^ password.hashCode ^ cityName.hashCode ^ streetName.hashCode ^ countyName.hashCode;
  }
}
