import 'package:style_on_app/exports.dart';

initConfig() async {
  await Hive.initFlutter();
  await Firebase.initializeApp();
  await Hive.openBox(appBoxName);
}
