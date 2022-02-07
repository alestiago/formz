import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_contacts/new_contact/models/models.dart';
import 'package:formz/formz.dart';

part 'contact_form_state.dart';

class ContactFormCubit extends Cubit<ContactFormState> {
  ContactFormCubit() : super(const ContactFormState());

  void onFirstNameUpdated(String value) {
    final firstName = FirstName.dirty(value);
    emit(
      state.copyWith(
        firstName: firstName,
      ),
    );
  }

  void onSecondNameUpdated(String value) {
    final secondName = SecondName.dirty(value);
    emit(
      state.copyWith(
        secondName: secondName,
      ),
    );
  }

  void onEmailUpdated(String value) {
    final email = Email.dirty(value);
    emit(
      state.copyWith(
        email: email,
      ),
    );
  }

  void onTelephoneUpdated(String value) {
    final telephone = Telephone.dirty(value);
    emit(
      state.copyWith(
        telephone: telephone,
      ),
    );
  }
}
