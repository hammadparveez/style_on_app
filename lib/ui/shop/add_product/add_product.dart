import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;

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
  List<XFile>? pickedFile;
  late ImagePicker imagePicker;
  late TextEditingController titleController,
      descriptionController,
      quantityController,
      brandController,
      priceController,
      discountPriceController,
      optionalFieldsController,
      categoryController;

  @override
  void initState() {
    super.initState();
    imagePicker = ImagePicker();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
    quantityController = TextEditingController();
    brandController = TextEditingController();
    priceController = TextEditingController();
    discountPriceController = TextEditingController();
    optionalFieldsController = TextEditingController();
    categoryController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    quantityController.dispose();
    brandController.dispose();
    priceController.dispose();
    discountPriceController.dispose();
    optionalFieldsController.dispose();
    categoryController.dispose();
    super.dispose();
  }

  _onImageAdd() async {
    pickedFile = await imagePicker.pickMultiImage();
  }

  _onSaveData() async {
    if (pickedFile != null && pickedFile!.isNotEmpty) {
      List<String>? storagePaths;
      final title = titleController.text;
      final brand = brandController.text;
      final category = categoryController.text;
      final desc = descriptionController.text;
      final qty = quantityController.text;
      final price = priceController.text;
      final discountPrice = discountPriceController.text;
      const uuid = Uuid();
      //Excluding -(dashes) and Alphabets (a-z)
      for (var image in pickedFile!) {
        final imageId = uuid.v4().replaceAll(RegExp(r"[a-z]+|-"), '');
        final fileExt = path.extension(image.path);
        final imageName = imageId + fileExt;
        final storagePath = "Products/$category/$brand/$imageName";
          storagePaths!.add(storagePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Title
              _textField(titleController, "Title"),
              //Brand company name
              _textField(brandController, "Brand"),
              //Desc
              _textField(descriptionController, "Desc"),
              //Category
              _textField(categoryController, "Desc"),
              //Product Quantitiy
              _textField(quantityController, "Quantity"),
              //Price
              _textField(priceController, "Price"),
              //Discount Price optional
              _textField(discountPriceController, "Discount Price"),
              //Images
              ElevatedButton(onPressed: _onImageAdd, child: Text("Add Image")),

              ///optional Color: 0xff0000ff, 0xff00ff00, 0xffff0000 / Size: M,L,S / Weight: 200KG, 150KG 0.5KG
              _textField(optionalFieldsController, "Discount Price"),
              //Add Product Button
              ElevatedButton(
                  onPressed: _onSaveData, child: Text("Add Product")),
            ],
          ),
        ),
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
