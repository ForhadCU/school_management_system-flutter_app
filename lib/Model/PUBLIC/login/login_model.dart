import 'dart:convert';

class LoginApiModel {
    final User? user;
    final String? token;

    LoginApiModel({
        this.user,
        this.token,
    });

    LoginApiModel copyWith({
        User? user,
        String? token,
    }) => 
        LoginApiModel(
            user: user ?? this.user,
            token: token ?? this.token,
        );

    factory LoginApiModel.fromJson(String str) => LoginApiModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory LoginApiModel.fromMap(Map<String, dynamic> json) => LoginApiModel(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "token": token,
    };
}

class User {
    final int? id;
    final String? username;
    final String? userType;
    final dynamic email;
    final int? canUpdate;
    final String? alias;
    final dynamic employeeId;
    final int? instituteHead;
    final dynamic signature;
    final int? employeeSerial;
    final int? companyBranchId;
    final dynamic biometricId;
    final int? fingerTaken;
    final int? attendanceSms;
    final String? nameNativeLanguage;
    final String? contactNumber;
    final dynamic bloodGroupId;
    final int? motherOccupationId;
    final dynamic motherYearlyIncome;
    final String? motherContactNumber;
    final dynamic motherEmail;
    final String? motherNid;
    final dynamic motherBcn;
    final int? fatherOccupationId;
    final int? fatherYearlyIncome;
    final dynamic fatherContactNumber;
    final dynamic fatherEmail;
    final String? fatherNid;
    final dynamic fatherBcn;
    final int? presentCountryId;
    final int? presentDivisionId;
    final int? presentDistrictId;
    final dynamic presentThanaId;
    final int? permanentCountryId;
    final int? permanentDivisionId;
    final int? permanentDistrictId;
    final int? permanentThanaId;
    final int? genderId;
    final int? religionId;
    final int? academicVersionId;
    final int? academicYearId;
    final int? academicSessionId;
    final int? academicStudentCategoryId;
    final dynamic academicStudentTypeId;
    final int? academicStudentAdmissionTypeId;
    final dynamic academicQuataId;
    final dynamic studentRegistrationNumber;
    final dynamic boardRegistrationNumber;
    final int? religionSubjectId;
    final String? academicSubjectIds;
    final String? compulsorySubjectIds;
    final String? selectiveCompulsorySubjectIds;
    final String? optionalSubjectIds;
    final dynamic selectiveMarkinglessSubjectIds;
    final int? guardianStudentRelationId;
    final int? academicClassId;
    final dynamic siteBatchDetailId;
    final int? academicSectionId;
    final int? academicClassGroupId;
    final int? studentRollNumber;
    final dynamic profession;
    final int? localGuardianUserId;
    final dynamic academicDepartmentId;
    final dynamic academicResidenceId;
    final dynamic academicTransportId;
    final dynamic designationId;
    final dynamic empCategoryId;
    final dynamic empPositionId;
    final int? academicShiftId;
    final dynamic deptJoinDate;
    final dynamic phone;
    final dynamic emergencyContact;
    final dynamic nidNumber;
    final dynamic passportNo;
    final dynamic birthCertificateNo;
    final dynamic nationality;
    final dynamic instituteJoiningDate;
    final dynamic ntrcRegistrationNumber;
    final int? status;
    final DateTime? dateOfBirth;
    final int? siteId;
    final int? academicGroupId;
    final dynamic deletedAt;
    final dynamic locale;
    final dynamic lastAcademicGroupId;
    final int? siteStudentRegistrationApplicationId;
    final String? presentIdCardCode;
    final dynamic exIdCardCode;
    final dynamic studentRollNumberPrefix;
    final DateTime? lastLogin;
    final DateTime? createdAt;
    final int? createdBy;
    final DateTime? updatedAt;
    final int? updatedBy;
    final int? studentEduPaymentStatus;
    final dynamic eduStudentPanelCloseDate;
    final String? smsContactField;
    final String? fullName;
    final String? firstName;
    final dynamic lastName;
    final String? address;
    final String? motherName;
    final String? fatherName;
    final String? permanentAddress;
    final List<Translation>? translations;

