import 'package:equatable/equatable.dart';

/// {@template contact}
/// Holds the data for a single [Contact].
/// {@endtemplate}
class Contact extends Equatable {
  /// {@macro contact}
  const Contact({
    required this.id,
    required this.firstName,
    this.secondName,
    this.email,
    this.telephone,
  });

  /// The unique identifier for this [Contact].
  ///
  /// Equality of [Contact]s is based on the [id].
  final String id;

  /// The first name of this [Contact].
  final String firstName;

  /// The second name of this [Contact].
  final String? secondName;

  /// The email address of this [Contact].
  final String? email;

  /// The telephone number of this [Contact].
  final String? telephone;

  @override
  List<Object?> get props => [id];
}
