import 'package:contacts_api/contacts_api.dart';

/// The type definition for a JSON-serializable [Map].
typedef JsonMap = Map<String, dynamic>;

/// Error thrown when a [ContactAdapter] encounters an error.
class ContactAdapterException implements Exception {}

/// Responsible for converting a [Contact] into a [JsonMap] and vice versa.
extension ContactAdapter on Contact {
  /// Deserializes the given [JsonMap] into a [Contact].
  ///
  /// Throws a [ContactAdapterException] if the [JsonMap] is not valid.
  static Contact fromJson(Map<String, dynamic> json) {
    try {
      return Contact(
        id: json['id'] as String,
        firstName: json['firstName'] as String,
        secondName: json['secondName'] as String?,
        email: json['email'] as String?,
        telephone: json['telephone'] as String?,
      );
    } catch (e) {
      throw ContactAdapterException();
    }
  }

  /// Converts this [Contact] into a [JsonMap].
  JsonMap toJson() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'telephone': telephone,
    };
  }
}
