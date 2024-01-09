import 'dart:convert';

class StuFeeDetailsModel {
  final DemandSlipDetails? demandSlipDetails;
  final StudentDetails? studentDetails;
  final int? slipNo;
  final List<FeeAllocationDetail>? feeAllocationDetails;
  final int? totalWithDue;
  final String? userName;
  final String? total;
  final String? mode;
  final String? status;

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

  StuFeeDetailsModel copyWith({
    DemandSlipDetails? demandSlipDetails,
    StudentDetails? studentDetails,
    int? slipNo,
    List<FeeAllocationDetail>? feeAllocationDetails,
    int? totalWithDue,
    String? userName,
    String? total,
    String? mode,
    String? status,
  }) =>
      StuFeeDetailsModel(
        demandSlipDetails: demandSlipDetails ?? this.demandSlipDetails,
        studentDetails: studentDetails ?? this.studentDetails,
        slipNo: slipNo ?? this.slipNo,
        feeAllocationDetails: feeAllocationDetails ?? this.feeAllocationDetails,
        totalWithDue: totalWithDue ?? this.totalWithDue,
        userName: userName ?? this.userName,
        total: total ?? this.total,
        mode: mode ?? this.mode,
        status: status ?? this.status,
      );

  factory StuFeeDetailsModel.fromJson(String str) =>
      StuFeeDetailsModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StuFeeDetailsModel.fromMap(Map<String, dynamic> json) =>
      StuFeeDetailsModel(
        demandSlipDetails: json["demand_slip_details"] == null
            ? null
            : DemandSlipDetails.fromMap(json["demand_slip_details"]),
        studentDetails: json["student_details"] == null
            ? null
            : StudentDetails.fromMap(json["student_details"]),
        slipNo: json["slip_no"],
        feeAllocationDetails: json["fee_allocation_details"] == null
            ? []
            : List<FeeAllocationDetail>.from(json["fee_allocation_details"]!
                .map((x) => FeeAllocationDetail.fromMap(x))),
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
        "fee_allocation_details": feeAllocationDetails == null
            ? []
            : List<dynamic>.from(feeAllocationDetails!.map((x) => x.toMap())),
        "total_with_due": totalWithDue,
        "user_name": userName,
        "total": total,
        "mode": mode,
        "status": status,
      };
}

class DemandSlipDetails {
  final int? id;
  final int? studentHistoryId;
  final String? totalAmount;
  final int? siteId;
  final int? academicGroupId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? previousDue;
  final String? siteStudentFeeGenerateIds;
  final String? siteStudentFeeWaiverOfferHistoryIds;
  final dynamic paymentDuration;
  final dynamic siteGroupId;
  final String? feeAmount;
  final String? waiverAmount;
  final String? specialWaiverAmount;
  final dynamic offerAmount;
  final int? createdBy;
  final dynamic lastPaymentDate;
  final int? paymentFineStatus;
  final String? delayFine;
  final String? dueFine;
  final dynamic paymentFromDate;
  final dynamic paymentToDate;
  final int? previousSiteStudentFeeDemandSlipDetailId;
  final dynamic previousClassDuePaymentHistoryId;
  final dynamic dueTransferToPromotedStudentHistoryId;
  final dynamic previousAcademicClassDueStatus;
  final int? accountsReceivedStatus;
  final dynamic orderId;
  final dynamic sitePaymentGatewayId;
  final DateTime? createdDate;
  final int? slipNo;

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

