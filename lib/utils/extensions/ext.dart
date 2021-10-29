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

  double heightFactor([double v = 1]) {
    if (orientation == Orientation.portrait) {
      return v * h();
    } else {
      return v * w();
    }
  }

  double widthFactor([double v = 1]) {
    if (orientation == Orientation.portrait) {
      return v * w();
    } else {
      return v * h();
    }
  }
}
