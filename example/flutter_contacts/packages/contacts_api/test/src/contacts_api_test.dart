import 'package:contacts_api/contacts_api.dart';
import 'package:test/test.dart';

class TestContactsApi extends ContactsApi {
  TestContactsApi() : super();

  @override
  dynamic noSuchMethod(Invocation invocation) {
    return super.noSuchMethod(invocation);
  }
}

void main() {
  group('ContactsApi', () {
    test('can be constructed', () {
      expect(
        () => TestContactsApi(),
        returnsNormally,
      );
    });
  });
}
