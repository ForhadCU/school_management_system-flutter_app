import 'dart:convert';

class StuFeeDetailsModel {
    DemandSlipDetails? demandSlipDetails;
    StudentDetails? studentDetails;
    int? slipNo;
    List<FeeAllocationDetail>? feeAllocationDetails;
    int? totalWithDue;
    String? userName;
    String? total;
    String? mode;
    String? status;

    StuFeeDetailsModel({
        this.demandSlipDetails,
        this.studentDetails,
        this.slipNo,
        this.feeAllocationDetails,
        this.totalWithDue,
        this.userName,
        this.total,
        this.mode,
        this.status,
    });

    factory StuFeeDetailsModel.fromJson(String str) => StuFeeDetailsModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StuFeeDetailsModel.fromMap(Map<String, dynamic> json) => StuFeeDetailsModel(
        demandSlipDetails: json["demand_slip_details"] == null ? null : DemandSlipDetails.fromMap(json["demand_slip_details"]),
        studentDetails: json["student_details"] == null ? null : StudentDetails.fromMap(json["student_details"]),
        slipNo: json["slip_no"],
        feeAllocationDetails: json["fee_allocation_details"] == null ? [] : List<FeeAllocationDetail>.from(json["fee_allocation_details"]!.map((x) => FeeAllocationDetail.fromMap(x))),
        totalWithDue: json["total_with_due"],
        userName: json["user_name"],
        total: json["total"],
        mode: json["mode"],
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "demand_slip_details": demandSlipDetails?.toMap(),
        "student_details": studentDetails?.toMap(),
        "slip_no": slipNo,
        "fee_allocation_details": feeAllocationDetails == null ? [] : List<dynamic>.from(feeAllocationDetails!.map((x) => x.toMap())),
        "total_with_due": totalWithDue,
        "user_name": userName,
        "total": total,
        "mode": mode,
        "status": status,
    };
}

class DemandSlipDetails {
    int? id;
    int? studentHistoryId;
    String? totalAmount;
    int? siteId;
    int? academicGroupId;
    int? status;
    DateTime? createdAt;
    dynamic updatedAt;
    String? previousDue;
    String? siteStudentFeeGenerateIds;
    String? siteStudentFeeWaiverOfferHistoryIds;
    dynamic paymentDuration;
    dynamic siteGroupId;
    String? feeAmount;
    String? waiverAmount;
    String? specialWaiverAmount;
    dynamic offerAmount;
    int? createdBy;
    dynamic lastPaymentDate;
    int? paymentFineStatus;
    String? delayFine;
    String? dueFine;
    dynamic paymentFromDate;
    dynamic paymentToDate;
    dynamic previousSiteStudentFeeDemandSlipDetailId;
    dynamic previousClassDuePaymentHistoryId;
    dynamic dueTransferToPromotedStudentHistoryId;
    dynamic previousAcademicClassDueStatus;
    int? accountsReceivedStatus;
    dynamic orderId;
    dynamic sitePaymentGatewayId;
    DateTime? createdDate;
    int? slipNo;

    DemandSlipDetails({
        this.id,
        this.studentHistoryId,
        this.totalAmount,
        this.siteId,
        this.academicGroupId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.previousDue,
        this.siteStudentFeeGenerateIds,
        this.siteStudentFeeWaiverOfferHistoryIds,
        this.paymentDuration,
        this.siteGroupId,
        this.feeAmount,
        this.waiverAmount,
        this.specialWaiverAmount,
        this.offerAmount,
        this.createdBy,
        this.lastPaymentDate,
        this.paymentFineStatus,
        this.delayFine,
        this.dueFine,
        this.paymentFromDate,
        this.paymentToDate,
        this.previousSiteStudentFeeDemandSlipDetailId,
        this.previousClassDuePaymentHistoryId,
        this.dueTransferToPromotedStudentHistoryId,
        this.previousAcademicClassDueStatus,
        this.accountsReceivedStatus,
        this.orderId,
        this.sitePaymentGatewayId,
        this.createdDate,
        this.slipNo,
    });

