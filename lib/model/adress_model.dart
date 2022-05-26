import 'dart:convert';

class AdressModel {
  String? cityName;
  String? streetName;
  String? countyName;
  AdressModel({
    this.cityName,
    this.streetName,
    this.countyName,
  });

  AdressModel copyWith({
    String? cityName,
    String? streetName,
    String? countyName,
  }) {
    return AdressModel(
      cityName: cityName ?? this.cityName,
      streetName: streetName ?? this.streetName,
      countyName: countyName ?? this.countyName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cityName': cityName,
      'streetName': streetName,
      'countyName': countyName,
    };
  }

  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      cityName: map['cityName'],
      streetName: map['streetName'],
      countyName: map['countyName'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AdressModel.fromJson(String source) => AdressModel.fromMap(json.decode(source));

  @override
  String toString() => 'AdressModel(cityName: $cityName, streetName: $streetName, countyName: $countyName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AdressModel && other.cityName == cityName && other.streetName == streetName && other.countyName == countyName;
  }

  @override
  int get hashCode => cityName.hashCode ^ streetName.hashCode ^ countyName.hashCode;
}
