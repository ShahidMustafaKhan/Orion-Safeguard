import '../../modules/job_application/model/job_application_model.dart';

abstract class JobApplicationRepository {
  Future<void> submitJobApplication(JobApplicationModel jobApplicationModel);
}
