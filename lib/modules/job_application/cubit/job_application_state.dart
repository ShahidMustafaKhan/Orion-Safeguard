part of 'job_application_cubit.dart';

enum ValidationStatus { validated, error, none }

class JobApplicationState extends Equatable {
  final File? profilePicture;

  final String positionAppliedFor;
  final File? attachedDocument;
  final String attachedDocumentName;
  final String title;
  final String surname;
  final String forename;
  final String surnameAtBirth;

  final String permanentAddress;
  final String postCode;
  final String permanentAddressFromDate;
  final String permanentAddressToDate;
  final String previousAddress;
  final String previousAddressPostCode;
  final String previousAddressFromDate;
  final String previousAddressToDate;
  final String mobileNo;
  final String email;
  final String telephone;
  final String nationality;
  final String placeOfEntry;
  final String dateOfEntry;
  final bool workPermit;
  final String niNo;
  final String passportNo;
  final String siaLicenseSector;
  final String siaLicenseNo;

  final String relationshipKin;
  final String nameKin;
  final String telephoneKin;
  final String mobileNoKin;
  final String addressKin;
  final String postCodeKin;

  final String drivingType;
  final bool ownTransport;
  final String drivingLicenseNo;
  final String dvlaLicenseCheckCode;
  final bool disqualified;
  final bool motoringConviction;
  final String motoringConvictionDetails;

  final bool hasCriminalConvictionRecord;
  final bool outStandingCriminalConviction;
  final bool bankruptcy;
  final bool courtOrders;
  final String additionalOffenceDetails;

  final String instituteType;
  final String instituteName;
  final String instituteAddress;
  final String educationFrom;
  final String educationTo;
  final String grades;

  final String ethnicOrigin;

  final String bankName;
  final String accountHolderName;
  final String sortCode;
  final String accountNo;

  final List<JobExperience> jobExperience;

  final String applicantName;
  final String signature;
  final String submissionDate;

  final int currentStep;
  final ValidationStatus validationStatus;
  final String? errorValidationMessage;

  final PostApiStatus submissionStatus;
  final String? errorMessage;

  const JobApplicationState({
    this.profilePicture,
    this.positionAppliedFor = '',
    this.attachedDocument,
    this.attachedDocumentName = '',
    this.title = '',
    this.surname = '',
    this.forename = '',
    this.surnameAtBirth = '',
    this.permanentAddress = '',
    this.postCode = '',
    this.permanentAddressFromDate = '',
    this.permanentAddressToDate = '',
    this.previousAddress = '',
    this.previousAddressFromDate = '',
    this.previousAddressToDate = '',
    this.previousAddressPostCode = '',
    this.mobileNo = '',
    this.email = '',
    this.telephone = '',
    this.nationality = '',
    this.placeOfEntry = '',
    this.dateOfEntry = '',
    this.workPermit = false,
    this.niNo = '',
    this.passportNo = '',
    this.siaLicenseSector = '',
    this.siaLicenseNo = '',
    this.relationshipKin = '',
    this.nameKin = '',
    this.telephoneKin = '',
    this.mobileNoKin = '',
    this.addressKin = '',
    this.postCodeKin = '',
    this.drivingType = '',
    this.ownTransport = false,
    this.drivingLicenseNo = '',
    this.dvlaLicenseCheckCode = '',
    this.disqualified = false,
    this.motoringConviction = false,
    this.motoringConvictionDetails = '',
    this.hasCriminalConvictionRecord = false,
    this.outStandingCriminalConviction = false,
    this.bankruptcy = false,
    this.courtOrders = false,
    this.additionalOffenceDetails = "",
    this.instituteType = '',
    this.instituteName = '',
    this.instituteAddress = '',
    this.educationFrom = '',
    this.educationTo = '',
    this.grades = '',
    this.ethnicOrigin = '',
    this.bankName = '',
    this.accountHolderName = '',
    this.sortCode = '',
    this.accountNo = '',
    this.jobExperience = const [],
    this.applicantName = '',
    this.signature = '',
    this.submissionDate = '',
    this.currentStep = 0,
    this.validationStatus = ValidationStatus.none,
    this.errorValidationMessage,
    this.submissionStatus = PostApiStatus.initial,
    this.errorMessage,
  });

