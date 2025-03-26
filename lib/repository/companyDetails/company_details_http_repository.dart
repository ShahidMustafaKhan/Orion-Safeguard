import 'package:orion_safeguard/modules/profile/model/company_details_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../core/exceptions/app_exceptions.dart';
import 'company_details_repository.dart';

class CompanyDetailsHttpRepository implements CompanyDetailsRepository {
  @override
  Future<CompanyDetailsModel> getCompanyDetails() async {
    final queryBuilder =
        QueryBuilder<CompanyDetailsModel>(CompanyDetailsModel());

    final response = await queryBuilder.query();

    if (response.success &&
        response.results != null &&
        response.results!.isNotEmpty) {
      return response.results!.first as CompanyDetailsModel;
    } else {
      throw AppException(
          response.error?.message ?? 'Failed to fetch company details');
    }
  }
}
