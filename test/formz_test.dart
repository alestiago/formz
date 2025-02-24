// ignore_for_file: prefer_const_constructors
import 'package:formz/formz.dart';
import 'package:test/test.dart';

import 'helpers/helpers.dart';

void main() {
  group('Formz', () {
    group('FormzMixin', () {
      test('is not valid when default constructor is used', () {
        final form = NameInputFormzMixin();
        expect(form.isValid, isFalse);
        expect(form.isNotValid, isTrue);
      });

      test('is not valid when containing a dirty/invalid value', () {
        final form = NameInputFormzMixin(name: const NameInput.dirty());
        expect(form.isValid, isFalse);
        expect(form.isNotValid, isTrue);
      });

      test('is valid when containing a dirty/valid valud', () {
        final form = NameInputFormzMixin(
          name: const NameInput.dirty(value: 'joe'),
        );
        expect(form.isValid, isTrue);
        expect(form.isNotValid, isFalse);
      });
    });

    group('FormzInput', () {
      test('value is correct', () {
        expect(NameInput.pure(value: 'joe').value, 'joe');
      });

      test('isPure is true when super.pure is used', () {
        expect(NameInput.pure(value: 'joe').isPure, isTrue);
      });

      test('isPure is false when super.dirty is used', () {
        expect(NameInput.dirty(value: 'joe').isPure, isFalse);
      });

      test('isValid is true if super.pure is used and value is valid', () {
        final isValid = NameInput.pure(value: 'joe').isValid;
        expect(isValid, isTrue);
      });

      test('isValid is true if super.dirty is used and input is valid', () {
        final isValid = NameInput.dirty(value: 'joe').isValid;
        expect(isValid, isTrue);
      });

      test('isValid is false if super.dirty is used and input is invalid', () {
        final isValid = NameInput.dirty().isValid;
        expect(isValid, isFalse);
      });

      test('error is NameInputError.empty if pure is used', () {
        expect(NameInput.pure().error, NameInputError.empty);
      });

      test('displayError is null if pure is used', () {
        expect(NameInput.pure().displayError, isNull);
      });

      test('error is null if super.dirty is used and input is valid', () {
        expect(NameInput.dirty(value: 'joe').error, isNull);
      });

      test(
          'displayError is null if super.dirty is used '
          'and input is valid', () {
        expect(NameInput.dirty(value: 'joe').displayError, isNull);
      });

      test(
          'error is NameInputError.empty '
          'if super.dirty is used and input is invalid', () {
        expect(NameInput.dirty().error, NameInputError.empty);
      });

      test(
          'displayError is NameInputError.empty '
          'if super.dirty is used and input is invalid', () {
        expect(NameInput.dirty().displayError, NameInputError.empty);
      });

      test('isValid is true if super.pure is used and input is valid', () {
        expect(NameInput.pure(value: 'joe').isValid, isTrue);
        expect(NameInput.pure(value: 'joe').isNotValid, isFalse);
      });

      test('isValid is true if super.dirty is used and input is valid', () {
        expect(NameInput.dirty(value: 'joe').isValid, isTrue);
        expect(NameInput.dirty(value: 'joe').isNotValid, isFalse);
      });

      test('isValid is false if super.pure is used and input is invalid', () {
        expect(NameInput.pure().isValid, isFalse);
        expect(NameInput.pure().isNotValid, isTrue);
      });

      test('isValid is false if super.dirty is used and input is invalid', () {
        expect(NameInput.dirty().isValid, isFalse);
        expect(NameInput.dirty().isNotValid, isTrue);
      });

      test(
          'isNotValid is true if super.dirty is used '
          'and input is invalid', () {
        expect(NameInput.dirty().isValid, isFalse);
        expect(NameInput.dirty().isNotValid, isTrue);
      });

      test('hashCode is correct', () {
        final name = NameInput.pure();
        final joe = NameInput.dirty(value: 'joe');
        expect(name.hashCode, Object.hashAll([name.value, name.isPure]));
        expect(joe.hashCode, Object.hashAll([joe.value, joe.isPure]));
      });

      test('== is value based', () {
        expect(NameInput.pure(), equals(NameInput.pure()));
        expect(
          NameInput.dirty(value: 'joe'),
          equals(NameInput.dirty(value: 'joe')),
        );
        expect(
          NameInput.dirty(value: 'joe'),
          equals(NameInput.dirty(value: 'joe')),
        );
        expect(
          NameInput.dirty(value: 'bob'),
          isNot(equals(NameInput.dirty(value: 'joe'))),
        );
        expect(
          NameInput.pure(value: 'joe'),
          isNot(equals(NameInput.dirty(value: 'joe'))),
        );
      });

      test('toString is overridden correctly', () {
        expect(
          NameInput.pure().toString(),
          equals(
            '''FormzInput<String, NameInputError>.pure(value: , isValid: false, error: NameInputError.empty)''',
          ),
        );
        expect(
          NameInput.pure(value: 'joe').toString(),
          equals(
            '''FormzInput<String, NameInputError>.pure(value: joe, isValid: true, error: null)''',
          ),
        );
        expect(
          NameInput.dirty(value: 'joe').toString(),
          equals(
            '''FormzInput<String, NameInputError>.dirty(value: joe, isValid: true, error: null)''',
          ),
        );
      });
    });

    group('validate', () {
      test('returns valid for empty inputs', () {
        expect(Formz.validate([]), isTrue);
      });

      test('returns valid for a pure/valid input', () {
        expect(Formz.validate([NameInput.pure(value: 'joe')]), isTrue);
      });

      test('returns valid for a dirty/valid input', () {
        expect(Formz.validate([NameInput.dirty(value: 'joe')]), isTrue);
      });

      test('returns valid for multiple valid inputs', () {
        expect(
          Formz.validate([
            NameInput.dirty(value: 'jen'),
            NameInput.dirty(value: 'bob'),
            NameInput.dirty(value: 'alex'),
          ]),
          isTrue,
        );
      });

      test('returns invalid for a pure/invalid input', () {
        expect(Formz.validate([NameInput.pure()]), isFalse);
      });

      test('returns invalid for a dirty/invalid input', () {
        expect(Formz.validate([NameInput.dirty()]), isFalse);
      });

      test('returns invalid for multiple invalid inputs', () {
        expect(
          Formz.validate([
            NameInput.dirty(),
            NameInput.dirty(),
            NameInput.dirty(),
          ]),
          isFalse,
        );
      });

      test('returns invalid when at least one input is invalid', () {
        expect(
          Formz.validate([
            NameInput.dirty(value: 'jan'),
            NameInput.dirty(value: 'jim'),
            NameInput.dirty(),
          ]),
          isFalse,
        );
      });
    });

    group('FormzSubmissionStatusX', () {
      test('isSubmissionInProgress returns true', () {
        expect(FormzSubmissionStatus.inProgress.isInProgress, isTrue);
      });

      test('isSubmissionFailure returns true', () {
        expect(FormzSubmissionStatus.failure.isFailure, isTrue);
      });

      test('isSubmissionSuccess returns true', () {
        expect(FormzSubmissionStatus.success.isSuccess, isTrue);
      });

      test('isSubmissionCanceled returns true', () {
        expect(FormzSubmissionStatus.canceled.isCanceled, isTrue);
      });
    });
  });
}
