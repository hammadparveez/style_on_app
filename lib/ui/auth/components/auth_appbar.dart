
import 'package:style_on_app/exports.dart';

class AuthAppBarWidget extends AppBar {
  final VoidCallback onSkipPress;
  final VoidCallback? onBackPress;
  AuthAppBarWidget({
    Key? key,
    required this.onSkipPress,
    this.onBackPress,
  }) : super(
          key: key,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              onPressed: () => onBackPress ?? navigatorKey.currentState?.pop(),
              icon: Icon(Icons.arrow_back_ios_new)),
          elevation: 0,
          actions: [
            TextButton(
                style: const ButtonStyle(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                onPressed: onSkipPress,
                child: Row(
                  children: const [
                    Text("Skip"),
                    Icon(Icons.arrow_forward_ios_rounded),
                  ],
                ))
          ],
        );
}
