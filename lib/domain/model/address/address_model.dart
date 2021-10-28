import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String firstName;
  String lastName;
  String addressLine1;
  String? addressLine2;
  String city;
  String state;
  String zipCode;
  String phoneNo;
  bool isPermanent;
  FieldValue createdAt;
  AddressModel({
    required this.firstName,
    required this.lastName,
    required this.addressLine1,
    this.addressLine2,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.phoneNo,
    required this.isPermanent,
    required this.createdAt,
  });

  AddressModel copyWith({
    String? firstName,
    String? lastName,
    String? addressLine1,
    String? addressLine2,
    String? city,
    String? state,
    String? zipCode,
    String? phoneNo,
    bool? isPermanent,
    FieldValue? createdAt,
  }) {
    return AddressModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      addressLine1: addressLine1 ?? this.addressLine1,
      addressLine2: addressLine2 ?? this.addressLine2,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      phoneNo: phoneNo ?? this.phoneNo,
      isPermanent: isPermanent ?? this.isPermanent,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'addressLine1': addressLine1,
      'addressLine2': addressLine2,
      'city': city,
      'state': state,
      'zipCode': zipCode,
      'phoneNo': phoneNo,
      'isPermanent': isPermanent,
      'createdAt': createdAt,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      addressLine1: map['addressLine1'],
      addressLine2: map['addressLine2'],
      city: map['city'],
      state: map['state'],
      zipCode: map['zipCode'],
      phoneNo: map['phoneNo'],
      isPermanent: map['isPermanent'],
      createdAt: map['createdAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(firstName: $firstName, lastName: $lastName, addressLine1: $addressLine1, addressLine2: $addressLine2, city: $city, state: $state, zipCode: $zipCode, phoneNo: $phoneNo, isPermanent: $isPermanent, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AddressModel &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.addressLine1 == addressLine1 &&
        other.addressLine2 == addressLine2 &&
        other.city == city &&
        other.state == state &&
        other.zipCode == zipCode &&
        other.phoneNo == phoneNo &&
        other.isPermanent == isPermanent &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
        lastName.hashCode ^
        addressLine1.hashCode ^
        addressLine2.hashCode ^
        city.hashCode ^
        state.hashCode ^
        zipCode.hashCode ^
        phoneNo.hashCode ^
        isPermanent.hashCode ^
        createdAt.hashCode;
  }
}
