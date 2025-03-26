part of 'company_details_cubit.dart';

class CompanyDetailsState extends Equatable {
  final ApiResponse<CompanyDetailsModel> companyDetailsModel;

  const CompanyDetailsState({
    required this.companyDetailsModel,
  });

  CompanyDetailsState copyWith({
    ApiResponse<CompanyDetailsModel>? companyDetailsModel,
  }) {
    return CompanyDetailsState(
      companyDetailsModel: companyDetailsModel ?? this.companyDetailsModel,
    );
  }

  @override
  List<Object?> get props => [companyDetailsModel];
}
