import '../../domain/entities/contact_entities.dart';

abstract class ContactLocalDataSource {
  ContactInfo getContactInfoSync();
}