  DemandSlipDetails copyWith({
    int? id,
    int? studentHistoryId,
    String? totalAmount,
    int? siteId,
    int? academicGroupId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? previousDue,
    String? siteStudentFeeGenerateIds,
    String? siteStudentFeeWaiverOfferHistoryIds,
    dynamic paymentDuration,
    dynamic siteGroupId,
    String? feeAmount,
    String? waiverAmount,
    String? specialWaiverAmount,
    dynamic offerAmount,
    int? createdBy,
    dynamic lastPaymentDate,
    int? paymentFineStatus,
    String? delayFine,
    String? dueFine,
    dynamic paymentFromDate,
    dynamic paymentToDate,
    int? previousSiteStudentFeeDemandSlipDetailId,
    dynamic previousClassDuePaymentHistoryId,
    dynamic dueTransferToPromotedStudentHistoryId,
    dynamic previousAcademicClassDueStatus,
    int? accountsReceivedStatus,
    dynamic orderId,
    dynamic sitePaymentGatewayId,
    DateTime? createdDate,
    int? slipNo,
  }) =>
      DemandSlipDetails(
        id: id ?? this.id,
        studentHistoryId: studentHistoryId ?? this.studentHistoryId,
        totalAmount: totalAmount ?? this.totalAmount,
        siteId: siteId ?? this.siteId,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        previousDue: previousDue ?? this.previousDue,
        siteStudentFeeGenerateIds:
            siteStudentFeeGenerateIds ?? this.siteStudentFeeGenerateIds,
        siteStudentFeeWaiverOfferHistoryIds:
            siteStudentFeeWaiverOfferHistoryIds ??
                this.siteStudentFeeWaiverOfferHistoryIds,
        paymentDuration: paymentDuration ?? this.paymentDuration,
        siteGroupId: siteGroupId ?? this.siteGroupId,
        feeAmount: feeAmount ?? this.feeAmount,
        waiverAmount: waiverAmount ?? this.waiverAmount,
        specialWaiverAmount: specialWaiverAmount ?? this.specialWaiverAmount,
        offerAmount: offerAmount ?? this.offerAmount,
        createdBy: createdBy ?? this.createdBy,
        lastPaymentDate: lastPaymentDate ?? this.lastPaymentDate,
        paymentFineStatus: paymentFineStatus ?? this.paymentFineStatus,
        delayFine: delayFine ?? this.delayFine,
        dueFine: dueFine ?? this.dueFine,
        paymentFromDate: paymentFromDate ?? this.paymentFromDate,
        paymentToDate: paymentToDate ?? this.paymentToDate,
        previousSiteStudentFeeDemandSlipDetailId:
            previousSiteStudentFeeDemandSlipDetailId ??
                this.previousSiteStudentFeeDemandSlipDetailId,
        previousClassDuePaymentHistoryId: previousClassDuePaymentHistoryId ??
            this.previousClassDuePaymentHistoryId,
        dueTransferToPromotedStudentHistoryId:
            dueTransferToPromotedStudentHistoryId ??
                this.dueTransferToPromotedStudentHistoryId,
        previousAcademicClassDueStatus: previousAcademicClassDueStatus ??
            this.previousAcademicClassDueStatus,
        accountsReceivedStatus:
            accountsReceivedStatus ?? this.accountsReceivedStatus,
        orderId: orderId ?? this.orderId,
        sitePaymentGatewayId: sitePaymentGatewayId ?? this.sitePaymentGatewayId,
        createdDate: createdDate ?? this.createdDate,
        slipNo: slipNo ?? this.slipNo,
      );

  factory DemandSlipDetails.fromJson(String str) =>
      DemandSlipDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DemandSlipDetails.fromMap(Map<String, dynamic> json) =>
      DemandSlipDetails(
        id: json["id"],
        studentHistoryId: json["student_history_id"],
        totalAmount: json["total_amount"],
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        previousDue: json["previous_due"],
        siteStudentFeeGenerateIds: json["site_student_fee_generate_ids"],
        siteStudentFeeWaiverOfferHistoryIds:
            json["site_student_fee_waiver_offer_history_ids"],
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
        previousSiteStudentFeeDemandSlipDetailId:
            json["previous_site_student_fee_demand_slip_detail_id"],
        previousClassDuePaymentHistoryId:
            json["previous_class_due_payment_history_id"],
        dueTransferToPromotedStudentHistoryId:
            json["due_transfer_to_promoted_student_history_id"],
        previousAcademicClassDueStatus:
            json["previous_academic_class_due_status"],
        accountsReceivedStatus: json["accounts_received_status"],
        orderId: json["order_id"],
        sitePaymentGatewayId: json["site_payment_gateway_id"],
        createdDate: json["created_date"] == null
            ? null
            : DateTime.parse(json["created_date"]),
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
        "updated_at": updatedAt?.toIso8601String(),
        "previous_due": previousDue,
        "site_student_fee_generate_ids": siteStudentFeeGenerateIds,
        "site_student_fee_waiver_offer_history_ids":
            siteStudentFeeWaiverOfferHistoryIds,
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
        "previous_site_student_fee_demand_slip_detail_id":
            previousSiteStudentFeeDemandSlipDetailId,
        "previous_class_due_payment_history_id":
            previousClassDuePaymentHistoryId,
        "due_transfer_to_promoted_student_history_id":
            dueTransferToPromotedStudentHistoryId,
        "previous_academic_class_due_status": previousAcademicClassDueStatus,
        "accounts_received_status": accountsReceivedStatus,
        "order_id": orderId,
        "site_payment_gateway_id": sitePaymentGatewayId,
        "created_date":
            "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
        "slip_no": slipNo,
      };
}

class FeeAllocationDetail {
  final int? id;
  final int? academicFeeSubHeadId;
  final int? academicFeeHeadId;
  final int? academicFeeGroupId;
  final int? academicShiftId;
  final dynamic academicSessionId;
  final dynamic academicStudentCategoryId;
  final dynamic academicStudentTypeId;
  final dynamic academicStudentAdmissionTypeId;
  final dynamic academicDepartmentId;
  final int? academicClassId;
  final dynamic academicSectionId;
  final int? academicClassGroupId;
  final dynamic academicSubjectId;
  final int? academicYearId;
  final int? academicVersionId;
  final String? amount;
  final int? siteId;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final int? academicGroupId;
  final String? fineAmount;
  final dynamic fineApplicableDate;
  final int? fineApplicableDay;
  final dynamic siteGroupId;
  final String? feeTypeName;
  final AcademicFee? academicFeeHead;
  final AcademicFee? academicFeeGroup;
  final AcademicFee? academicFeeSubHead;

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

