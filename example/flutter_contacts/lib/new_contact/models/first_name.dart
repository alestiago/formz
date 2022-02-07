import 'package:formz/formz.dart';

enum FirstNameError { empty, invalid }

class FirstName extends FormzInput<String, FirstNameError> {
  const FirstName.pure() : super.pure('');

  const FirstName.dirty(String value) : super.dirty(value);

  @override
  FirstNameError? validator(String value) {
    return value.isNotEmpty ? null : FirstNameError.empty;
  }
}
