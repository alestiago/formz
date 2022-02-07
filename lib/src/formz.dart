import 'package:formz/formz.dart';

/// Class which contains methods that help manipulate and manage
/// validity of [FormzInput] instances.
class Formz {
  /// Returns a [bool] given a list of [FormzInput] indicating whether
  /// the inputs are all valid.
  static bool validate(List<FormzInput> inputs) {
    return inputs.every((input) => input.isValid);
  }
}