  FeeAllocationDetail copyWith({
    int? id,
    int? academicFeeSubHeadId,
    int? academicFeeHeadId,
    int? academicFeeGroupId,
    int? academicShiftId,
    dynamic academicSessionId,
    dynamic academicStudentCategoryId,
    dynamic academicStudentTypeId,
    dynamic academicStudentAdmissionTypeId,
    dynamic academicDepartmentId,
    int? academicClassId,
    dynamic academicSectionId,
    int? academicClassGroupId,
    dynamic academicSubjectId,
    int? academicYearId,
    int? academicVersionId,
    String? amount,
    int? siteId,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
    int? academicGroupId,
    String? fineAmount,
    dynamic fineApplicableDate,
    int? fineApplicableDay,
    dynamic siteGroupId,
    String? feeTypeName,
    AcademicFee? academicFeeHead,
    AcademicFee? academicFeeGroup,
    AcademicFee? academicFeeSubHead,
  }) =>
      FeeAllocationDetail(
        id: id ?? this.id,
        academicFeeSubHeadId: academicFeeSubHeadId ?? this.academicFeeSubHeadId,
        academicFeeHeadId: academicFeeHeadId ?? this.academicFeeHeadId,
        academicFeeGroupId: academicFeeGroupId ?? this.academicFeeGroupId,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        academicSessionId: academicSessionId ?? this.academicSessionId,
        academicStudentCategoryId:
            academicStudentCategoryId ?? this.academicStudentCategoryId,
        academicStudentTypeId:
            academicStudentTypeId ?? this.academicStudentTypeId,
        academicStudentAdmissionTypeId: academicStudentAdmissionTypeId ??
            this.academicStudentAdmissionTypeId,
        academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
        academicClassId: academicClassId ?? this.academicClassId,
        academicSectionId: academicSectionId ?? this.academicSectionId,
        academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
        academicSubjectId: academicSubjectId ?? this.academicSubjectId,
        academicYearId: academicYearId ?? this.academicYearId,
        academicVersionId: academicVersionId ?? this.academicVersionId,
        amount: amount ?? this.amount,
        siteId: siteId ?? this.siteId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        fineAmount: fineAmount ?? this.fineAmount,
        fineApplicableDate: fineApplicableDate ?? this.fineApplicableDate,
        fineApplicableDay: fineApplicableDay ?? this.fineApplicableDay,
        siteGroupId: siteGroupId ?? this.siteGroupId,
        feeTypeName: feeTypeName ?? this.feeTypeName,
        academicFeeHead: academicFeeHead ?? this.academicFeeHead,
        academicFeeGroup: academicFeeGroup ?? this.academicFeeGroup,
        academicFeeSubHead: academicFeeSubHead ?? this.academicFeeSubHead,
      );

  factory FeeAllocationDetail.fromJson(String str) =>
      FeeAllocationDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeeAllocationDetail.fromMap(Map<String, dynamic> json) =>
      FeeAllocationDetail(
        id: json["id"],
        academicFeeSubHeadId: json["academic_fee_sub_head_id"],
        academicFeeHeadId: json["academic_fee_head_id"],
        academicFeeGroupId: json["academic_fee_group_id"],
        academicShiftId: json["academic_shift_id"],
        academicSessionId: json["academic_session_id"],
        academicStudentCategoryId: json["academic_student_category_id"],
        academicStudentTypeId: json["academic_student_type_id"],
        academicStudentAdmissionTypeId:
            json["academic_student_admission_type_id"],
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
        academicFeeHead: json["academic_fee_head"] == null
            ? null
            : AcademicFee.fromMap(json["academic_fee_head"]),
        academicFeeGroup: json["academic_fee_group"] == null
            ? null
            : AcademicFee.fromMap(json["academic_fee_group"]),
        academicFeeSubHead: json["academic_fee_sub_head"] == null
            ? null
            : AcademicFee.fromMap(json["academic_fee_sub_head"]),
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
  final int? id;
  final String? name;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final HeadKey? headKey;
  final int? headKeyBaseId;

  AcademicFee({
    this.id,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.headKey,
    this.headKeyBaseId,
  });

  AcademicFee copyWith({
    int? id,
    String? name,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
    HeadKey? headKey,
    int? headKeyBaseId,
  }) =>
      AcademicFee(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        headKey: headKey ?? this.headKey,
        headKeyBaseId: headKeyBaseId ?? this.headKeyBaseId,
      );

  factory AcademicFee.fromJson(String str) =>
      AcademicFee.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicFee.fromMap(Map<String, dynamic> json) => AcademicFee(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        headKey: headKeyValues.map[json["head_key"]]!,
        headKeyBaseId: json["head_key_base_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "head_key": headKeyValues.reverse[headKey],
        "head_key_base_id": headKeyBaseId,
      };
}

enum HeadKey { EXAMINATION, GENERAL, STUDENTBASE }

final headKeyValues = EnumValues({
  "examination": HeadKey.EXAMINATION,
  "general": HeadKey.GENERAL,
  "studentbase": HeadKey.STUDENTBASE
});

class StudentDetails {
  final int? id;
  final int? userId;
  final int? academicGroupId;
  final int? academicVersionId;
  final int? academicShiftId;
  final int? academicClassId;
  final dynamic siteBatchDetailId;
  final dynamic academicDepartmentId;
  final dynamic academicResidenceId;
  final dynamic academicTransportId;
  final int? academicSessionId;
  final int? academicStudentCategoryId;
  final dynamic academicStudentTypeId;
  final int? academicStudentAdmissionTypeId;
  final dynamic academicQuataId;
  final dynamic boardRegistrationNumber;
  final dynamic boardRollNumber;
  final List<List<dynamic>>? academicSubjectIds;
  final List<List<dynamic>>? optionalSubjectIds;
  final List<List<dynamic>?>? selectiveMarkinglessSubjectIds;
  final List<List<dynamic>>? compulsorySubjectIds;
  final List<List<dynamic>>? selectiveCompulsorySubjectIds;
  final int? religionSubjectId;
  final int? academicClassGroupId;
  final int? academicSectionId;
  final int? academicYearId;
  final int? studentRollNumber;
  final dynamic registrationNo;
  final int? localGuardianId;
  final dynamic previousAcademicClassId;
  final dynamic previousRollNo;
  final dynamic previousGpa;
  final dynamic previousExamMark;
  final dynamic previousInstituteName;
  final dynamic previousInstituteLocation;
  final dynamic tcNumber;
  final dynamic tcDate;
  final int? siteId;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic previousStudentHistoryId;
  final int? createdBy;
  final int? updatedBy;
  final int? siteStudentRegistrationApplicationId;
  final dynamic exAcademicYearId;
  final dynamic exAcademicShiftId;
  final dynamic exAcademicClassId;
  final dynamic exAcademicDepartmentId;
  final dynamic exAcademicClassGroupId;
  final dynamic exAcademicSectionId;
  final dynamic exAcademicSessionId;
  final dynamic exRollNumber;
  final dynamic exIdCardCode;
  final int? transferStatus;
  final dynamic studentRollNumberPrefix;
  final int? studentEduPaymentStatus;
  final dynamic eduStudentPanelCloseDate;
  final int? siteStudentAdmissionApplicationId;
  final String? fullName;
  final String? studentFullRollNumber;
  final String? fullNameUsername;
  final String? rollFullNameUsername;
  final Student? student;
  final StClass? stClass;
  final AccGroup? accGroup;
  final dynamic section;

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
    this.fullName,
    this.studentFullRollNumber,
    this.fullNameUsername,
    this.rollFullNameUsername,
    this.student,
    this.stClass,
    this.accGroup,
    this.section,
  });

