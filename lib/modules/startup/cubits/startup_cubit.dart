import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orion_safeguard/core/di/service_locator.dart';
import 'package:orion_safeguard/core/services/session_controller/session_controller.dart';

import '../../../repository/authentication/authentication_repository.dart';
import '../../profile/model/user_model.dart';

part 'startup_state.dart';

class StartupCubit extends Cubit<StartupState> {
  AuthenticationRepository authenticationRepository = getIt();
  StartupCubit() : super(StartupState.initial());

  Future<void> init() async {
    emit(state.copyWith(status: Status.none));

    SessionController().getUserFromPreference();
    String? sessionToken = SessionController().token;

    if (sessionToken != null) {
      await authenticationRepository
          .currentUserFromServer(sessionToken)
          .then((value) {
        Timer(Duration(seconds: 1), () {
          SessionController()
              .savedUserInPreference(value?.objectId ?? '', sessionToken);
          SessionController().getUserFromPreference();
          emit(state.copyWith(status: Status.authenticated));
        });
      }).catchError((error) {
        Timer(Duration(seconds: 1), () {
          emit(state.copyWith(status: Status.unauthenticated));
        });
      });
    } else {
      Timer(Duration(seconds: 1), () {
        emit(state.copyWith(status: Status.unauthenticated));
      });
    }
  }
}