    User({
        this.id,
        this.username,
        this.userType,
        this.email,
        this.canUpdate,
        this.alias,
        this.employeeId,
        this.instituteHead,
        this.signature,
        this.employeeSerial,
        this.companyBranchId,
        this.biometricId,
        this.fingerTaken,
        this.attendanceSms,
        this.nameNativeLanguage,
        this.contactNumber,
        this.bloodGroupId,
        this.motherOccupationId,
        this.motherYearlyIncome,
        this.motherContactNumber,
        this.motherEmail,
        this.motherNid,
        this.motherBcn,
        this.fatherOccupationId,
        this.fatherYearlyIncome,
        this.fatherContactNumber,
        this.fatherEmail,
        this.fatherNid,
        this.fatherBcn,
        this.presentCountryId,
        this.presentDivisionId,
        this.presentDistrictId,
        this.presentThanaId,
        this.permanentCountryId,
        this.permanentDivisionId,
        this.permanentDistrictId,
        this.permanentThanaId,
        this.genderId,
        this.religionId,
        this.academicVersionId,
        this.academicYearId,
        this.academicSessionId,
        this.academicStudentCategoryId,
        this.academicStudentTypeId,
        this.academicStudentAdmissionTypeId,
        this.academicQuataId,
        this.studentRegistrationNumber,
        this.boardRegistrationNumber,
        this.religionSubjectId,
        this.academicSubjectIds,
        this.compulsorySubjectIds,
        this.selectiveCompulsorySubjectIds,
        this.optionalSubjectIds,
        this.selectiveMarkinglessSubjectIds,
        this.guardianStudentRelationId,
        this.academicClassId,
        this.siteBatchDetailId,
        this.academicSectionId,
        this.academicClassGroupId,
        this.studentRollNumber,
        this.profession,
        this.localGuardianUserId,
        this.academicDepartmentId,
        this.academicResidenceId,
        this.academicTransportId,
        this.designationId,
        this.empCategoryId,
        this.empPositionId,
        this.academicShiftId,
        this.deptJoinDate,
        this.phone,
        this.emergencyContact,
        this.nidNumber,
        this.passportNo,
        this.birthCertificateNo,
        this.nationality,
        this.instituteJoiningDate,
        this.ntrcRegistrationNumber,
        this.status,
        this.dateOfBirth,
        this.siteId,
        this.academicGroupId,
        this.deletedAt,
        this.locale,
        this.lastAcademicGroupId,
        this.siteStudentRegistrationApplicationId,
        this.presentIdCardCode,
        this.exIdCardCode,
        this.studentRollNumberPrefix,
        this.lastLogin,
        this.createdAt,
        this.createdBy,
        this.updatedAt,
        this.updatedBy,
        this.studentEduPaymentStatus,
        this.eduStudentPanelCloseDate,
        this.smsContactField,
        this.fullName,
        this.firstName,
        this.lastName,
        this.address,
        this.motherName,
        this.fatherName,
        this.permanentAddress,
        this.translations,
    });

