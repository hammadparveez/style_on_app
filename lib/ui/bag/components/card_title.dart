import 'package:style_on_app/exports/ui_exports.dart';

class CardTitle extends StatelessWidget {
  const CardTitle(this.title,{
    Key? key,
    
  this.style,
  }) : super(key: key);

  final String title;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style ?? Theme.of(context).textTheme.bodyText1,
    );
  }
}