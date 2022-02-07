import 'package:formz/formz.dart';

enum EmailError { empty, invalid }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty(String value) : super.dirty(value);

  @override
  EmailError? validator(String value) {
    return value.isNotEmpty ? null : EmailError.empty;
  }
}
