import 'package:style_on_app/domain/model/address/address_model.dart';
import 'package:style_on_app/domain/repository/firebase_repo.dart';

abstract class AddressRepository {
  

  setAddress(AddressModel model);
  updateAddress(AddressModel model);
  resetAddress(AddressModel model);
  getAddress(AddressModel model);
  
}
