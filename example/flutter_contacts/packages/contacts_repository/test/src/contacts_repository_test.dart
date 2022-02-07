// ignore_for_file: prefer_const_constructors
import 'package:contacts_api/contacts_api.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockContactsApi extends Mock implements ContactsApi {}

class FakeContact extends Fake implements Contact {}

void main() {
  group('ContactsRepository', () {
    late ContactsApi api;

    final contacts = [
      Contact(
        id: '1',
        firstName: 'firstName',
      ),
      Contact(
        id: '2',
        firstName: 'firstName',
      ),
      Contact(
        id: '3',
        firstName: 'firstName',
      ),
    ];

    setUpAll(() {
      registerFallbackValue(FakeContact());
    });

    setUp(() {
      api = MockContactsApi();
      when(() => api.getContacts()).thenAnswer((_) => Stream.value(contacts));
      when(() => api.saveContact(any())).thenAnswer((_) async {});
    });

    ContactsRepository createSubject() => ContactsRepository(contactsApi: api);

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });
    });

    group('getContacts', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.getContacts(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getContacts()).called(1);
      });

      test('returns stream of current list contacts', () {
        expect(
          createSubject().getContacts(),
          emits(contacts),
        );
      });
    });

    group('saveContacts', () {
      test('makes correct api request', () {
        final newContact = Contact(
          id: '4',
          firstName: 'firstName',
        );

        final subject = createSubject();

        expect(subject.saveContact(newContact), completes);

        verify(() => api.saveContact(newContact)).called(1);
      });
    });
  });
}
