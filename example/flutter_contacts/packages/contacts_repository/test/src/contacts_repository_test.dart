// ignore_for_file: prefer_const_constructors
import 'package:contacts_repository/contacts_repository.dart';
import 'package:test/test.dart';

void main() {
  group('ContactsRepository', () {
    test('can be instantiated', () {
      expect(ContactsRepository(), isNotNull);
    });
  });
}
