import 'dart:convert';

class TeachProfileInfoModel {
    int? id;
    String? username;
    String? firstName;
    String? photo;
    String? lastName;
    dynamic fatherName;
    dynamic motherName;
    String? bladeGroup;
    Address? address;

    TeachProfileInfoModel({
        this.id,
        this.username,
        this.firstName,
        this.photo,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.bladeGroup,
        this.address,
    });

    factory TeachProfileInfoModel.fromJson(String str) => TeachProfileInfoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory TeachProfileInfoModel.fromMap(Map<String, dynamic> json) => TeachProfileInfoModel(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        photo: json["photo"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        bladeGroup: json["blade_group"],
        address: json["address"] == null ? null : Address.fromMap(json["address"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "photo": photo,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "blade_group": bladeGroup,
        "address": address?.toMap(),
    };
}

class Address {
    EntAddress? presentAddress;
    EntAddress? permanentAddress;

    Address({
        this.presentAddress,
        this.permanentAddress,
    });

    factory Address.fromJson(String str) => Address.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        presentAddress: json["present_address"] == null ? null : EntAddress.fromMap(json["present_address"]),
        permanentAddress: json["permanent_address"] == null ? null : EntAddress.fromMap(json["permanent_address"]),
    );

    Map<String, dynamic> toMap() => {
        "present_address": presentAddress?.toMap(),
        "permanent_address": permanentAddress?.toMap(),
    };
}

class EntAddress {
    String? countryName;
    String? divisionName;
    String? districtName;
    String? thanaName;
    dynamic addressName;

    EntAddress({
        this.countryName,
        this.divisionName,
        this.districtName,
        this.thanaName,
        this.addressName,
    });

    factory EntAddress.fromJson(String str) => EntAddress.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory EntAddress.fromMap(Map<String, dynamic> json) => EntAddress(
        countryName: json["country_name"],
        divisionName: json["division_name"],
        districtName: json["district_name"],
        thanaName: json["thana_name"],
        addressName: json["address_name"],
    );

    Map<String, dynamic> toMap() => {
        "country_name": countryName,
        "division_name": divisionName,
        "district_name": districtName,
        "thana_name": thanaName,
        "address_name": addressName,
    };
}
