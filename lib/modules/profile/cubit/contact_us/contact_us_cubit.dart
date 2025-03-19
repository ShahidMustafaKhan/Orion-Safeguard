import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';

import '../../../../repository/profile/profile_repository.dart';
import '../../../../utils/enums.dart';
import '../../model/user_model.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  final ProfileRepository profileRepository = getIt();

  ContactUsCubit() : super(ContactUsState());

  void sendContactUsMessage(UserModel? userModel) async {
    try {
      emit(state.copyWith(status: PostApiStatus.loading));

      await profileRepository.contactUs(
          name: state.name ?? '',
          email: state.email ?? '',
          message: state.message ?? '',
          userModel: userModel);
      emit(state.copyWith(
          status: PostApiStatus.success, name: '', email: '', message: ''));
    } catch (e) {
      emit(state.copyWith(
          status: PostApiStatus.error, errorMessage: e.toString()));
    }
  }

  void updateName(String? name) {
    emit(state.copyWith(name: name));
  }

  void updateEmail(String? email) {
    emit(state.copyWith(email: email));
  }

  void updateMessage(String? message) {
    emit(state.copyWith(message: message));
  }
}