    User copyWith({
        int? id,
        String? username,
        String? userType,
        dynamic email,
        int? canUpdate,
        String? alias,
        dynamic employeeId,
        int? instituteHead,
        dynamic signature,
        int? employeeSerial,
        int? companyBranchId,
        dynamic biometricId,
        int? fingerTaken,
        int? attendanceSms,
        String? nameNativeLanguage,
        String? contactNumber,
        dynamic bloodGroupId,
        int? motherOccupationId,
        dynamic motherYearlyIncome,
        String? motherContactNumber,
        dynamic motherEmail,
        String? motherNid,
        dynamic motherBcn,
        int? fatherOccupationId,
        int? fatherYearlyIncome,
        dynamic fatherContactNumber,
        dynamic fatherEmail,
        String? fatherNid,
        dynamic fatherBcn,
        int? presentCountryId,
        int? presentDivisionId,
        int? presentDistrictId,
        dynamic presentThanaId,
        int? permanentCountryId,
        int? permanentDivisionId,
        int? permanentDistrictId,
        int? permanentThanaId,
        int? genderId,
        int? religionId,
        int? academicVersionId,
        int? academicYearId,
        int? academicSessionId,
        int? academicStudentCategoryId,
        dynamic academicStudentTypeId,
        int? academicStudentAdmissionTypeId,
        dynamic academicQuataId,
        dynamic studentRegistrationNumber,
        dynamic boardRegistrationNumber,
        int? religionSubjectId,
        String? academicSubjectIds,
        String? compulsorySubjectIds,
        String? selectiveCompulsorySubjectIds,
        String? optionalSubjectIds,
        dynamic selectiveMarkinglessSubjectIds,
        int? guardianStudentRelationId,
        int? academicClassId,
        dynamic siteBatchDetailId,
        int? academicSectionId,
        int? academicClassGroupId,
        int? studentRollNumber,
        dynamic profession,
        int? localGuardianUserId,
        dynamic academicDepartmentId,
        dynamic academicResidenceId,
        dynamic academicTransportId,
        dynamic designationId,
        dynamic empCategoryId,
        dynamic empPositionId,
        int? academicShiftId,
        dynamic deptJoinDate,
        dynamic phone,
        dynamic emergencyContact,
        dynamic nidNumber,
        dynamic passportNo,
        dynamic birthCertificateNo,
        dynamic nationality,
        dynamic instituteJoiningDate,
        dynamic ntrcRegistrationNumber,
        int? status,
        DateTime? dateOfBirth,
        int? siteId,
        int? academicGroupId,
        dynamic deletedAt,
        dynamic locale,
        dynamic lastAcademicGroupId,
        int? siteStudentRegistrationApplicationId,
        String? presentIdCardCode,
        dynamic exIdCardCode,
        dynamic studentRollNumberPrefix,
        DateTime? lastLogin,
        DateTime? createdAt,
        int? createdBy,
        DateTime? updatedAt,
        int? updatedBy,
        int? studentEduPaymentStatus,
        dynamic eduStudentPanelCloseDate,
        String? smsContactField,
        String? fullName,
        String? firstName,
        dynamic lastName,
        String? address,
        String? motherName,
        String? fatherName,
        String? permanentAddress,
        List<Translation>? translations,
    }) => 
        User(
            id: id ?? this.id,
            username: username ?? this.username,
            userType: userType ?? this.userType,
            email: email ?? this.email,
            canUpdate: canUpdate ?? this.canUpdate,
            alias: alias ?? this.alias,
            employeeId: employeeId ?? this.employeeId,
            instituteHead: instituteHead ?? this.instituteHead,
            signature: signature ?? this.signature,
            employeeSerial: employeeSerial ?? this.employeeSerial,
            companyBranchId: companyBranchId ?? this.companyBranchId,
            biometricId: biometricId ?? this.biometricId,
            fingerTaken: fingerTaken ?? this.fingerTaken,
            attendanceSms: attendanceSms ?? this.attendanceSms,
            nameNativeLanguage: nameNativeLanguage ?? this.nameNativeLanguage,
            contactNumber: contactNumber ?? this.contactNumber,
            bloodGroupId: bloodGroupId ?? this.bloodGroupId,
            motherOccupationId: motherOccupationId ?? this.motherOccupationId,
            motherYearlyIncome: motherYearlyIncome ?? this.motherYearlyIncome,
            motherContactNumber: motherContactNumber ?? this.motherContactNumber,
            motherEmail: motherEmail ?? this.motherEmail,
            motherNid: motherNid ?? this.motherNid,
            motherBcn: motherBcn ?? this.motherBcn,
            fatherOccupationId: fatherOccupationId ?? this.fatherOccupationId,
            fatherYearlyIncome: fatherYearlyIncome ?? this.fatherYearlyIncome,
            fatherContactNumber: fatherContactNumber ?? this.fatherContactNumber,
            fatherEmail: fatherEmail ?? this.fatherEmail,
            fatherNid: fatherNid ?? this.fatherNid,
            fatherBcn: fatherBcn ?? this.fatherBcn,
            presentCountryId: presentCountryId ?? this.presentCountryId,
            presentDivisionId: presentDivisionId ?? this.presentDivisionId,
            presentDistrictId: presentDistrictId ?? this.presentDistrictId,
            presentThanaId: presentThanaId ?? this.presentThanaId,
            permanentCountryId: permanentCountryId ?? this.permanentCountryId,
            permanentDivisionId: permanentDivisionId ?? this.permanentDivisionId,
            permanentDistrictId: permanentDistrictId ?? this.permanentDistrictId,
            permanentThanaId: permanentThanaId ?? this.permanentThanaId,
            genderId: genderId ?? this.genderId,
            religionId: religionId ?? this.religionId,
            academicVersionId: academicVersionId ?? this.academicVersionId,
            academicYearId: academicYearId ?? this.academicYearId,
            academicSessionId: academicSessionId ?? this.academicSessionId,
            academicStudentCategoryId: academicStudentCategoryId ?? this.academicStudentCategoryId,
            academicStudentTypeId: academicStudentTypeId ?? this.academicStudentTypeId,
            academicStudentAdmissionTypeId: academicStudentAdmissionTypeId ?? this.academicStudentAdmissionTypeId,
            academicQuataId: academicQuataId ?? this.academicQuataId,
            studentRegistrationNumber: studentRegistrationNumber ?? this.studentRegistrationNumber,
            boardRegistrationNumber: boardRegistrationNumber ?? this.boardRegistrationNumber,
            religionSubjectId: religionSubjectId ?? this.religionSubjectId,
            academicSubjectIds: academicSubjectIds ?? this.academicSubjectIds,
            compulsorySubjectIds: compulsorySubjectIds ?? this.compulsorySubjectIds,
            selectiveCompulsorySubjectIds: selectiveCompulsorySubjectIds ?? this.selectiveCompulsorySubjectIds,
            optionalSubjectIds: optionalSubjectIds ?? this.optionalSubjectIds,
            selectiveMarkinglessSubjectIds: selectiveMarkinglessSubjectIds ?? this.selectiveMarkinglessSubjectIds,
            guardianStudentRelationId: guardianStudentRelationId ?? this.guardianStudentRelationId,
            academicClassId: academicClassId ?? this.academicClassId,
            siteBatchDetailId: siteBatchDetailId ?? this.siteBatchDetailId,
            academicSectionId: academicSectionId ?? this.academicSectionId,
            academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
            studentRollNumber: studentRollNumber ?? this.studentRollNumber,
            profession: profession ?? this.profession,
            localGuardianUserId: localGuardianUserId ?? this.localGuardianUserId,
            academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
            academicResidenceId: academicResidenceId ?? this.academicResidenceId,
            academicTransportId: academicTransportId ?? this.academicTransportId,
            designationId: designationId ?? this.designationId,
            empCategoryId: empCategoryId ?? this.empCategoryId,
            empPositionId: empPositionId ?? this.empPositionId,
            academicShiftId: academicShiftId ?? this.academicShiftId,
            deptJoinDate: deptJoinDate ?? this.deptJoinDate,
            phone: phone ?? this.phone,
            emergencyContact: emergencyContact ?? this.emergencyContact,
            nidNumber: nidNumber ?? this.nidNumber,
            passportNo: passportNo ?? this.passportNo,
            birthCertificateNo: birthCertificateNo ?? this.birthCertificateNo,
            nationality: nationality ?? this.nationality,
            instituteJoiningDate: instituteJoiningDate ?? this.instituteJoiningDate,
            ntrcRegistrationNumber: ntrcRegistrationNumber ?? this.ntrcRegistrationNumber,
            status: status ?? this.status,
            dateOfBirth: dateOfBirth ?? this.dateOfBirth,
            siteId: siteId ?? this.siteId,
            academicGroupId: academicGroupId ?? this.academicGroupId,
            deletedAt: deletedAt ?? this.deletedAt,
            locale: locale ?? this.locale,
            lastAcademicGroupId: lastAcademicGroupId ?? this.lastAcademicGroupId,
            siteStudentRegistrationApplicationId: siteStudentRegistrationApplicationId ?? this.siteStudentRegistrationApplicationId,
            presentIdCardCode: presentIdCardCode ?? this.presentIdCardCode,
            exIdCardCode: exIdCardCode ?? this.exIdCardCode,
            studentRollNumberPrefix: studentRollNumberPrefix ?? this.studentRollNumberPrefix,
            lastLogin: lastLogin ?? this.lastLogin,
            createdAt: createdAt ?? this.createdAt,
            createdBy: createdBy ?? this.createdBy,
            updatedAt: updatedAt ?? this.updatedAt,
            updatedBy: updatedBy ?? this.updatedBy,
            studentEduPaymentStatus: studentEduPaymentStatus ?? this.studentEduPaymentStatus,
            eduStudentPanelCloseDate: eduStudentPanelCloseDate ?? this.eduStudentPanelCloseDate,
            smsContactField: smsContactField ?? this.smsContactField,
            fullName: fullName ?? this.fullName,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            address: address ?? this.address,
            motherName: motherName ?? this.motherName,
            fatherName: fatherName ?? this.fatherName,
            permanentAddress: permanentAddress ?? this.permanentAddress,
            translations: translations ?? this.translations,
        );

