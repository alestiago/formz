import 'package:flutter/material.dart';
import 'package:flutter_contacts/new_contact/new_contact.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ContactsView();
  }
}

class ContactsView extends StatelessWidget {
  const ContactsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contacts')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push<void>(
          NewContactPage.route(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
