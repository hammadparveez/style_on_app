
import 'package:style_on_app/exports.dart';

class AuthWidgetTitleComponent extends StatelessWidget {
  const AuthWidgetTitleComponent({
    Key? key,
    required this.heading,
  }) : super(key: key);
  final String heading;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const StyleOTitleWidget(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(heading,
              style: Theme.of(context).textTheme.headline3),
        ),
      ],
    );
  }
}
