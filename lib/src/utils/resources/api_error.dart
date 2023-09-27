// ignore_for_file: public_member_api_docs, sort_constructors_first
class AppError {
  final String? message;
  final int code;

  AppError({
    required this.code,
    this.message,
  });
}
