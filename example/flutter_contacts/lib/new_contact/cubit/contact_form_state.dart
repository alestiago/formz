part of 'contact_form_cubit.dart';

class ContactFormState extends Equatable with FormzMixin {
  const ContactFormState({
    this.firstName = const FirstName.pure(),
    this.secondName = const SecondName.pure(),
    this.email = const Email.pure(),
    this.telephone = const Telephone.pure(),
  });

  final FirstName firstName;
  final SecondName secondName;
  final Email email;
  final Telephone telephone;

  @override
  List<FormzInput> get inputs => [
        firstName,
        secondName,
        email,
        telephone,
      ];

  @override
  List<Object> get props => [
        firstName,
        secondName,
        email,
        telephone,
      ];

  ContactFormState copyWith({
    FirstName? firstName,
    SecondName? secondName,
    Email? email,
    Telephone? telephone,
  }) {
    return ContactFormState(
      firstName: firstName ?? this.firstName,
      secondName: secondName ?? this.secondName,
      email: email ?? this.email,
      telephone: telephone ?? this.telephone,
    );
  }
}
