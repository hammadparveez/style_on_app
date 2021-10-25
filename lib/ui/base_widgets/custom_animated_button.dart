import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';

bool _debugValues(bool value, String? text) {
  if (value && text == null) {
    return false;
  }
  // else if (!value && text != null) {
  //   return false;
  // }
  return true;
}

enum BackwardForwardType {
  backward,
  forward,
}

class CustomAnimatedButton extends StatelessWidget {
  ///In order to get the width of Text via TextPainter;
  final String? backwardText, forwardText;
  final bool showBackward, showForward;
  final VoidCallback? onBackwardTap, onForwardTap;
  CustomAnimatedButton({
    Key? key,
    this.forwardText,
    this.backwardText,
    this.showBackward = false,
    this.showForward = false,
    this.onForwardTap,
    this.onBackwardTap,
  })  : assert(_debugValues(showBackward, backwardText),
            "showBackward $showBackward && backwardText $backwardText"),
        assert(_debugValues(showForward, forwardText),
            "showForward $showForward && forwardText $forwardText"),
        super(key: key);

  Size _textSize(String text, [TextStyle? style]) {
    if (text.isEmpty) return Size.zero;
    final textPaint = TextPainter(
        text: TextSpan(text: text, style: style),
        textDirection: TextDirection.ltr)
      ..layout();
    return textPaint.size;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constriants) {
      final backwardBtnWidth = _textSize(backwardText ?? '').width;
      final forwardBtnWidth = _textSize(forwardText ?? '').width;
      final halfBackwardWidth = (constriants.maxWidth - backwardBtnWidth) / 2.5;
      final halfForwardWidth = (constriants.maxWidth - forwardBtnWidth) / 2.5;
      return SizedBox(
        width: constriants.maxWidth,
        child: Builder(builder: (context) {
          if (showBackward) {
            return _buildAnimation(
              halfBackwardWidth,
              onBackwardTap,
              _backwardTextWithAnimation(halfBackwardWidth),
            );
          } else if (showForward) {
            return _buildAnimation(
              halfForwardWidth,
              onForwardTap,
              _forwardTextWithAnimation(halfBackwardWidth),
            );
          } else {
            return const SizedBox();
          }
        }),
      );
    });
  }

  Row _forwardTextWithAnimation(double halfBackwardWidth) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(forwardText!),
        _buildTweenArrowAnimation(halfBackwardWidth, Icons.arrow_forward_ios),
      ],
    );
  }

  Row _backwardTextWithAnimation(double halfBackwardWidth) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildTweenArrowAnimation(-halfBackwardWidth, Icons.arrow_back_ios),
        Text(backwardText!),
      ],
    );
  }

  CustomElevatedButton _buildAnimation(
      double halfBackwardWidth, VoidCallback? onTap, Widget child) {
    return CustomElevatedButton(
        buttonColor: kThemeColor, text: child, onTap: onTap ?? () {});
  }

  MirrorAnimation<Offset> _buildTweenArrowAnimation(
      double width, IconData icon) {
    return MirrorAnimation<Offset>(
        builder: (_, child, value) {
          return Transform.translate(
            offset: value,
            child: Icon(icon, color: kMedRed),
          );
        },
        curve: Curves.decelerate,
        tween: Tween(begin: Offset(0, 0), end: Offset(width, 0)));
  }
}
