/// Enum representing the submission status of a form.
enum FormzSubmissionStatus {
  /// The form is in the process of being submitted.
  inProgress,

  /// The form has been submitted successfully.
  success,

  /// The form submission failed.
  failure,

  /// The form submission has been canceled.
  canceled
}

/// Useful extensions on [FormzSubmissionStatus]
extension FormzSubmissionStatusX on FormzSubmissionStatus {
  /// Indicates whether the form is in the process of being submitted.
  bool get isInProgress => this == FormzSubmissionStatus.inProgress;

  /// Indicates whether the form has been submitted successfully.
  bool get isSuccess => this == FormzSubmissionStatus.success;

  /// Indicates whether the form submission failed.
  bool get isFailure => this == FormzSubmissionStatus.failure;

  /// Indicates whether the form submission has been canceled.
  bool get isCanceled => this == FormzSubmissionStatus.canceled;
}