  JobApplicationState copyWith({
    File? profilePicture,
    String? positionAppliedFor,
    File? attachedDocument,
    String? attachedDocumentName,
    String? title,
    String? surname,
    String? forename,
    String? surnameAtBirth,
    String? permanentAddress,
    String? postCode,
    String? permanentAddressFromDate,
    String? permanentAddressToDate,
    String? previousAddress,
    String? previousAddressFromDate,
    String? previousAddressToDate,
    String? previousAddressPostCode,
    String? mobileNo,
    String? email,
    String? telephone,
    String? nationality,
    String? placeOfEntry,
    String? dateOfEntry,
    bool? workPermit,
    String? niNo,
    String? passportNo,
    String? siaLicenseSector,
    String? siaLicenseNo,
    String? relationshipKin,
    String? nameKin,
    String? telephoneKin,
    String? mobileNoKin,
    String? addressKin,
    String? postCodeKin,
    String? drivingType,
    bool? ownTransport,
    String? drivingLicenseNo,
    String? dvlaLicenseCheckCode,
    bool? disqualified,
    bool? motoringConviction,
    String? motoringConvictionDetails,
    bool? hasCriminalConvictionRecord,
    bool? outStandingCriminalConviction,
    bool? bankruptcy,
    bool? courtOrders,
    String? additionalOffenceDetails,
    String? instituteType,
    String? instituteName,
    String? instituteAddress,
    String? educationFrom,
    String? educationTo,
    String? grades,
    String? ethnicOrigin,
    String? bankName,
    String? accountHolderName,
    String? sortCode,
    String? accountNo,
    List<JobExperience>? jobExperience,
    String? applicantName,
    String? signature,
    String? submissionDate,
    int? currentStep,
    ValidationStatus? validationStatus,
    String? errorValidationMessage,
    PostApiStatus? submissionStatus,
    String? errorMessage,
  }) {
    return JobApplicationState(
      profilePicture: profilePicture ?? this.profilePicture,
      positionAppliedFor: positionAppliedFor ?? this.positionAppliedFor,
      attachedDocument: attachedDocument ?? this.attachedDocument,
      attachedDocumentName: attachedDocumentName ?? this.attachedDocumentName,
      title: title ?? this.title,
      surname: surname ?? this.surname,
      forename: forename ?? this.forename,
      surnameAtBirth: surnameAtBirth ?? this.surnameAtBirth,
      permanentAddress: permanentAddress ?? this.permanentAddress,
      postCode: postCode ?? this.postCode,
      permanentAddressFromDate:
          permanentAddressFromDate ?? this.permanentAddressFromDate,
      permanentAddressToDate:
          permanentAddressToDate ?? this.permanentAddressToDate,
      previousAddress: previousAddress ?? this.previousAddress,
      previousAddressFromDate:
          previousAddressFromDate ?? this.previousAddressFromDate,
      previousAddressToDate:
          previousAddressToDate ?? this.previousAddressToDate,
      previousAddressPostCode:
          previousAddressPostCode ?? this.previousAddressPostCode,
      mobileNo: mobileNo ?? this.mobileNo,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
      nationality: nationality ?? this.nationality,
      placeOfEntry: placeOfEntry ?? this.placeOfEntry,
      dateOfEntry: dateOfEntry ?? this.dateOfEntry,
      workPermit: workPermit ?? this.workPermit,
      niNo: niNo ?? this.niNo,
      passportNo: passportNo ?? this.passportNo,
      siaLicenseSector: siaLicenseSector ?? this.siaLicenseSector,
      siaLicenseNo: siaLicenseNo ?? this.siaLicenseNo,
      relationshipKin: relationshipKin ?? this.relationshipKin,
      nameKin: nameKin ?? this.nameKin,
      telephoneKin: telephoneKin ?? this.telephoneKin,
      mobileNoKin: mobileNoKin ?? this.mobileNoKin,
      addressKin: addressKin ?? this.addressKin,
      postCodeKin: postCodeKin ?? this.postCodeKin,
      drivingType: drivingType ?? this.drivingType,
      ownTransport: ownTransport ?? this.ownTransport,
      drivingLicenseNo: drivingLicenseNo ?? this.drivingLicenseNo,
      dvlaLicenseCheckCode: dvlaLicenseCheckCode ?? this.dvlaLicenseCheckCode,
      disqualified: disqualified ?? this.disqualified,
      motoringConviction: motoringConviction ?? this.motoringConviction,
      motoringConvictionDetails:
          motoringConvictionDetails ?? this.motoringConvictionDetails,
      hasCriminalConvictionRecord:
          hasCriminalConvictionRecord ?? this.hasCriminalConvictionRecord,
      outStandingCriminalConviction:
          outStandingCriminalConviction ?? this.outStandingCriminalConviction,
      bankruptcy: bankruptcy ?? this.bankruptcy,
      courtOrders: courtOrders ?? this.courtOrders,
      additionalOffenceDetails:
          additionalOffenceDetails ?? this.additionalOffenceDetails,
      instituteType: instituteType ?? this.instituteType,
      instituteName: instituteName ?? this.instituteName,
      instituteAddress: instituteAddress ?? this.instituteAddress,
      educationFrom: educationFrom ?? this.educationFrom,
      educationTo: educationTo ?? this.educationTo,
      grades: grades ?? this.grades,
      ethnicOrigin: ethnicOrigin ?? this.ethnicOrigin,
      bankName: bankName ?? this.bankName,
      accountHolderName: accountHolderName ?? this.accountHolderName,
      sortCode: sortCode ?? this.sortCode,
      accountNo: accountNo ?? this.accountNo,
      jobExperience: jobExperience ?? this.jobExperience,
      applicantName: applicantName ?? this.applicantName,
      signature: signature ?? this.signature,
      submissionDate: submissionDate ?? this.submissionDate,
      currentStep: currentStep ?? this.currentStep,
      validationStatus: validationStatus ?? this.validationStatus,
      errorValidationMessage:
          errorValidationMessage ?? this.errorValidationMessage,
      submissionStatus: submissionStatus ?? this.submissionStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        profilePicture,
        attachedDocument,
        attachedDocumentName,
        positionAppliedFor,
        title,
        surname,
        forename,
        surnameAtBirth,
        permanentAddress,
        postCode,
        permanentAddressFromDate,
        permanentAddressToDate,
        previousAddress,
        previousAddressFromDate,
        previousAddressToDate,
        previousAddressPostCode,
        mobileNo,
        email,
        telephone,
        nationality,
        placeOfEntry,
        dateOfEntry,
        workPermit,
        niNo,
        passportNo,
        siaLicenseSector,
        siaLicenseNo,
        relationshipKin,
        nameKin,
        telephoneKin,
        mobileNoKin,
        addressKin,
        postCodeKin,
        drivingType,
        ownTransport,
        drivingLicenseNo,
        dvlaLicenseCheckCode,
        disqualified,
        motoringConviction,
        motoringConvictionDetails,
        hasCriminalConvictionRecord,
        outStandingCriminalConviction,
        bankruptcy,
        courtOrders,
        additionalOffenceDetails,
        instituteType,
        instituteName,
        instituteAddress,
        educationFrom,
        educationTo,
        grades,
        ethnicOrigin,
        bankName,
        accountHolderName,
        sortCode,
        accountNo,
        jobExperience,
        applicantName,
        signature,
        submissionDate,
        currentStep,
        validationStatus,
        errorValidationMessage,
        submissionStatus,
        errorMessage,
      ];
}