    factory DemandSlipDetails.fromJson(String str) => DemandSlipDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DemandSlipDetails.fromMap(Map<String, dynamic> json) => DemandSlipDetails(
        id: json["id"],
        studentHistoryId: json["student_history_id"],
        totalAmount: json["total_amount"],
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
        previousDue: json["previous_due"],
        siteStudentFeeGenerateIds: json["site_student_fee_generate_ids"],
        siteStudentFeeWaiverOfferHistoryIds: json["site_student_fee_waiver_offer_history_ids"],
        paymentDuration: json["payment_duration"],
        siteGroupId: json["site_group_id"],
        feeAmount: json["fee_amount"],
        waiverAmount: json["waiver_amount"],
        specialWaiverAmount: json["special_waiver_amount"],
        offerAmount: json["offer_amount"],
        createdBy: json["created_by"],
        lastPaymentDate: json["last_payment_date"],
        paymentFineStatus: json["payment_fine_status"],
        delayFine: json["delay_fine"],
        dueFine: json["due_fine"],
        paymentFromDate: json["payment_from_date"],
        paymentToDate: json["payment_to_date"],
        previousSiteStudentFeeDemandSlipDetailId: json["previous_site_student_fee_demand_slip_detail_id"],
        previousClassDuePaymentHistoryId: json["previous_class_due_payment_history_id"],
        dueTransferToPromotedStudentHistoryId: json["due_transfer_to_promoted_student_history_id"],
        previousAcademicClassDueStatus: json["previous_academic_class_due_status"],
        accountsReceivedStatus: json["accounts_received_status"],
        orderId: json["order_id"],
        sitePaymentGatewayId: json["site_payment_gateway_id"],
        createdDate: json["created_date"] == null ? null : DateTime.parse(json["created_date"]),
        slipNo: json["slip_no"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "student_history_id": studentHistoryId,
        "total_amount": totalAmount,
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt,
        "previous_due": previousDue,
        "site_student_fee_generate_ids": siteStudentFeeGenerateIds,
        "site_student_fee_waiver_offer_history_ids": siteStudentFeeWaiverOfferHistoryIds,
        "payment_duration": paymentDuration,
        "site_group_id": siteGroupId,
        "fee_amount": feeAmount,
        "waiver_amount": waiverAmount,
        "special_waiver_amount": specialWaiverAmount,
        "offer_amount": offerAmount,
        "created_by": createdBy,
        "last_payment_date": lastPaymentDate,
        "payment_fine_status": paymentFineStatus,
        "delay_fine": delayFine,
        "due_fine": dueFine,
        "payment_from_date": paymentFromDate,
        "payment_to_date": paymentToDate,
        "previous_site_student_fee_demand_slip_detail_id": previousSiteStudentFeeDemandSlipDetailId,
        "previous_class_due_payment_history_id": previousClassDuePaymentHistoryId,
        "due_transfer_to_promoted_student_history_id": dueTransferToPromotedStudentHistoryId,
        "previous_academic_class_due_status": previousAcademicClassDueStatus,
        "accounts_received_status": accountsReceivedStatus,
        "order_id": orderId,
        "site_payment_gateway_id": sitePaymentGatewayId,
        "created_date": "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
        "slip_no": slipNo,
    };
}

class FeeAllocationDetail {
    int? id;
    int? academicFeeSubHeadId;
    int? academicFeeHeadId;
    int? academicFeeGroupId;
    int? academicShiftId;
    dynamic academicSessionId;
    dynamic academicStudentCategoryId;
    dynamic academicStudentTypeId;
    dynamic academicStudentAdmissionTypeId;
    dynamic academicDepartmentId;
    int? academicClassId;
    dynamic academicSectionId;
    int? academicClassGroupId;
    dynamic academicSubjectId;
    int? academicYearId;
    int? academicVersionId;
    String? amount;
    int? siteId;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    int? academicGroupId;
    String? fineAmount;
    dynamic fineApplicableDate;
    int? fineApplicableDay;
    dynamic siteGroupId;
    String? feeTypeName;
    AcademicFee? academicFeeHead;
    AcademicFee? academicFeeGroup;
    AcademicFee? academicFeeSubHead;

