// ignore_for_file: prefer_const_constructors
import 'package:contacts_api/contacts_api.dart';
import 'package:contacts_repository/contacts_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockContactsApi extends Mock implements ContactsApi {}

class FakeTodo extends Fake implements Contact {}

void main() {
  group('ContactsRepository', () {
    late ContactsApi api;

    final todos = [
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
      registerFallbackValue(FakeTodo());
    });

    setUp(() {
      api = MockContactsApi();
      when(() => api.getContacts()).thenAnswer((_) => Stream.value(todos));
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

    group('getTodos', () {
      test('makes correct api request', () {
        final subject = createSubject();

        expect(
          subject.getContacts(),
          isNot(throwsA(anything)),
        );

        verify(() => api.getContacts()).called(1);
      });

      test('returns stream of current list todos', () {
        expect(
          createSubject().getContacts(),
          emits(todos),
        );
      });
    });

    group('saveTodo', () {
      test('makes correct api request', () {
        final newTodo = Contact(
          id: '4',
          firstName: 'firstName',
        );

        final subject = createSubject();

        expect(subject.saveContact(newTodo), completes);

        verify(() => api.saveContact(newTodo)).called(1);
      });
    });
  });
}
