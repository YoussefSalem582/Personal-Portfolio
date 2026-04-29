import '../../domain/entities/contact_entities.dart';

abstract class ContactRemoteDataSource {
  Future<void> submitFormSpree(ContactForm form);
}
