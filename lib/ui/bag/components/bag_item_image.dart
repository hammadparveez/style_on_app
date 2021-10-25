
import 'package:style_on_app/exports.dart';

class BagItemImage extends StatelessWidget {
  final double? height, width;
  final String imageUri;

  const BagItemImage(
      {Key? key, this.height, this.width, required this.imageUri})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingDefault),
      child: Image.network(
        imageUri,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
