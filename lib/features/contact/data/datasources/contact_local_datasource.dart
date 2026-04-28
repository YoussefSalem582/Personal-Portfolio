import '../../../../models/contact_form.dart';

abstract class ContactLocalDataSource {
  ContactInfo getContactInfoSync();
}
