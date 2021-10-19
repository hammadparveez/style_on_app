import 'package:style_on_app/exports/pkgs_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';

class LocalService {
  static final LocalService _instance = LocalService._();

  LocalService._();
  factory LocalService() => _instance;

  final _box = Hive.box(appBoxName);

  bool hasOnBoardSeen() {
    final hasSeen = _box.get(onBoardKey) ?? false;
    return hasSeen;
  }

  void setOnBoardSeen() {
    _box.put(onBoardKey, true);
  }
}
