part of 'contact_us_cubit.dart';

class ContactUsState extends Equatable {
  final PostApiStatus status;
  final String? errorMessage;
  final String? name;
  final String? email;
  final String? message;

  const ContactUsState(
      {this.status = PostApiStatus.initial,
      this.message,
      this.errorMessage,
      this.name,
      this.email});

  ContactUsState copyWith(
      {PostApiStatus? status,
      String? message,
      String? errorMessage,
      String? name,
      String? email}) {
    return ContactUsState(
      status: status ?? this.status,
      message: message ?? this.message,
      errorMessage: errorMessage ?? this.errorMessage,
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [status, message, errorMessage, name, email];
}
