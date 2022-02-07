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
      body: const _ContactsPageBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push<void>(
          NewContactPage.route(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContactsPageBody extends StatelessWidget {
  const _ContactsPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isEmpty = 2 == 0;
    return isEmpty ? const _EmptyPlaceholder() : const _ContactsList();
  }
}

class _EmptyPlaceholder extends StatelessWidget {
  const _EmptyPlaceholder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('No contacts yet'),
    );
  }
}

class _ContactsList extends StatelessWidget {
  const _ContactsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container();
      },
    );
  }
}
