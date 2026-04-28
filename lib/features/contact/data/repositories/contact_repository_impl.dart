import 'package:dartz/dartz.dart';

import '../../../../models/contact_form.dart';
import '../../domain/contact_submit_error.dart';
import '../../domain/repositories/contact_repository.dart';
import '../datasources/contact_local_datasource.dart';
import '../datasources/contact_remote_datasource.dart';

class ContactRepositoryImpl implements ContactRepository {
  ContactRepositoryImpl({
    required ContactLocalDataSource local,
    required ContactRemoteDataSource remote,
  })  : _local = local,
        _remote = remote;

  final ContactLocalDataSource _local;
  final ContactRemoteDataSource _remote;

  @override
  ContactInfo getContactInfoSync() => _local.getContactInfoSync();

  @override
  Future<Either<ContactSubmitError, void>> submitContact(
    ContactForm form,
  ) async {
    try {
      await _remote.submitFormSpree(form);
      return const Right(null);
    } on ContactSubmitError catch (e) {
      return Left(e);
    } catch (_) {
      return const Left(
        ContactSubmitError(ContactSubmitErrorKind.network),
      );
    }
  }
}