  StudentDetails copyWith({
    int? id,
    int? userId,
    int? academicGroupId,
    int? academicVersionId,
    int? academicShiftId,
    int? academicClassId,
    dynamic siteBatchDetailId,
    dynamic academicDepartmentId,
    dynamic academicResidenceId,
    dynamic academicTransportId,
    int? academicSessionId,
    int? academicStudentCategoryId,
    dynamic academicStudentTypeId,
    int? academicStudentAdmissionTypeId,
    dynamic academicQuataId,
    dynamic boardRegistrationNumber,
    dynamic boardRollNumber,
    List<List<dynamic>>? academicSubjectIds,
    List<List<dynamic>>? optionalSubjectIds,
    List<List<dynamic>?>? selectiveMarkinglessSubjectIds,
    List<List<dynamic>>? compulsorySubjectIds,
    List<List<dynamic>>? selectiveCompulsorySubjectIds,
    int? religionSubjectId,
    int? academicClassGroupId,
    int? academicSectionId,
    int? academicYearId,
    int? studentRollNumber,
    dynamic registrationNo,
    int? localGuardianId,
    dynamic previousAcademicClassId,
    dynamic previousRollNo,
    dynamic previousGpa,
    dynamic previousExamMark,
    dynamic previousInstituteName,
    dynamic previousInstituteLocation,
    dynamic tcNumber,
    dynamic tcDate,
    int? siteId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic previousStudentHistoryId,
    int? createdBy,
    int? updatedBy,
    int? siteStudentRegistrationApplicationId,
    dynamic exAcademicYearId,
    dynamic exAcademicShiftId,
    dynamic exAcademicClassId,
    dynamic exAcademicDepartmentId,
    dynamic exAcademicClassGroupId,
    dynamic exAcademicSectionId,
    dynamic exAcademicSessionId,
    dynamic exRollNumber,
    dynamic exIdCardCode,
    int? transferStatus,
    dynamic studentRollNumberPrefix,
    int? studentEduPaymentStatus,
    dynamic eduStudentPanelCloseDate,
    int? siteStudentAdmissionApplicationId,
    String? fullName,
    String? studentFullRollNumber,
    String? fullNameUsername,
    String? rollFullNameUsername,
    Student? student,
    StClass? stClass,
    AccGroup? accGroup,
    dynamic section,
  }) =>
      StudentDetails(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        academicVersionId: academicVersionId ?? this.academicVersionId,
        academicShiftId: academicShiftId ?? this.academicShiftId,
        academicClassId: academicClassId ?? this.academicClassId,
        siteBatchDetailId: siteBatchDetailId ?? this.siteBatchDetailId,
        academicDepartmentId: academicDepartmentId ?? this.academicDepartmentId,
        academicResidenceId: academicResidenceId ?? this.academicResidenceId,
        academicTransportId: academicTransportId ?? this.academicTransportId,
        academicSessionId: academicSessionId ?? this.academicSessionId,
        academicStudentCategoryId:
            academicStudentCategoryId ?? this.academicStudentCategoryId,
        academicStudentTypeId:
            academicStudentTypeId ?? this.academicStudentTypeId,
        academicStudentAdmissionTypeId: academicStudentAdmissionTypeId ??
            this.academicStudentAdmissionTypeId,
        academicQuataId: academicQuataId ?? this.academicQuataId,
        boardRegistrationNumber:
            boardRegistrationNumber ?? this.boardRegistrationNumber,
        boardRollNumber: boardRollNumber ?? this.boardRollNumber,
        academicSubjectIds: academicSubjectIds ?? this.academicSubjectIds,
        optionalSubjectIds: optionalSubjectIds ?? this.optionalSubjectIds,
        selectiveMarkinglessSubjectIds: selectiveMarkinglessSubjectIds ??
            this.selectiveMarkinglessSubjectIds,
        compulsorySubjectIds: compulsorySubjectIds ?? this.compulsorySubjectIds,
        selectiveCompulsorySubjectIds:
            selectiveCompulsorySubjectIds ?? this.selectiveCompulsorySubjectIds,
        religionSubjectId: religionSubjectId ?? this.religionSubjectId,
        academicClassGroupId: academicClassGroupId ?? this.academicClassGroupId,
        academicSectionId: academicSectionId ?? this.academicSectionId,
        academicYearId: academicYearId ?? this.academicYearId,
        studentRollNumber: studentRollNumber ?? this.studentRollNumber,
        registrationNo: registrationNo ?? this.registrationNo,
        localGuardianId: localGuardianId ?? this.localGuardianId,
        previousAcademicClassId:
            previousAcademicClassId ?? this.previousAcademicClassId,
        previousRollNo: previousRollNo ?? this.previousRollNo,
        previousGpa: previousGpa ?? this.previousGpa,
        previousExamMark: previousExamMark ?? this.previousExamMark,
        previousInstituteName:
            previousInstituteName ?? this.previousInstituteName,
        previousInstituteLocation:
            previousInstituteLocation ?? this.previousInstituteLocation,
        tcNumber: tcNumber ?? this.tcNumber,
        tcDate: tcDate ?? this.tcDate,
        siteId: siteId ?? this.siteId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        previousStudentHistoryId:
            previousStudentHistoryId ?? this.previousStudentHistoryId,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        siteStudentRegistrationApplicationId:
            siteStudentRegistrationApplicationId ??
                this.siteStudentRegistrationApplicationId,
        exAcademicYearId: exAcademicYearId ?? this.exAcademicYearId,
        exAcademicShiftId: exAcademicShiftId ?? this.exAcademicShiftId,
        exAcademicClassId: exAcademicClassId ?? this.exAcademicClassId,
        exAcademicDepartmentId:
            exAcademicDepartmentId ?? this.exAcademicDepartmentId,
        exAcademicClassGroupId:
            exAcademicClassGroupId ?? this.exAcademicClassGroupId,
        exAcademicSectionId: exAcademicSectionId ?? this.exAcademicSectionId,
        exAcademicSessionId: exAcademicSessionId ?? this.exAcademicSessionId,
        exRollNumber: exRollNumber ?? this.exRollNumber,
        exIdCardCode: exIdCardCode ?? this.exIdCardCode,
        transferStatus: transferStatus ?? this.transferStatus,
        studentRollNumberPrefix:
            studentRollNumberPrefix ?? this.studentRollNumberPrefix,
        studentEduPaymentStatus:
            studentEduPaymentStatus ?? this.studentEduPaymentStatus,
        eduStudentPanelCloseDate:
            eduStudentPanelCloseDate ?? this.eduStudentPanelCloseDate,
        siteStudentAdmissionApplicationId: siteStudentAdmissionApplicationId ??
            this.siteStudentAdmissionApplicationId,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        fullNameUsername: fullNameUsername ?? this.fullNameUsername,
        rollFullNameUsername: rollFullNameUsername ?? this.rollFullNameUsername,
        student: student ?? this.student,
        stClass: stClass ?? this.stClass,
        accGroup: accGroup ?? this.accGroup,
        section: section ?? this.section,
      );

