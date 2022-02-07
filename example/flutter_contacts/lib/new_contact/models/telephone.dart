import 'package:formz/formz.dart';

enum TelephoneError { empty, invalid }

class Telephone extends FormzInput<String, TelephoneError> {
  const Telephone.pure() : super.pure('');

  const Telephone.dirty(String value) : super.dirty(value);

  @override
  TelephoneError? validator(String value) {
    return value.isNotEmpty ? null : TelephoneError.empty;
  }
}
