import '../../domain/entities/contact_entities.dart';
import '../../../../utils/data/contact_data.dart';
import 'contact_local_datasource.dart';

class ContactLocalDataSourceImpl implements ContactLocalDataSource {
  const ContactLocalDataSourceImpl();

  @override
  ContactInfo getContactInfoSync() => ContactData.contactInfo;
}
