import 'package:orion_safeguard/core/exceptions/app_exceptions.dart';
import 'package:orion_safeguard/modules/job_application/model/job_application_model.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'jobApplication_repository.dart';

class JobApplicationHttpRepository implements JobApplicationRepository {
  @override
  Future<void> submitJobApplication(
      JobApplicationModel jobApplicationModel) async {
    ParseResponse response = await jobApplicationModel.create();
    if (response.success && response.results != null) {
      return;
    } else {
      throw AppException(response.error?.message ?? 'Something went wrong');
    }
  }
}