    factory User.fromJson(String str) => User.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        userType: json["user_type"],
        email: json["email"],
        canUpdate: json["can_update"],
        alias: json["alias"],
        employeeId: json["employee_id"],
        instituteHead: json["institute_head"],
        signature: json["signature"],
        employeeSerial: json["employee_serial"],
        companyBranchId: json["company_branch_id"],
        biometricId: json["biometric_id"],
        fingerTaken: json["finger_taken"],
        attendanceSms: json["attendance_sms"],
        nameNativeLanguage: json["name_native_language"],
        contactNumber: json["contact_number"],
        bloodGroupId: json["blood_group_id"],
        motherOccupationId: json["mother_occupation_id"],
        motherYearlyIncome: json["mother_yearly_income"],
        motherContactNumber: json["mother_contact_number"],
        motherEmail: json["mother_email"],
        motherNid: json["mother_nid"],
        motherBcn: json["mother_bcn"],
        fatherOccupationId: json["father_occupation_id"],
        fatherYearlyIncome: json["father_yearly_income"],
        fatherContactNumber: json["father_contact_number"],
        fatherEmail: json["father_email"],
        fatherNid: json["father_nid"],
        fatherBcn: json["father_bcn"],
        presentCountryId: json["present_country_id"],
        presentDivisionId: json["present_division_id"],
        presentDistrictId: json["present_district_id"],
        presentThanaId: json["present_thana_id"],
        permanentCountryId: json["permanent_country_id"],
        permanentDivisionId: json["permanent_division_id"],
        permanentDistrictId: json["permanent_district_id"],
        permanentThanaId: json["permanent_thana_id"],
        genderId: json["gender_id"],
        religionId: json["religion_id"],
        academicVersionId: json["academic_version_id"],
        academicYearId: json["academic_year_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        academicStudentTypeId: json["academic_student_type_id"],
        academicStudentAdmissionTypeId: json["academic_student_admission_type_id"],
        academicQuataId: json["academic_quata_id"],
        studentRegistrationNumber: json["student_registration_number"],
        boardRegistrationNumber: json["board_registration_number"],
        religionSubjectId: json["religion_subject_id"],
        academicSubjectIds: json["academic_subject_ids"],
        compulsorySubjectIds: json["compulsory_subject_ids"],
        selectiveCompulsorySubjectIds: json["selective_compulsory_subject_ids"],
        optionalSubjectIds: json["optional_subject_ids"],
        selectiveMarkinglessSubjectIds: json["selective_markingless_subject_ids"],
        guardianStudentRelationId: json["guardian_student_relation_id"],
        academicClassId: json["academic_class_id"],
        siteBatchDetailId: json["site_batch_detail_id"],
        academicSectionId: json["academic_section_id"],
        academicClassGroupId: json["academic_class_group_id"],
        studentRollNumber: json["student_roll_number"],
        profession: json["profession"],
        localGuardianUserId: json["local_guardian_user_id"],
        academicDepartmentId: json["academic_department_id"],
        academicResidenceId: json["academic_residence_id"],
        academicTransportId: json["academic_transport_id"],
        designationId: json["designation_id"],
        empCategoryId: json["emp_category_id"],
        empPositionId: json["emp_position_id"],
        academicShiftId: json["academic_shift_id"],
        deptJoinDate: json["dept_join_date"],
        phone: json["phone"],
        emergencyContact: json["emergency_contact"],
        nidNumber: json["nid_number"],
        passportNo: json["passport_no"],
        birthCertificateNo: json["birth_certificate_no"],
        nationality: json["nationality"],
        instituteJoiningDate: json["institute_joining_date"],
        ntrcRegistrationNumber: json["ntrc_registration_number"],
        status: json["status"],
        dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        deletedAt: json["deleted_at"],
        locale: json["locale"],
        lastAcademicGroupId: json["last_academic_group_id"],
        siteStudentRegistrationApplicationId: json["site_student_registration_application_id"],
        presentIdCardCode: json["present_id_card_code"],
        exIdCardCode: json["ex_id_card_code"],
        studentRollNumberPrefix: json["student_roll_number_prefix"],
        lastLogin: json["last_login"] == null ? null : DateTime.parse(json["last_login"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        studentEduPaymentStatus: json["student_edu_payment_status"],
        eduStudentPanelCloseDate: json["edu_student_panel_close_date"],
        smsContactField: json["sms_contact_field"],
        fullName: json["full_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        translations: json["translations"] == null ? [] : List<Translation>.from(json["translations"]!.map((x) => Translation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "user_type": userType,
        "email": email,
        "can_update": canUpdate,
        "alias": alias,
        "employee_id": employeeId,
        "institute_head": instituteHead,
        "signature": signature,
        "employee_serial": employeeSerial,
        "company_branch_id": companyBranchId,
        "biometric_id": biometricId,
        "finger_taken": fingerTaken,
        "attendance_sms": attendanceSms,
        "name_native_language": nameNativeLanguage,
        "contact_number": contactNumber,
        "blood_group_id": bloodGroupId,
        "mother_occupation_id": motherOccupationId,
        "mother_yearly_income": motherYearlyIncome,
        "mother_contact_number": motherContactNumber,
        "mother_email": motherEmail,
        "mother_nid": motherNid,
        "mother_bcn": motherBcn,
        "father_occupation_id": fatherOccupationId,
        "father_yearly_income": fatherYearlyIncome,
        "father_contact_number": fatherContactNumber,
        "father_email": fatherEmail,
        "father_nid": fatherNid,
        "father_bcn": fatherBcn,
        "present_country_id": presentCountryId,
        "present_division_id": presentDivisionId,
        "present_district_id": presentDistrictId,
        "present_thana_id": presentThanaId,
        "permanent_country_id": permanentCountryId,
        "permanent_division_id": permanentDivisionId,
        "permanent_district_id": permanentDistrictId,
        "permanent_thana_id": permanentThanaId,
        "gender_id": genderId,
        "religion_id": religionId,
        "academic_version_id": academicVersionId,
        "academic_year_id": academicYearId,
        "academic_session_id": academicSessionId,
        "academic_student_category_id": academicStudentCategoryId,
        "academic_student_type_id": academicStudentTypeId,
        "academic_student_admission_type_id": academicStudentAdmissionTypeId,
        "academic_quata_id": academicQuataId,
        "student_registration_number": studentRegistrationNumber,
        "board_registration_number": boardRegistrationNumber,
        "religion_subject_id": religionSubjectId,
        "academic_subject_ids": academicSubjectIds,
        "compulsory_subject_ids": compulsorySubjectIds,
        "selective_compulsory_subject_ids": selectiveCompulsorySubjectIds,
        "optional_subject_ids": optionalSubjectIds,
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds,
        "guardian_student_relation_id": guardianStudentRelationId,
        "academic_class_id": academicClassId,
        "site_batch_detail_id": siteBatchDetailId,
        "academic_section_id": academicSectionId,
        "academic_class_group_id": academicClassGroupId,
        "student_roll_number": studentRollNumber,
        "profession": profession,
        "local_guardian_user_id": localGuardianUserId,
        "academic_department_id": academicDepartmentId,
        "academic_residence_id": academicResidenceId,
        "academic_transport_id": academicTransportId,
        "designation_id": designationId,
        "emp_category_id": empCategoryId,
        "emp_position_id": empPositionId,
        "academic_shift_id": academicShiftId,
        "dept_join_date": deptJoinDate,
        "phone": phone,
        "emergency_contact": emergencyContact,
        "nid_number": nidNumber,
        "passport_no": passportNo,
        "birth_certificate_no": birthCertificateNo,
        "nationality": nationality,
        "institute_joining_date": instituteJoiningDate,
        "ntrc_registration_number": ntrcRegistrationNumber,
        "status": status,
        "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "deleted_at": deletedAt,
        "locale": locale,
        "last_academic_group_id": lastAcademicGroupId,
        "site_student_registration_application_id": siteStudentRegistrationApplicationId,
        "present_id_card_code": presentIdCardCode,
        "ex_id_card_code": exIdCardCode,
        "student_roll_number_prefix": studentRollNumberPrefix,
        "last_login": lastLogin?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt?.toIso8601String(),
        "updated_by": updatedBy,
        "student_edu_payment_status": studentEduPaymentStatus,
        "edu_student_panel_close_date": eduStudentPanelCloseDate,
        "sms_contact_field": smsContactField,
        "full_name": fullName,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "mother_name": motherName,
        "father_name": fatherName,
        "permanent_address": permanentAddress,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class Translation {
    final int? id;
    final int? userId;
    final String? firstName;
    final dynamic lastName;
    final String? fatherName;
    final String? motherName;
    final dynamic spouseName;
    final String? address;
    final String? permanentAddress;
    final String? locale;
    final dynamic localGuardianName;

    Translation({
        this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.fatherName,
        this.motherName,
        this.spouseName,
        this.address,
        this.permanentAddress,
        this.locale,
        this.localGuardianName,
    });

    Translation copyWith({
        int? id,
        int? userId,
        String? firstName,
        dynamic lastName,
        String? fatherName,
        String? motherName,
        dynamic spouseName,
        String? address,
        String? permanentAddress,
        String? locale,
        dynamic localGuardianName,
    }) => 
        Translation(
            id: id ?? this.id,
            userId: userId ?? this.userId,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
            fatherName: fatherName ?? this.fatherName,
            motherName: motherName ?? this.motherName,
            spouseName: spouseName ?? this.spouseName,
            address: address ?? this.address,
            permanentAddress: permanentAddress ?? this.permanentAddress,
            locale: locale ?? this.locale,
            localGuardianName: localGuardianName ?? this.localGuardianName,
        );

    factory Translation.fromJson(String str) => Translation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Translation.fromMap(Map<String, dynamic> json) => Translation(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        spouseName: json["spouse_name"],
        address: json["address"],
        permanentAddress: json["permanent_address"],
        locale: json["locale"],
        localGuardianName: json["local_guardian_name"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "father_name": fatherName,
        "mother_name": motherName,
        "spouse_name": spouseName,
        "address": address,
        "permanent_address": permanentAddress,
        "locale": locale,
        "local_guardian_name": localGuardianName,
    };
}
