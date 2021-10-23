import 'package:style_on_app/exports.dart';

initConfig() async {
  await Hive.initFlutter();
  
  await Firebase.initializeApp();
  await Hive.openBox(appBoxName);
  await Hive.openBox(cartBoxName);
  await Hive.openBox(wishlistBoxName);
  //await FirebaseFirestore.instance.clearPersistence();
  //FirebaseFirestore.instance.settings = const Settings(persistenceEnabled: false);
}
