import 'package:contacts_api/contacts_api.dart';

/// {@template contacts_api}
/// The interface for an API that provides access to [Contact]s.
/// {@endtemplate}
abstract class ContactsApi {
  /// {@macro contacts_api}
  const ContactsApi();

  /// Provides a [Stream] of all [Contact]s.
  Stream<List<Contact>> getContacts();

  /// Saves a [Contact].
  ///
  /// If a [Contact] with the same id already exists, it will be replaced.
  Future<void> saveContact(Contact todo);
}
