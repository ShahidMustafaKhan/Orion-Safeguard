import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';

import '../../../core/services/session_controller/session_controller.dart';
import '../../profile/model/user_model.dart';

part 'subscription_state.dart';

class SubscriptionCubit extends Cubit<SubscriptionState> {
  SubscriptionCubit() : super(SubscriptionInitial());

  LiveQuery liveQuery = LiveQuery();
  Subscription? subscription;

  Future<void> subscribeToUserStatus() async {
    String? userId = SessionController().objectId;

    final query = QueryBuilder<UserModel>(UserModel.forQuery())
      ..whereEqualTo(UserModel.keyObjectId, userId);

    subscription = await liveQuery.client.subscribe(query);

    subscription?.on(LiveQueryEvent.update, (value) {
      final accountStatus = value.get<String>(UserModel.keyAccountStatus);
      if (accountStatus == UserModel.keyAccountStatusTypeApproved ||
          accountStatus == UserModel.keyAccountStatusTypeRejected) {
        emit(SubscriptionUpdated(accountStatus));
      }
    });
  }

  @override
  Future<void> close() {
    if (subscription != null) {
      liveQuery.client.unSubscribe(subscription!);
    }
    return super.close();
  }
}
