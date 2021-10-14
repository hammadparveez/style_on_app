import 'package:style_on_app/exports.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Title
          TextFormField(),
          //Brand company name
          TextFormField(),
          //Desc
          TextFormField(),
          //Product Quantitiy
          TextFormField(),
          //Price
          TextFormField(),
          //Discount Price optional
          TextFormField(),
          //Images

          ///optional
          //Color
          //Size
        ],
      ),
    );
  }
}
