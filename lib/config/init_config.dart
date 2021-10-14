import 'package:style_on_app/exports.dart';
import 'package:style_on_app/exports/ui_exports.dart';

initConfig() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}
