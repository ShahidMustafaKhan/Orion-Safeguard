import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/core/response/api_response.dart';
import 'package:orion_safeguard/modules/profile/model/company_details_model.dart';

import '../../../../repository/companyDetails/company_details_repository.dart';

part 'company_details_state.dart';

class CompanyDetailsCubit extends Cubit<CompanyDetailsState> {
  final CompanyDetailsRepository companyDetailsRepository = getIt();

  CompanyDetailsCubit()
      : super(CompanyDetailsState(companyDetailsModel: ApiResponse.loading()));

  void fetchCompanyDetails() async {
    try {
      CompanyDetailsModel companyDetailsModel =
          await companyDetailsRepository.getCompanyDetails();
      emit(state.copyWith(
          companyDetailsModel: ApiResponse.completed(companyDetailsModel)));
    } catch (e) {
      emit(
          state.copyWith(companyDetailsModel: ApiResponse.error(e.toString())));
    }
  }
}
