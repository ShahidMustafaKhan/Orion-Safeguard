part of 'subscription_cubit.dart';

abstract class SubscriptionState extends Equatable {
  const SubscriptionState();

  @override
  List<Object?> get props => [];
}

class SubscriptionInitial extends SubscriptionState {}

class SubscriptionUpdated extends SubscriptionState {
  final String status;
  const SubscriptionUpdated(this.status);

  @override
  List<Object?> get props => [status];
}
