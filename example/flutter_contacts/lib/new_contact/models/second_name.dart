import 'package:formz/formz.dart';

enum SecondNameError { empty, invalid }

class SecondName extends FormzInput<String, SecondNameError> {
  const SecondName.pure() : super.pure('');

  const SecondName.dirty(String value) : super.dirty(value);

  @override
  SecondNameError? validator(String value) {
    return value.isNotEmpty ? null : SecondNameError.empty;
  }
}
