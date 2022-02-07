import 'package:contacts_api/contacts_api.dart';

/// {@template Contacts_repository}
/// A repository that handles [Contact] requests.
/// {@endtemplate}
class ContactsRepository {
  /// {@macro Contacts_repository}
  const ContactsRepository({
    required ContactsApi contactsApi,
  }) : _contactsApi = contactsApi;

  final ContactsApi _contactsApi;

  /// Provides a [Stream] of all Contacts.
  Stream<List<Contact>> getContacts() => _contactsApi.getContacts();

  /// Saves a [Contact].
  ///
  /// If a [Contact] with the same id already exists, it will be replaced.
  Future<void> saveContact(Contact contact) {
    return _contactsApi.saveContact(contact);
  }
}
