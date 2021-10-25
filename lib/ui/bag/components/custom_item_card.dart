import 'package:style_on_app/exports.dart';

class CustomItemCard extends StatelessWidget {
  const CustomItemCard({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.h(.15),
      padding: const EdgeInsets.all(kPadding10),
      margin: const EdgeInsets.only(bottom: kPadding15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kValue10),
        color: kWhiteColor,
        boxShadow: const [
          BoxShadow(color: kLightGrey, blurRadius: 5),
        ],
      ),
      child: child,
    );
  }
}
