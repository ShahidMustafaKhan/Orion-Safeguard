import '../../modules/profile/model/company_details_model.dart';

abstract class CompanyDetailsRepository {
  Future<CompanyDetailsModel> getCompanyDetails();
}
