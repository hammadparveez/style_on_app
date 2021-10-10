import 'package:style_on_app/exports.dart';


class StyleOTitleWidget extends StatelessWidget {
  const StyleOTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: AppStrings.style),
          TextSpan(
              text: AppStrings.O,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  ?.copyWith(
                      fontSize: 55, fontWeight: FontWeight.w900)),
        ],
      ),
      style: Theme.of(context).textTheme.headline1,
    );
  }
}
