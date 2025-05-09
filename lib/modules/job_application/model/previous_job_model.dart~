class JobExperience {
  final String previousInstituteName;
  final String previousInstituteSortCode;
  final String previousInstitutePostCode;
  final String previousInstituteTelephoneNo;
  final String previousInstitutePosition;
  final String managerName;
  final String salary;
  final String startDate;
  final String endDate;
  final String reasonForLeaving;

  JobExperience({
    required this.previousInstituteName,
    required this.previousInstituteSortCode,
    required this.previousInstitutePostCode,
    required this.previousInstituteTelephoneNo,
    required this.previousInstitutePosition,
    required this.managerName,
    required this.salary,
    required this.startDate,
    required this.endDate,
    required this.reasonForLeaving,
  });

  /// Convert object to JSON
  Map<String, dynamic> toJson() {
    return {
      "previousInstituteName": previousInstituteName,
      "previousInstituteSortCode": previousInstituteSortCode,
      "previousInstitutePostCode": previousInstitutePostCode,
      "previousInstituteTelephoneNo": previousInstituteTelephoneNo,
      "previousInstitutePosition": previousInstitutePosition,
      "managerName": managerName,
      "salary": salary,
      "startDate": startDate,
      "endDate": endDate,
      "reasonForLeaving": reasonForLeaving,
    };
  }

  /// Create object from JSON
  factory JobExperience.fromJson(Map<String, dynamic> json) {
    return JobExperience(
      previousInstituteName: json["previousInstituteName"] ?? "",
      previousInstituteSortCode: json["previousInstituteSortCode"] ?? "",
      previousInstitutePostCode: json["previousInstitutePostCode"] ?? "",
      previousInstituteTelephoneNo: json["previousInstituteTelephoneNo"] ?? "",
      previousInstitutePosition: json["previousInstitutePosition"] ?? "",
      managerName: json["managerName"] ?? "",
      salary: json["salary"] ?? "",
      startDate: json["startDate"] ?? "",
      endDate: json["endDate"] ?? "",
      reasonForLeaving: json["reasonForLeaving"] ?? "",
    );
  }

  /// CopyWith function
  JobExperience copyWith({
    String? previousInstituteName,
    String? previousInstituteSortCode,
    String? previousInstitutePostCode,
    String? previousInstituteTelephoneNo,
    String? previousInstitutePosition,
    String? managerName,
    String? salary,
    String? startDate,
    String? endDate,
    String? reasonForLeaving,
  }) {
    return JobExperience(
      previousInstituteName:
          previousInstituteName ?? this.previousInstituteName,
      previousInstituteSortCode:
          previousInstituteSortCode ?? this.previousInstituteSortCode,
      previousInstitutePostCode:
          previousInstitutePostCode ?? this.previousInstitutePostCode,
      previousInstituteTelephoneNo:
          previousInstituteTelephoneNo ?? this.previousInstituteTelephoneNo,
      previousInstitutePosition:
          previousInstitutePosition ?? this.previousInstitutePosition,
      managerName: managerName ?? this.managerName,
      salary: salary ?? this.salary,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      reasonForLeaving: reasonForLeaving ?? this.reasonForLeaving,
    );
  }
}
