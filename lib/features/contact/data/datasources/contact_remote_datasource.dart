import '../../../../models/contact_form.dart';

abstract class ContactRemoteDataSource {
  Future<void> submitFormSpree(ContactForm form);
}
