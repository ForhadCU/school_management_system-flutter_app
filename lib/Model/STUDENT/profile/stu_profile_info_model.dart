import 'dart:convert';

class ProfileInfoModel {
    int? id;
    String? username;
    String? firstName;
    dynamic lastName;
    String? photo;
    String? fatherName;
    String? motherName;
    String? bladeGroup;
    AcademicInfo? academicInfo;
    Address? address;

    ProfileInfoModel({
        this.id,
        this.username,
        this.firstName,
        this.lastName,
        this.photo,
        this.fatherName,
        this.motherName,
        this.bladeGroup,
        this.academicInfo,
        this.address,
    });

    ProfileInfoModel copyWith({
        int? id,
        String? username,
        String? firstName,
        dynamic lastName,
        String? photo,
        String? fatherName,
        String? motherName,
        String? bladeGroup,
        AcademicInfo? academicInfo,
        Address? address,
    }) => 
        ProfileInfoModel(
            id: id ?? this.id,
            username: username ?? this.username,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            photo: photo ?? this.photo,
            fatherName: fatherName ?? this.fatherName,
            motherName: motherName ?? this.motherName,
            bladeGroup: bladeGroup ?? this.bladeGroup,
            academicInfo: academicInfo ?? this.academicInfo,
            address: address ?? this.address,
        );

    factory ProfileInfoModel.fromJson(String str) => ProfileInfoModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ProfileInfoModel.fromMap(Map<String, dynamic> json) => ProfileInfoModel(
        id: json["id"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        photo: json["photo"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        bladeGroup: json["blade_group"],
        academicInfo: json["academic_info"] == null ? null : AcademicInfo.fromMap(json["academic_info"]),
        address: json["address"] == null ? null : Address.fromMap(json["address"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "photo": photo,
        "father_name": fatherName,
        "mother_name": motherName,
        "blade_group": bladeGroup,
        "academic_info": academicInfo?.toMap(),
        "address": address?.toMap(),
    };
}

class AcademicInfo {
    String? versionName;
    String? shiftName;
    String? year;
    String? session;
    String? departmentName;
    String? className;
    String? classGroupName;
    String? sectionName;

    AcademicInfo({
        this.versionName,
        this.shiftName,
        this.year,
        this.session,
        this.departmentName,
        this.className,
        this.classGroupName,
        this.sectionName,
    });

    AcademicInfo copyWith({
        String? versionName,
        String? shiftName,
        String? year,
        String? session,
        String? departmentName,
        String? className,
        String? classGroupName,
        String? sectionName,
    }) => 
        AcademicInfo(
            versionName: versionName ?? this.versionName,
            shiftName: shiftName ?? this.shiftName,
            year: year ?? this.year,
            session: session ?? this.session,
            departmentName: departmentName ?? this.departmentName,
            className: className ?? this.className,
            classGroupName: classGroupName ?? this.classGroupName,
            sectionName: sectionName ?? this.sectionName,
        );

    factory AcademicInfo.fromJson(String str) => AcademicInfo.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicInfo.fromMap(Map<String, dynamic> json) => AcademicInfo(
        versionName: json["version_name"],
        shiftName: json["shift_name"],
        year: json["year"],
        session: json["session"],
        departmentName: json["department_name"],
        className: json["class_name"],
        classGroupName: json["class_group_name"],
        sectionName: json["section_name"],
    );

    Map<String, dynamic> toMap() => {
        "version_name": versionName,
        "shift_name": shiftName,
        "year": year,
        "session": session,
        "department_name": departmentName,
        "class_name": className,
        "class_group_name": classGroupName,
        "section_name": sectionName,
    };
}

class Address {
    EntAddress? presentAddress;
    EntAddress? permanentAddress;

    Address({
        this.presentAddress,
        this.permanentAddress,
    });

    Address copyWith({
        EntAddress? presentAddress,
        EntAddress? permanentAddress,
    }) => 
        Address(
            presentAddress: presentAddress ?? this.presentAddress,
            permanentAddress: permanentAddress ?? this.permanentAddress,
        );

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
    String? addressName;

    EntAddress({
        this.countryName,
        this.divisionName,
        this.districtName,
        this.thanaName,
        this.addressName,
    });

    EntAddress copyWith({
        String? countryName,
        String? divisionName,
        String? districtName,
        String? thanaName,
        String? addressName,
    }) => 
        EntAddress(
            countryName: countryName ?? this.countryName,
            divisionName: divisionName ?? this.divisionName,
            districtName: districtName ?? this.districtName,
            thanaName: thanaName ?? this.thanaName,
            addressName: addressName ?? this.addressName,
        );

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
