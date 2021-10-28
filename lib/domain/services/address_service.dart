import 'package:style_on_app/domain/model/address/address_model.dart';
import 'package:style_on_app/domain/repository/address/address_repo.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

class AddressService extends ChangeNotifier {
  final AddressRepository _repository;

  AddressService(AddressRepository repository) : _repository = repository;

  addAddress(String firstName, String lastName, String addressLine1,
      String city, String state, String zipCode, String phoneNo, bool isPermanent) {
    _repository.setAddress(AddressModel(firstName: firstName, lastName: lastName, addressLine1: addressLine1, city: city, state: state, zipCode: zipCode, phoneNo: phoneNo, isPermanent: isPermanent, createdAt: FieldValue.serverTimestamp() ));
  }
}
