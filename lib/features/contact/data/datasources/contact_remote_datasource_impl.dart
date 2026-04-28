import 'package:dio/dio.dart';

import '../../../../config/api_keys.dart';
import '../../../../models/contact_form.dart';
import '../../domain/contact_submit_error.dart';
import 'contact_remote_datasource.dart';

class ContactRemoteDataSourceImpl implements ContactRemoteDataSource {
  ContactRemoteDataSourceImpl({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                connectTimeout: const Duration(seconds: 15),
                receiveTimeout: const Duration(seconds: 15),
                sendTimeout: const Duration(seconds: 15),
                headers: {
                  'Content-Type': 'application/json',
                  'Accept': 'application/json',
                },
              ),
            );

  final Dio _dio;

  @override
  Future<void> submitFormSpree(ContactForm form) async {
    const formspreeEndpoint = ApiKeys.formspreeEndpoint;
    if (formspreeEndpoint.isEmpty) {
      throw const ContactSubmitError(ContactSubmitErrorKind.notConfigured);
    }

    final formData = {
      'name': form.name,
      'email': form.email,
      'subject': form.subject,
      'message': form.message,
      '_replyto': form.email,
      '_subject': '${form.subject} - Portfolio Contact Form',
    };

    try {
      final response = await _dio.post(
        formspreeEndpoint,
        data: formData,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      }
      if (response.statusCode == 422) {
        throw const ContactSubmitError(ContactSubmitErrorKind.invalidForm);
      }
      if (response.statusCode == 403) {
        throw const ContactSubmitError(ContactSubmitErrorKind.formDisabled);
      }
      if (response.statusCode == 429) {
        throw const ContactSubmitError(ContactSubmitErrorKind.rateLimit);
      }
      throw ContactSubmitError(
        ContactSubmitErrorKind.failedWithStatus,
        statusCode: response.statusCode ?? 0,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.sendTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw const ContactSubmitError(ContactSubmitErrorKind.timeout);
      }
      if (e.type == DioExceptionType.connectionError) {
        throw const ContactSubmitError(ContactSubmitErrorKind.network);
      }
      if (e.type == DioExceptionType.badResponse) {
        final statusCode = e.response?.statusCode ?? 0;
        if (statusCode == 422) {
          throw const ContactSubmitError(ContactSubmitErrorKind.invalidForm);
        }
        if (statusCode == 403) {
          throw const ContactSubmitError(ContactSubmitErrorKind.formDisabled);
        }
        if (statusCode == 429) {
          throw const ContactSubmitError(ContactSubmitErrorKind.rateLimit);
        }
        throw ContactSubmitError(
          ContactSubmitErrorKind.failedWithStatus,
          statusCode: statusCode,
        );
      }
      if (e.type == DioExceptionType.badCertificate) {
        throw const ContactSubmitError(ContactSubmitErrorKind.badCertificate);
      }
      throw const ContactSubmitError(ContactSubmitErrorKind.network);
    }
  }
}