  factory StudentDetails.fromJson(String str) =>
      StudentDetails.fromMap(json.decode(str));

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
        academicStudentAdmissionTypeId:
            json["academic_student_admission_type_id"],
        academicQuataId: json["academic_quata_id"],
        boardRegistrationNumber: json["board_registration_number"],
        boardRollNumber: json["board_roll_number"],
        academicSubjectIds: json["academic_subject_ids"] == null
            ? []
            : List<List<dynamic>>.from(json["academic_subject_ids"]!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        optionalSubjectIds: json["optional_subject_ids"] == null
            ? []
            : List<List<dynamic>>.from(json["optional_subject_ids"]!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        selectiveMarkinglessSubjectIds:
            json["selective_markingless_subject_ids"] == null
                ? []
                : List<List<dynamic>?>.from(
                    json["selective_markingless_subject_ids"]!.map((x) =>
                        x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        compulsorySubjectIds: json["compulsory_subject_ids"] == null
            ? []
            : List<List<dynamic>>.from(json["compulsory_subject_ids"]!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        selectiveCompulsorySubjectIds:
            json["selective_compulsory_subject_ids"] == null
                ? []
                : List<List<dynamic>>.from(
                    json["selective_compulsory_subject_ids"]!
                        .map((x) => List<dynamic>.from(x.map((x) => x)))),
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
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        previousStudentHistoryId: json["previous_student_history_id"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        siteStudentRegistrationApplicationId:
            json["site_student_registration_application_id"],
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
        siteStudentAdmissionApplicationId:
            json["site_student_admission_application_id"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        fullNameUsername: json["full_name_username"],
        rollFullNameUsername: json["roll_full_name_username"],
        student:
            json["student"] == null ? null : Student.fromMap(json["student"]),
        stClass:
            json["st_class"] == null ? null : StClass.fromMap(json["st_class"]),
        accGroup: json["acc_group"] == null
            ? null
            : AccGroup.fromMap(json["acc_group"]),
        section: json["section"],
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
        "academic_subject_ids": academicSubjectIds == null
            ? []
            : List<dynamic>.from(academicSubjectIds!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "optional_subject_ids": optionalSubjectIds == null
            ? []
            : List<dynamic>.from(optionalSubjectIds!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds ==
                null
            ? []
            : List<dynamic>.from(selectiveMarkinglessSubjectIds!.map(
                (x) => x == null ? [] : List<dynamic>.from(x!.map((x) => x)))),
        "compulsory_subject_ids": compulsorySubjectIds == null
            ? []
            : List<dynamic>.from(compulsorySubjectIds!
                .map((x) => List<dynamic>.from(x.map((x) => x)))),
        "selective_compulsory_subject_ids":
            selectiveCompulsorySubjectIds == null
                ? []
                : List<dynamic>.from(selectiveCompulsorySubjectIds!
                    .map((x) => List<dynamic>.from(x.map((x) => x)))),
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
        "site_student_registration_application_id":
            siteStudentRegistrationApplicationId,
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
        "site_student_admission_application_id":
            siteStudentAdmissionApplicationId,
        "full_name": fullName,
        "student_full_roll_number": studentFullRollNumber,
        "full_name_username": fullNameUsername,
        "roll_full_name_username": rollFullNameUsername,
        "student": student?.toMap(),
        "st_class": stClass?.toMap(),
        "acc_group": accGroup?.toMap(),
        "section": section,
      };
}

class AcademicSubjectIdClass {
  final int? id;
  final int? belongsToAcademicGroup;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? subjectName;
  final List<AcademicSubjectIdTranslation>? translations;

  AcademicSubjectIdClass({
    this.id,
    this.belongsToAcademicGroup,
    this.createdAt,
    this.updatedAt,
    this.subjectName,
    this.translations,
  });

  AcademicSubjectIdClass copyWith({
    int? id,
    int? belongsToAcademicGroup,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? subjectName,
    List<AcademicSubjectIdTranslation>? translations,
  }) =>
      AcademicSubjectIdClass(
        id: id ?? this.id,
        belongsToAcademicGroup:
            belongsToAcademicGroup ?? this.belongsToAcademicGroup,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        subjectName: subjectName ?? this.subjectName,
        translations: translations ?? this.translations,
      );

  factory AcademicSubjectIdClass.fromJson(String str) =>
      AcademicSubjectIdClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicSubjectIdClass.fromMap(Map<String, dynamic> json) =>
      AcademicSubjectIdClass(
        id: json["id"],
        belongsToAcademicGroup: json["belongs_to_academic_group"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        subjectName: json["subject_name"],
        translations: json["translations"] == null
            ? []
            : List<AcademicSubjectIdTranslation>.from(json["translations"]!
                .map((x) => AcademicSubjectIdTranslation.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "belongs_to_academic_group": belongsToAcademicGroup,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "subject_name": subjectName,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class AcademicSubjectIdTranslation {
  final int? id;
  final String? academicSubjectId;
  final String? subjectName;
  final Locale? locale;

  AcademicSubjectIdTranslation({
    this.id,
    this.academicSubjectId,
    this.subjectName,
    this.locale,
  });

  AcademicSubjectIdTranslation copyWith({
    int? id,
    String? academicSubjectId,
    String? subjectName,
    Locale? locale,
  }) =>
      AcademicSubjectIdTranslation(
        id: id ?? this.id,
        academicSubjectId: academicSubjectId ?? this.academicSubjectId,
        subjectName: subjectName ?? this.subjectName,
        locale: locale ?? this.locale,
      );

  factory AcademicSubjectIdTranslation.fromJson(String str) =>
      AcademicSubjectIdTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AcademicSubjectIdTranslation.fromMap(Map<String, dynamic> json) =>
      AcademicSubjectIdTranslation(
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

enum Locale { BN, EN }

final localeValues = EnumValues({"bn": Locale.BN, "en": Locale.EN});

class AccGroup {
  final int? id;
  final String? groupName;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final dynamic deletedAt;

  AccGroup({
    this.id,
    this.groupName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  AccGroup copyWith({
    int? id,
    String? groupName,
    DateTime? createdAt,
    DateTime? updatedAt,
    dynamic deletedAt,
  }) =>
      AccGroup(
        id: id ?? this.id,
        groupName: groupName ?? this.groupName,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
      );

  factory AccGroup.fromJson(String str) => AccGroup.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AccGroup.fromMap(Map<String, dynamic> json) => AccGroup(
        id: json["id"],
        groupName: json["group_name"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
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
  final int? id;
  final String? className;
  final int? academicGroupPresent;
  final int? serialNo;
  final String? note;
  final int? status;
  final dynamic createdAt;
  final dynamic updatedAt;
  final dynamic deletedAt;
  final dynamic minimumBirthDate;

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

  StClass copyWith({
    int? id,
    String? className,
    int? academicGroupPresent,
    int? serialNo,
    String? note,
    int? status,
    dynamic createdAt,
    dynamic updatedAt,
    dynamic deletedAt,
    dynamic minimumBirthDate,
  }) =>
      StClass(
        id: id ?? this.id,
        className: className ?? this.className,
        academicGroupPresent: academicGroupPresent ?? this.academicGroupPresent,
        serialNo: serialNo ?? this.serialNo,
        note: note ?? this.note,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt ?? this.deletedAt,
        minimumBirthDate: minimumBirthDate ?? this.minimumBirthDate,
      );

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
  final List<AcademicSubjectIdClass>? compulsorySubjectIds;
  final List<AcademicSubjectIdClass>? selectiveCompulsorySubjectIds;
  final List<AcademicSubjectIdClass>? optionalSubjectIds;
  final List<dynamic>? selectiveMarkinglessSubjectIds;
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
  final String? studentFullRollNumber;
  final String? firstName;
  final dynamic lastName;
  final String? address;
  final dynamic spouseName;
  final String? motherName;
  final String? fatherName;
  final String? permanentAddress;
  final List<StudentTranslation>? translations;

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

  Student copyWith({
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
    List<AcademicSubjectIdClass>? compulsorySubjectIds,
    List<AcademicSubjectIdClass>? selectiveCompulsorySubjectIds,
    List<AcademicSubjectIdClass>? optionalSubjectIds,
    List<dynamic>? selectiveMarkinglessSubjectIds,
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
    String? studentFullRollNumber,
    String? firstName,
    dynamic lastName,
    String? address,
    dynamic spouseName,
    String? motherName,
    String? fatherName,
    String? permanentAddress,
    List<StudentTranslation>? translations,
  }) =>
      Student(
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
        academicStudentCategoryId:
            academicStudentCategoryId ?? this.academicStudentCategoryId,
        academicStudentTypeId:
            academicStudentTypeId ?? this.academicStudentTypeId,
        academicStudentAdmissionTypeId: academicStudentAdmissionTypeId ??
            this.academicStudentAdmissionTypeId,
        academicQuataId: academicQuataId ?? this.academicQuataId,
        studentRegistrationNumber:
            studentRegistrationNumber ?? this.studentRegistrationNumber,
        boardRegistrationNumber:
            boardRegistrationNumber ?? this.boardRegistrationNumber,
        religionSubjectId: religionSubjectId ?? this.religionSubjectId,
        academicSubjectIds: academicSubjectIds ?? this.academicSubjectIds,
        compulsorySubjectIds: compulsorySubjectIds ?? this.compulsorySubjectIds,
        selectiveCompulsorySubjectIds:
            selectiveCompulsorySubjectIds ?? this.selectiveCompulsorySubjectIds,
        optionalSubjectIds: optionalSubjectIds ?? this.optionalSubjectIds,
        selectiveMarkinglessSubjectIds: selectiveMarkinglessSubjectIds ??
            this.selectiveMarkinglessSubjectIds,
        guardianStudentRelationId:
            guardianStudentRelationId ?? this.guardianStudentRelationId,
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
        ntrcRegistrationNumber:
            ntrcRegistrationNumber ?? this.ntrcRegistrationNumber,
        status: status ?? this.status,
        dateOfBirth: dateOfBirth ?? this.dateOfBirth,
        siteId: siteId ?? this.siteId,
        academicGroupId: academicGroupId ?? this.academicGroupId,
        deletedAt: deletedAt ?? this.deletedAt,
        locale: locale ?? this.locale,
        lastAcademicGroupId: lastAcademicGroupId ?? this.lastAcademicGroupId,
        siteStudentRegistrationApplicationId:
            siteStudentRegistrationApplicationId ??
                this.siteStudentRegistrationApplicationId,
        presentIdCardCode: presentIdCardCode ?? this.presentIdCardCode,
        exIdCardCode: exIdCardCode ?? this.exIdCardCode,
        studentRollNumberPrefix:
            studentRollNumberPrefix ?? this.studentRollNumberPrefix,
        lastLogin: lastLogin ?? this.lastLogin,
        createdAt: createdAt ?? this.createdAt,
        createdBy: createdBy ?? this.createdBy,
        updatedAt: updatedAt ?? this.updatedAt,
        updatedBy: updatedBy ?? this.updatedBy,
        studentEduPaymentStatus:
            studentEduPaymentStatus ?? this.studentEduPaymentStatus,
        eduStudentPanelCloseDate:
            eduStudentPanelCloseDate ?? this.eduStudentPanelCloseDate,
        smsContactField: smsContactField ?? this.smsContactField,
        fullName: fullName ?? this.fullName,
        studentFullRollNumber:
            studentFullRollNumber ?? this.studentFullRollNumber,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        address: address ?? this.address,
        spouseName: spouseName ?? this.spouseName,
        motherName: motherName ?? this.motherName,
        fatherName: fatherName ?? this.fatherName,
        permanentAddress: permanentAddress ?? this.permanentAddress,
        translations: translations ?? this.translations,
      );

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
        academicStudentAdmissionTypeId:
            json["academic_student_admission_type_id"],
        academicQuataId: json["academic_quata_id"],
        studentRegistrationNumber: json["student_registration_number"],
        boardRegistrationNumber: json["board_registration_number"],
        religionSubjectId: json["religion_subject_id"],
        academicSubjectIds: json["academic_subject_ids"],
        compulsorySubjectIds: json["compulsory_subject_ids"] == null
            ? []
            : List<AcademicSubjectIdClass>.from(json["compulsory_subject_ids"]!
                .map((x) => AcademicSubjectIdClass.fromMap(x))),
        selectiveCompulsorySubjectIds:
            json["selective_compulsory_subject_ids"] == null
                ? []
                : List<AcademicSubjectIdClass>.from(
                    json["selective_compulsory_subject_ids"]!
                        .map((x) => AcademicSubjectIdClass.fromMap(x))),
        optionalSubjectIds: json["optional_subject_ids"] == null
            ? []
            : List<AcademicSubjectIdClass>.from(json["optional_subject_ids"]!
                .map((x) => AcademicSubjectIdClass.fromMap(x))),
        selectiveMarkinglessSubjectIds:
            json["selective_markingless_subject_ids"] == null
                ? []
                : List<dynamic>.from(
                    json["selective_markingless_subject_ids"]!.map((x) => x)),
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
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        siteId: json["site_id"],
        academicGroupId: json["academic_group_id"],
        deletedAt: json["deleted_at"],
        locale: json["locale"],
        lastAcademicGroupId: json["last_academic_group_id"],
        siteStudentRegistrationApplicationId:
            json["site_student_registration_application_id"],
        presentIdCardCode: json["present_id_card_code"],
        exIdCardCode: json["ex_id_card_code"],
        studentRollNumberPrefix: json["student_roll_number_prefix"],
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        studentEduPaymentStatus: json["student_edu_payment_status"],
        eduStudentPanelCloseDate: json["edu_student_panel_close_date"],
        smsContactField: json["sms_contact_field"],
        fullName: json["full_name"],
        studentFullRollNumber: json["student_full_roll_number"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        address: json["address"],
        spouseName: json["spouse_name"],
        motherName: json["mother_name"],
        fatherName: json["father_name"],
        permanentAddress: json["permanent_address"],
        translations: json["translations"] == null
            ? []
            : List<StudentTranslation>.from(json["translations"]!
                .map((x) => StudentTranslation.fromMap(x))),
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
        "compulsory_subject_ids": compulsorySubjectIds == null
            ? []
            : List<dynamic>.from(compulsorySubjectIds!.map((x) => x.toMap())),
        "selective_compulsory_subject_ids":
            selectiveCompulsorySubjectIds == null
                ? []
                : List<dynamic>.from(
                    selectiveCompulsorySubjectIds!.map((x) => x.toMap())),
        "optional_subject_ids": optionalSubjectIds == null
            ? []
            : List<dynamic>.from(optionalSubjectIds!.map((x) => x.toMap())),
        "selective_markingless_subject_ids": selectiveMarkinglessSubjectIds ==
                null
            ? []
            : List<dynamic>.from(selectiveMarkinglessSubjectIds!.map((x) => x)),
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
        "date_of_birth":
            "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "site_id": siteId,
        "academic_group_id": academicGroupId,
        "deleted_at": deletedAt,
        "locale": locale,
        "last_academic_group_id": lastAcademicGroupId,
        "site_student_registration_application_id":
            siteStudentRegistrationApplicationId,
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
        "student_full_roll_number": studentFullRollNumber,
        "first_name": firstName,
        "last_name": lastName,
        "address": address,
        "spouse_name": spouseName,
        "mother_name": motherName,
        "father_name": fatherName,
        "permanent_address": permanentAddress,
        "translations": translations == null
            ? []
            : List<dynamic>.from(translations!.map((x) => x.toMap())),
      };
}

class StudentTranslation {
  final int? id;
  final int? userId;
  final String? firstName;
  final dynamic lastName;
  final String? fatherName;
  final String? motherName;
  final dynamic spouseName;
  final String? address;
  final String? permanentAddress;
  final Locale? locale;
  final dynamic localGuardianName;

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

  StudentTranslation copyWith({
    int? id,
    int? userId,
    String? firstName,
    dynamic lastName,
    String? fatherName,
    String? motherName,
    dynamic spouseName,
    String? address,
    String? permanentAddress,
    Locale? locale,
    dynamic localGuardianName,
  }) =>
      StudentTranslation(
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

  factory StudentTranslation.fromJson(String str) =>
      StudentTranslation.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentTranslation.fromMap(Map<String, dynamic> json) =>
      StudentTranslation(
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