    FeeAllocationDetail({
        this.id,
        this.academicFeeSubHeadId,
        this.academicFeeHeadId,
        this.academicFeeGroupId,
        this.academicShiftId,
        this.academicSessionId,
        this.academicStudentCategoryId,
        this.academicStudentTypeId,
        this.academicStudentAdmissionTypeId,
        this.academicDepartmentId,
        this.academicClassId,
        this.academicSectionId,
        this.academicClassGroupId,
        this.academicSubjectId,
        this.academicYearId,
        this.academicVersionId,
        this.amount,
        this.siteId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.academicGroupId,
        this.fineAmount,
        this.fineApplicableDate,
        this.fineApplicableDay,
        this.siteGroupId,
        this.feeTypeName,
        this.academicFeeHead,
        this.academicFeeGroup,
        this.academicFeeSubHead,
    });

    factory FeeAllocationDetail.fromJson(String str) => FeeAllocationDetail.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory FeeAllocationDetail.fromMap(Map<String, dynamic> json) => FeeAllocationDetail(
        id: json["id"],
        academicFeeSubHeadId: json["academic_fee_sub_head_id"],
        academicFeeHeadId: json["academic_fee_head_id"],
        academicFeeGroupId: json["academic_fee_group_id"],
        academicShiftId: json["academic_shift_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        academicStudentTypeId: json["academic_student_type_id"],
        academicStudentAdmissionTypeId: json["academic_student_admission_type_id"],
        academicDepartmentId: json["academic_department_id"],
        academicClassId: json["academic_class_id"],
        academicSectionId: json["academic_section_id"],
        academicClassGroupId: json["academic_class_group_id"],
        academicSubjectId: json["academic_subject_id"],
        academicYearId: json["academic_year_id"],
        academicVersionId: json["academic_version_id"],
        amount: json["amount"],
        siteId: json["site_id"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        academicGroupId: json["academic_group_id"],
        fineAmount: json["fine_amount"],
        fineApplicableDate: json["fine_applicable_date"],
        fineApplicableDay: json["fine_applicable_day"],
        siteGroupId: json["site_group_id"],
        feeTypeName: json["fee_type_name"],
        academicFeeHead: json["academic_fee_head"] == null ? null : AcademicFee.fromMap(json["academic_fee_head"]),
        academicFeeGroup: json["academic_fee_group"] == null ? null : AcademicFee.fromMap(json["academic_fee_group"]),
        academicFeeSubHead: json["academic_fee_sub_head"] == null ? null : AcademicFee.fromMap(json["academic_fee_sub_head"]),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_fee_sub_head_id": academicFeeSubHeadId,
        "academic_fee_head_id": academicFeeHeadId,
        "academic_fee_group_id": academicFeeGroupId,
        "academic_shift_id": academicShiftId,
        "academic_session_id": academicSessionId,
        "academic_student_category_id": academicStudentCategoryId,
        "academic_student_type_id": academicStudentTypeId,
        "academic_student_admission_type_id": academicStudentAdmissionTypeId,
        "academic_department_id": academicDepartmentId,
        "academic_class_id": academicClassId,
        "academic_section_id": academicSectionId,
        "academic_class_group_id": academicClassGroupId,
        "academic_subject_id": academicSubjectId,
        "academic_year_id": academicYearId,
        "academic_version_id": academicVersionId,
        "amount": amount,
        "site_id": siteId,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "academic_group_id": academicGroupId,
        "fine_amount": fineAmount,
        "fine_applicable_date": fineApplicableDate,
        "fine_applicable_day": fineApplicableDay,
        "site_group_id": siteGroupId,
        "fee_type_name": feeTypeName,
        "academic_fee_head": academicFeeHead?.toMap(),
        "academic_fee_group": academicFeeGroup?.toMap(),
        "academic_fee_sub_head": academicFeeSubHead?.toMap(),
    };
}

class AcademicFee {
    int? id;
    String? name;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    String? headKey;
    int? headKeyBaseId;

    AcademicFee({
        this.id,
        this.name,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.headKey,
        this.headKeyBaseId,
    });

    factory AcademicFee.fromJson(String str) => AcademicFee.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicFee.fromMap(Map<String, dynamic> json) => AcademicFee(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        headKey: json["head_key"],
        headKeyBaseId: json["head_key_base_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "head_key": headKey,
        "head_key_base_id": headKeyBaseId,
    };
}

class StudentDetails {
    int? id;
    int? userId;
    int? academicGroupId;
    int? academicVersionId;
    int? academicShiftId;
    int? academicClassId;
    dynamic siteBatchDetailId;
    dynamic academicDepartmentId;
    dynamic academicResidenceId;
    dynamic academicTransportId;
    int? academicSessionId;
    int? academicStudentCategoryId;
    int? academicStudentTypeId;
    int? academicStudentAdmissionTypeId;
    dynamic academicQuataId;
    dynamic boardRegistrationNumber;
    dynamic boardRollNumber;
    List<List<dynamic>>? academicSubjectIds;
    List<List<dynamic>?>? optionalSubjectIds;
    List<List<dynamic>?>? selectiveMarkinglessSubjectIds;
    List<List<dynamic>?>? compulsorySubjectIds;
    List<List<dynamic>?>? selectiveCompulsorySubjectIds;
    int? religionSubjectId;
    int? academicClassGroupId;
    dynamic academicSectionId;
    int? academicYearId;
    int? studentRollNumber;
    dynamic registrationNo;
    int? localGuardianId;
    dynamic previousAcademicClassId;
    dynamic previousRollNo;
    dynamic previousGpa;
    dynamic previousExamMark;
    dynamic previousInstituteName;
    dynamic previousInstituteLocation;
    dynamic tcNumber;
    dynamic tcDate;
    int? siteId;
    int? status;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic previousStudentHistoryId;
    int? createdBy;
    int? updatedBy;
    dynamic siteStudentRegistrationApplicationId;
    dynamic exAcademicYearId;
    dynamic exAcademicShiftId;
    dynamic exAcademicClassId;
    dynamic exAcademicDepartmentId;
    dynamic exAcademicClassGroupId;
    dynamic exAcademicSectionId;
    dynamic exAcademicSessionId;
    dynamic exRollNumber;
    dynamic exIdCardCode;
    int? transferStatus;
    dynamic studentRollNumberPrefix;
    int? studentEduPaymentStatus;
    dynamic eduStudentPanelCloseDate;
    dynamic siteStudentAdmissionApplicationId;
    dynamic houseId;
    String? fullName;
    String? studentFullRollNumber;
    String? fullNameUsername;
    String? rollFullNameUsername;
    Student? student;
    StClass? stClass;
    AccGroup? accGroup;
    dynamic section;
    dynamic department;

    StudentDetails({
        this.id,
        this.userId,
        this.academicGroupId,
        this.academicVersionId,
        this.academicShiftId,
        this.academicClassId,
        this.siteBatchDetailId,
        this.academicDepartmentId,
        this.academicResidenceId,
        this.academicTransportId,
        this.academicSessionId,
        this.academicStudentCategoryId,
        this.academicStudentTypeId,
        this.academicStudentAdmissionTypeId,
        this.academicQuataId,
        this.boardRegistrationNumber,
        this.boardRollNumber,
        this.academicSubjectIds,
        this.optionalSubjectIds,
        this.selectiveMarkinglessSubjectIds,
        this.compulsorySubjectIds,
        this.selectiveCompulsorySubjectIds,
        this.religionSubjectId,
        this.academicClassGroupId,
        this.academicSectionId,
        this.academicYearId,
        this.studentRollNumber,
        this.registrationNo,
        this.localGuardianId,
        this.previousAcademicClassId,
        this.previousRollNo,
        this.previousGpa,
        this.previousExamMark,
        this.previousInstituteName,
        this.previousInstituteLocation,
        this.tcNumber,
        this.tcDate,
        this.siteId,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.previousStudentHistoryId,
        this.createdBy,
        this.updatedBy,
        this.siteStudentRegistrationApplicationId,
        this.exAcademicYearId,
        this.exAcademicShiftId,
        this.exAcademicClassId,
        this.exAcademicDepartmentId,
        this.exAcademicClassGroupId,
        this.exAcademicSectionId,
        this.exAcademicSessionId,
        this.exRollNumber,
        this.exIdCardCode,
        this.transferStatus,
        this.studentRollNumberPrefix,
        this.studentEduPaymentStatus,
        this.eduStudentPanelCloseDate,
        this.siteStudentAdmissionApplicationId,
        this.houseId,
        this.fullName,
        this.studentFullRollNumber,
        this.fullNameUsername,
        this.rollFullNameUsername,
        this.student,
        this.stClass,
        this.accGroup,
        this.section,
        this.department,
    });

    factory StudentDetails.fromJson(String str) => StudentDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StudentDetails.fromMap(Map<String, dynamic> json) => StudentDetails(
        id: json["id"],
        userId: json["user_id"],
        academicGroupId: json["academic_group_id"],
        academicVersionId: json["academic_version_id"],
        academicShiftId: json["academic_shift_id"],
        academicClassId: json["academic_class_id"],
        siteBatchDetailId: json["site_batch_detail_id"],
        academicDepartmentId: json["academic_department_id"],
        academicResidenceId: json["academic_residence_id"],
        academicTransportId: json["academic_transport_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        academicStudentTypeId: json["academic_student_type_id"],
        academicStudentAdmissionTypeId: json["academic_student_admission_type_id"],
        academicQuataId: json["academic_quata_id"],
        boardRegistrationNumber: json["board_registration_number"],
        boardRollNumber: json["board_roll_number"],
        academicSubjectIds: json["academic_subject_ids"] == null ? [] : List<List<dynamic>>.from(json["academic_subject_ids"]!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        optionalSubjectIds: json["optional_subject_ids"] == null ? [] : List<List<dynamic>?>.from(json["optional_subject_ids"]!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        selectiveMarkinglessSubjectIds: json["selective_markingless_subject_ids"] == null ? [] : List<List<dynamic>?>.from(json["selective_markingless_subject_ids"]!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        compulsorySubjectIds: json["compulsory_subject_ids"] == null ? [] : List<List<dynamic>?>.from(json["compulsory_subject_ids"]!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        selectiveCompulsorySubjectIds: json["selective_compulsory_subject_ids"] == null ? [] : List<List<dynamic>?>.from(json["selective_compulsory_subject_ids"]!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        religionSubjectId: json["religion_subject_id"],
        academicClassGroupId: json["academic_class_group_id"],
        academicSectionId: json["academic_section_id"],
        academicYearId: json["academic_year_id"],
        studentRollNumber: json["student_roll_number"],
        registrationNo: json["registration_no"],
        localGuardianId: json["local_guardian_id"],
        previousAcademicClassId: json["previous_academic_class_id"],
        previousRollNo: json["previous_roll_no"],
        previousGpa: json["previous_gpa"],
        previousExamMark: json["previous_exam_mark"],
        previousInstituteName: json["previous_institute_name"],
        previousInstituteLocation: json["previous_institute_location"],
        tcNumber: json["tc_number"],
        tcDate: json["tc_date"],
        siteId: json["site_id"],
        status: json["status"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        previousStudentHistoryId: json["previous_student_history_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        siteStudentRegistrationApplicationId: json["site_student_registration_application_id"],
        exAcademicYearId: json["ex_academic_year_id"],
        exAcademicShiftId: json["ex_academic_shift_id"],
        exAcademicClassId: json["ex_academic_class_id"],
        exAcademicDepartmentId: json["ex_academic_department_id"],
        exAcademicClassGroupId: json["ex_academic_class_group_id"],
        exAcademicSectionId: json["ex_academic_section_id"],
        exAcademicSessionId: json["ex_academic_session_id"],
        exRollNumber: json["ex_roll_number"],
        exIdCardCode: json["ex_id_card_code"],
        transferStatus: json["transfer_status"],
        studentRollNumberPrefix: json["student_roll_number_prefix"],
        studentEduPaymentStatus: json["student_edu_payment_status"],
        eduStudentPanelCloseDate: json["edu_student_panel_close_date"],
        siteStudentAdmissionApplicationId: json["site_student_admission_application_id"],
        houseId: json["house_id"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        fullNameUsername: json["full_name_username"],
        rollFullNameUsername: json["roll_full_name_username"],
        student: json["student"] == null ? null : Student.fromMap(json["student"]),
        stClass: json["st_class"] == null ? null : StClass.fromMap(json["st_class"]),
        accGroup: json["acc_group"] == null ? null : AccGroup.fromMap(json["acc_group"]),
        section: json["section"],
        department: json["department"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "academic_group_id": academicGroupId,
        "academic_version_id": academicVersionId,
        "academic_shift_id": academicShiftId,
        "academic_class_id": academicClassId,
        "site_batch_detail_id": siteBatchDetailId,
        "academic_department_id": academicDepartmentId,
        "academic_residence_id": academicResidenceId,
        "academic_transport_id": academicTransportId,
        "academic_session_id": academicSessionId,
        "academic_student_category_id": academicStudentCategoryId,
        "academic_student_type_id": academicStudentTypeId,
        "academic_student_admission_type_id": academicStudentAdmissionTypeId,
        "academic_quata_id": academicQuataId,
        "board_registration_number": boardRegistrationNumber,
        "board_roll_number": boardRollNumber,
        "academic_subject_ids": academicSubjectIds == null ? [] : List<dynamic>.from(academicSubjectIds!.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "optional_subject_ids": optionalSubjectIds == null ? [] : List<dynamic>.from(optionalSubjectIds!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds == null ? [] : List<dynamic>.from(selectiveMarkinglessSubjectIds!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "compulsory_subject_ids": compulsorySubjectIds == null ? [] : List<dynamic>.from(compulsorySubjectIds!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "selective_compulsory_subject_ids": selectiveCompulsorySubjectIds == null ? [] : List<dynamic>.from(selectiveCompulsorySubjectIds!.map((x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "religion_subject_id": religionSubjectId,
        "academic_class_group_id": academicClassGroupId,
        "academic_section_id": academicSectionId,
        "academic_year_id": academicYearId,
        "student_roll_number": studentRollNumber,
        "registration_no": registrationNo,
        "local_guardian_id": localGuardianId,
        "previous_academic_class_id": previousAcademicClassId,
        "previous_roll_no": previousRollNo,
        "previous_gpa": previousGpa,
        "previous_exam_mark": previousExamMark,
        "previous_institute_name": previousInstituteName,
        "previous_institute_location": previousInstituteLocation,
        "tc_number": tcNumber,
        "tc_date": tcDate,
        "site_id": siteId,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "previous_student_history_id": previousStudentHistoryId,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "site_student_registration_application_id": siteStudentRegistrationApplicationId,
        "ex_academic_year_id": exAcademicYearId,
        "ex_academic_shift_id": exAcademicShiftId,
        "ex_academic_class_id": exAcademicClassId,
        "ex_academic_department_id": exAcademicDepartmentId,
        "ex_academic_class_group_id": exAcademicClassGroupId,
        "ex_academic_section_id": exAcademicSectionId,
        "ex_academic_session_id": exAcademicSessionId,
        "ex_roll_number": exRollNumber,
        "ex_id_card_code": exIdCardCode,
        "transfer_status": transferStatus,
        "student_roll_number_prefix": studentRollNumberPrefix,
        "student_edu_payment_status": studentEduPaymentStatus,
        "edu_student_panel_close_date": eduStudentPanelCloseDate,
        "site_student_admission_application_id": siteStudentAdmissionApplicationId,
        "house_id": houseId,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "full_name_username": fullNameUsername,
        "roll_full_name_username": rollFullNameUsername,
        "student": student?.toMap(),
        "st_class": stClass?.toMap(),
        "acc_group": accGroup?.toMap(),
        "section": section,
        "department": department,
    };
}

class AcademicSubjectIdClass {
    int? id;
    int? belongsToAcademicGroup;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? subjectName;
    List<AcademicSubjectIdTranslation>? translations;

    AcademicSubjectIdClass({
        this.id,
        this.belongsToAcademicGroup,
        this.createdAt,
        this.updatedAt,
        this.subjectName,
        this.translations,
    });

    factory AcademicSubjectIdClass.fromJson(String str) => AcademicSubjectIdClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSubjectIdClass.fromMap(Map<String, dynamic> json) => AcademicSubjectIdClass(
        id: json["id"],
        belongsToAcademicGroup: json["belongs_to_academic_group"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        subjectName: json["subject_name"],
        translations: json["translations"] == null ? [] : List<AcademicSubjectIdTranslation>.from(json["translations"]!.map((x) => AcademicSubjectIdTranslation.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "belongs_to_academic_group": belongsToAcademicGroup,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subject_name": subjectName,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class AcademicSubjectIdTranslation {
    int? id;
    String? academicSubjectId;
    String? subjectName;
    Locale? locale;

    AcademicSubjectIdTranslation({
        this.id,
        this.academicSubjectId,
        this.subjectName,
        this.locale,
    });

    factory AcademicSubjectIdTranslation.fromJson(String str) => AcademicSubjectIdTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AcademicSubjectIdTranslation.fromMap(Map<String, dynamic> json) => AcademicSubjectIdTranslation(
        id: json["id"],
        academicSubjectId: json["academic_subject_id"],
        subjectName: json["subject_name"],
        locale: localeValues.map[json["locale"]]!,
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "academic_subject_id": academicSubjectId,
        "subject_name": subjectName,
        "locale": localeValues.reverse[locale],
    };
}

enum Locale {
    BN,
    EN
}

final localeValues = EnumValues({
    "bn": Locale.BN,
    "en": Locale.EN
});

class AccGroup {
    int? id;
    String? groupName;
    DateTime? createdAt;
    DateTime? updatedAt;
    dynamic deletedAt;

    AccGroup({
        this.id,
        this.groupName,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
    });

    factory AccGroup.fromJson(String str) => AccGroup.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory AccGroup.fromMap(Map<String, dynamic> json) => AccGroup(
        id: json["id"],
        groupName: json["group_name"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "group_name": groupName,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted_at": deletedAt,
    };
}

class StClass {
    int? id;
    String? className;
    int? academicGroupPresent;
    int? serialNo;
    String? note;
    int? status;
    dynamic createdAt;
    dynamic updatedAt;
    dynamic deletedAt;
    dynamic minimumBirthDate;

    StClass({
        this.id,
        this.className,
        this.academicGroupPresent,
        this.serialNo,
        this.note,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.deletedAt,
        this.minimumBirthDate,
    });

    factory StClass.fromJson(String str) => StClass.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StClass.fromMap(Map<String, dynamic> json) => StClass(
        id: json["id"],
        className: json["class_name"],
        academicGroupPresent: json["academic_group_present"],
        serialNo: json["serial_no"],
        note: json["note"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        minimumBirthDate: json["minimum_birth_date"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "class_name": className,
        "academic_group_present": academicGroupPresent,
        "serial_no": serialNo,
        "note": note,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "minimum_birth_date": minimumBirthDate,
    };
}

class Student {
    int? id;
    String? username;
    String? userType;
    dynamic email;
    int? canUpdate;
    String? alias;
    dynamic employeeId;
    int? instituteHead;
    dynamic signature;
    int? employeeSerial;
    int? companyBranchId;
    dynamic biometricId;
    int? fingerTaken;
    int? attendanceSms;
    String? nameNativeLanguage;
    String? contactNumber;
    dynamic bloodGroupId;
    dynamic motherOccupationId;
    dynamic motherYearlyIncome;
    dynamic motherContactNumber;
    dynamic motherEmail;
    dynamic motherNid;
    dynamic motherBcn;
    dynamic fatherOccupationId;
    dynamic fatherYearlyIncome;
    dynamic fatherContactNumber;
    dynamic fatherEmail;
    dynamic fatherNid;
    dynamic fatherBcn;
    int? presentCountryId;
    int? presentDivisionId;
    int? presentDistrictId;
    int? presentThanaId;
    int? permanentCountryId;
    int? permanentDivisionId;
    int? permanentDistrictId;
    int? permanentThanaId;
    int? genderId;
    int? religionId;
    int? academicVersionId;
    int? academicYearId;
    int? academicSessionId;
    int? academicStudentCategoryId;
    int? academicStudentTypeId;
    int? academicStudentAdmissionTypeId;
    dynamic academicQuataId;
    dynamic studentRegistrationNumber;
    dynamic boardRegistrationNumber;
    dynamic boardRollNumber;
    int? religionSubjectId;
    String? academicSubjectIds;
    List<dynamic>? compulsorySubjectIds;
    List<dynamic>? selectiveCompulsorySubjectIds;
    List<dynamic>? optionalSubjectIds;
    List<dynamic>? selectiveMarkinglessSubjectIds;
    dynamic guardianStudentRelationId;
    int? academicClassId;
    dynamic siteBatchDetailId;
    dynamic academicSectionId;
    int? academicClassGroupId;
    int? studentRollNumber;
    dynamic profession;
    int? localGuardianUserId;
    dynamic academicDepartmentId;
    dynamic academicResidenceId;
    dynamic academicTransportId;
    dynamic designationId;
    dynamic empCategoryId;
    dynamic empPositionId;
    int? academicShiftId;
    dynamic deptJoinDate;
    dynamic phone;
    dynamic emergencyContact;
    dynamic nidNumber;
    dynamic passportNo;
    dynamic birthCertificateNo;
    dynamic nationality;
    dynamic instituteJoiningDate;
    dynamic ntrcRegistrationNumber;
    int? status;
    DateTime? dateOfBirth;
    int? siteId;
    int? academicGroupId;
    dynamic deletedAt;
    dynamic locale;
    dynamic lastAcademicGroupId;
    dynamic siteStudentRegistrationApplicationId;
    dynamic presentIdCardCode;
    dynamic exIdCardCode;
    dynamic studentRollNumberPrefix;
    DateTime? lastLogin;
    DateTime? createdAt;
    int? createdBy;
    DateTime? updatedAt;
    int? updatedBy;
    int? studentEduPaymentStatus;
    dynamic eduStudentPanelCloseDate;
    String? smsContactField;
    dynamic houseId;
    String? fullName;
    String? studentFullRollNumber;
    String? firstName;
    dynamic lastName;
    dynamic address;
    dynamic spouseName;
    String? motherName;
    String? fatherName;
    dynamic permanentAddress;
    List<StudentTranslation>? translations;

    Student({
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
        this.boardRollNumber,
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
        this.houseId,
        this.fullName,
        this.studentFullRollNumber,
        this.firstName,
        this.lastName,
        this.address,
        this.spouseName,
        this.motherName,
        this.fatherName,
        this.permanentAddress,
        this.translations,
    });

    factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Student.fromMap(Map<String, dynamic> json) => Student(
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
        boardRollNumber: json["board_roll_number"],
        religionSubjectId: json["religion_subject_id"],
        academicSubjectIds: json["academic_subject_ids"],
        compulsorySubjectIds: json["compulsory_subject_ids"] == null ? [] : List<dynamic>.from(json["compulsory_subject_ids"]!.map((x) => x)),
        selectiveCompulsorySubjectIds: json["selective_compulsory_subject_ids"] == null ? [] : List<dynamic>.from(json["selective_compulsory_subject_ids"]!.map((x) => x)),
        optionalSubjectIds: json["optional_subject_ids"] == null ? [] : List<dynamic>.from(json["optional_subject_ids"]!.map((x) => x)),
        selectiveMarkinglessSubjectIds: json["selective_markingless_subject_ids"] == null ? [] : List<dynamic>.from(json["selective_markingless_subject_ids"]!.map((x) => x)),
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
        houseId: json["house_id"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        spouseName: json["spouse_name"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        translations: json["translations"] == null ? [] : List<StudentTranslation>.from(json["translations"]!.map((x) => StudentTranslation.fromMap(x))),
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
        "board_roll_number": boardRollNumber,
        "religion_subject_id": religionSubjectId,
        "academic_subject_ids": academicSubjectIds,
        "compulsory_subject_ids": compulsorySubjectIds == null ? [] : List<dynamic>.from(compulsorySubjectIds!.map((x) => x)),
        "selective_compulsory_subject_ids": selectiveCompulsorySubjectIds == null ? [] : List<dynamic>.from(selectiveCompulsorySubjectIds!.map((x) => x)),
        "optional_subject_ids": optionalSubjectIds == null ? [] : List<dynamic>.from(optionalSubjectIds!.map((x) => x)),
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds == null ? [] : List<dynamic>.from(selectiveMarkinglessSubjectIds!.map((x) => x)),
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
        "house_id": houseId,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "spouse_name": spouseName,
        "mother_name": motherName,
        "father_name": fatherName,
        "permanent_address": permanentAddress,
        "translations": translations == null ? [] : List<dynamic>.from(translations!.map((x) => x.toMap())),
    };
}

class StudentTranslation {
    int? id;
    int? userId;
    String? firstName;
    dynamic lastName;
    String? fatherName;
    String? motherName;
    dynamic spouseName;
    dynamic address;
    dynamic permanentAddress;
    Locale? locale;
    dynamic localGuardianName;

    StudentTranslation({
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

    factory StudentTranslation.fromJson(String str) => StudentTranslation.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory StudentTranslation.fromMap(Map<String, dynamic> json) => StudentTranslation(
        id: json["id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        fatherName: json["father_name"],
        motherName: json["mother_name"],
        spouseName: json["spouse_name"],
        address: json["address"],
        permanentAddress: json["permanent_address"],
        locale: localeValues.map[json["locale"]]!,
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
        "locale": localeValues.reverse[locale],
        "local_guardian_name": localGuardianName,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
