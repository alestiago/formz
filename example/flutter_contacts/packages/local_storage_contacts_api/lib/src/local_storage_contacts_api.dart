import 'dart:async';
import 'dart:convert';

import 'package:contacts_api/contacts_api.dart';
import 'package:local_storage_contacts_api/local_storage_contacts_api.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// {@template local_storage_contacts_api}
/// A Flutter implementation of the [ContactsApi] that uses local storage.
/// {@endtemplate}
class LocalStorageContactsApi extends ContactsApi {
  /// {@macro local_storage_contacts_api}
  LocalStorageContactsApi({
    required SharedPreferences plugin,
  }) : _plugin = plugin {
    _init();
  }

  final SharedPreferences _plugin;

  final _contactsStreamController =
      BehaviorSubject<List<Contact>>.seeded(const []);

  /// The key used for storing the [Contact]s locally.
  ///
  /// This is only exposed for testing and shouldn't be used by consumers of
  /// this library.
  @visibleForTesting
  static const kContactsCollectionKey = '__contacts_collection_key__';

  String? _getValue(String key) => _plugin.getString(key);
  Future<void> _setValue(String key, String value) =>
      _plugin.setString(key, value);

  void _init() {
    final contactsJson = _getValue(kContactsCollectionKey);
    if (contactsJson != null) {
      final contacts = List<Map>.from(json.decode(contactsJson) as List)
          .map(
            (jsonMap) => ContactAdapter.fromJson(
              Map<String, dynamic>.from(jsonMap),
            ),
          )
          .toList();
      _contactsStreamController.add(contacts);
    } else {
      _contactsStreamController.add(const []);
    }
  }

  @override
  Stream<List<Contact>> getContacts() {
    return _contactsStreamController.asBroadcastStream();
  }

  @override
  Future<void> saveContact(Contact contact) {
    final contacts = [..._contactsStreamController.value];
    final contactIndex = contacts.indexWhere((c) => c.id == contact.id);
    if (contactIndex >= 0) {
      contacts[contactIndex] = contact;
    } else {
      contacts.add(contact);
    }

    _contactsStreamController.add(contacts);
    return _setValue(
      kContactsCollectionKey,
      json.encode(contacts.map((e) => e.toJson()).toList()),
    );
  }
}
