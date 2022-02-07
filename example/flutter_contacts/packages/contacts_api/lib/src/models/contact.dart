import 'package:equatable/equatable.dart';

/// {@template contact}
/// Holds the data for a single [Contact].
/// {@endtemplate}
class Contact extends Equatable {
  /// {@macro contact}
  const Contact({required this.id});

  /// The unique identifier for this [Contact].
  ///
  /// Equality of [Contact]s is based on the [id].
  final String id;

  @override
  List<Object?> get props => [id];
}
