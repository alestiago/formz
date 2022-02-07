import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contacts/new_contact/new_contact.dart';

class NewContactPage extends StatelessWidget {
  const NewContactPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute<void>(
        builder: (_) => const NewContactPage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContactFormCubit(),
      child: const ContactFormView(),
    );
  }
}

class ContactFormView extends StatelessWidget {
  const ContactFormView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactFormCubit, ContactFormState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('New contact')),
          body: const _ContactForm(),
          floatingActionButton: state.isValid
              ? FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.check,
                    color: Colors.white, // TODO(alestiago): use theme instead.
                  ),
                )
              : null,
        );
      },
    );
  }
}

class _ContactForm extends StatelessWidget {
  const _ContactForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          _FirstName(),
          _SecondName(),
          _Email(),
          _Telephone(),
        ],
      ),
    );
  }
}

class _FirstName extends StatelessWidget {
  const _FirstName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('firstName_textField'),
      initialValue: '',
      decoration: const InputDecoration(
        labelText: 'First Name',
        border: OutlineInputBorder(),
      ),
      onChanged: context.read<ContactFormCubit>().onFirstNameUpdated,
    );
  }
}

class _SecondName extends StatelessWidget {
  const _SecondName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('secondName_textField'),
      initialValue: '',
      decoration: const InputDecoration(
        labelText: 'Second Name',
        border: OutlineInputBorder(),
      ),
      onChanged: context.read<ContactFormCubit>().onSecondNameUpdated,
    );
  }
}

class _Email extends StatelessWidget {
  const _Email({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('email_textField'),
      initialValue: '',
      decoration: const InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(),
      ),
      onChanged: context.read<ContactFormCubit>().onEmailUpdated,
    );
  }
}

class _Telephone extends StatelessWidget {
  const _Telephone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: const Key('telephone_textField'),
      initialValue: '',
      decoration: const InputDecoration(
        labelText: 'Telephone',
        border: OutlineInputBorder(),
      ),
      onChanged: context.read<ContactFormCubit>().onTelephoneUpdated,
    );
  }
}
