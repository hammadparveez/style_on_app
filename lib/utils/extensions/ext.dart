import 'package:style_on_app/exports.dart';

extension Responsiveness on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  double h([double v = 1]) => v * MediaQuery.of(this).size.height;
  double w([double v = 1]) => v * MediaQuery.of(this).size.width;
  double get safeArea =>
      MediaQuery.of(this).padding.top + MediaQuery.of(this).padding.bottom;
  double heightWithSafeArea([double v = 1]) =>
      v * (MediaQuery.of(this).size.height) - safeArea;
  double dp([double v = 1]) {
    return v * ((orientation == Orientation.portrait) ? h() / w() : w() / h());
  }
}
