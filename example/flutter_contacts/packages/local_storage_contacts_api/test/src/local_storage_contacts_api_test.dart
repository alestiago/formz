// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:contacts_api/contacts_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:local_storage_contacts_api/local_storage_contacts_api.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('LocalStorageContactsApi', () {
    late SharedPreferences plugin;

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

    setUp(() {
      plugin = MockSharedPreferences();
      when(() => plugin.getString(any()))
          .thenReturn(json.encode(contacts.map((e) => e.toJson()).toList()));
      when(() => plugin.setString(any(), any())).thenAnswer((_) async => true);
    });

    LocalStorageContactsApi createSubject() {
      return LocalStorageContactsApi(
        plugin: plugin,
      );
    }

    group('constructor', () {
      test('works properly', () {
        expect(
          createSubject,
          returnsNormally,
        );
      });

      group('initializes the contacts stream', () {
        test(
            'with existing contacts '
            'when contacts are present', () {
          final subject = createSubject();

          expect(subject.getContacts(), emits(contacts));
          verify(
            () => plugin.getString(
              LocalStorageContactsApi.kContactsCollectionKey,
            ),
          ).called(1);
        });

        test(
            'with empty list '
            'when no contacts are present', () {
          when(() => plugin.getString(any())).thenReturn(null);

          final subject = createSubject();

          expect(subject.getContacts(), emits(const <Contact>[]));
          verify(
            () => plugin.getString(
              LocalStorageContactsApi.kContactsCollectionKey,
            ),
          ).called(1);
        });
      });
    });

    test('getContacts returns stream of current list contats', () {
      expect(
        createSubject().getContacts(),
        emits(contacts),
      );
    });

    group('saveContacts', () {
      test('saves new contacts', () {
        final newContact = Contact(
          id: '4',
          firstName: 'firstName',
        );

        final newContacts = [...contacts, newContact];

        final subject = createSubject();

        expect(subject.saveContact(newContact), completes);
        expect(subject.getContacts(), emits(newContacts));

        verify(
          () => plugin.setString(
            LocalStorageContactsApi.kContactsCollectionKey,
            json.encode(newContacts.map((e) => e.toJson()).toList()),
          ),
        ).called(1);
      });

      test('updates existing contacts', () {
        final updatedContact = Contact(
          id: '1',
          firstName: 'firstName__modified',
        );
        final newContacts = [updatedContact, ...contacts.sublist(1)];

        final subject = createSubject();

        expect(subject.saveContact(updatedContact), completes);
        expect(subject.getContacts(), emits(newContacts));

        verify(
          () => plugin.setString(
            LocalStorageContactsApi.kContactsCollectionKey,
            json.encode(newContacts.map((e) => e.toJson()).toList()),
          ),
        ).called(1);
      });
    });
  });
}
