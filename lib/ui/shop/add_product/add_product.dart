import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_on_app/exports.dart';
import "package:path/path.dart" as path;

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  late TextEditingController titleController,
      descriptionController,
      quantityController,
      brandController,
      priceController,
      discountPriceController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    quantityController = TextEditingController();
    brandController = TextEditingController();
    priceController = TextEditingController();
    discountPriceController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    brandController.dispose();
    priceController.dispose();
    discountPriceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Title
          _textField(titleController, "Title"),
          //Brand company name
          _textField(brandController, "Brand"),
          //Desc
          _textField(descriptionController, "Desc"),
          //Product Quantitiy
          _textField(quantityController, "Quantity"),
          //Price
          _textField(priceController, "Price"),
          //Discount Price optional
          _textField(discountPriceController, "Discount Price"),
          ElevatedButton(
              onPressed: () async {
                final imagePicker = ImagePicker();
                // final xfile =
                //     await imagePicker.pickImage(source: ImageSource.gallery);
                // String ext = path.extension(xfile!.path);
                final url = await FirebaseStorage.instance
                    .ref('Photos/842534.png')
                    .getDownloadURL();
                debugPrint("$url");
                // final uploadTask =  FirebaseStorage.instance
                //     .ref('Photos/${Random().nextInt(9099090)}${ext}')

                //     .putFile(File(xfile.path));
              },
              child: Text("Add Product")),
          //Images

          ///optional
          //Color
          //Size
        ],
      ),
    );
  }

  TextFormField _textField(
    TextEditingController controller,
    String title, {
    Function(String?)? onChanged,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          hintText: title, hintStyle: const TextStyle(color: Colors.white)),
    );
  }
}
