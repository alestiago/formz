// ignore_for_file: avoid_redundant_argument_values
import 'package:contacts_api/contacts_api.dart';
import 'package:test/test.dart';

void main() {
  group('Contact', () {
    Contact createSubject({
      String id = '1',
    }) {
      return Contact(
        id: id,
      );
    }

    group('constructor', () {
      test('works correctly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      test(
          'supports value equality '
          'based on id', () {
        expect(
          createSubject(),
          equals(createSubject()),
        );
      });

      test('props are correct', () {
        expect(
          createSubject().props,
          equals([
            '1', // id
          ]),
        );
      });
    });
  });
}
