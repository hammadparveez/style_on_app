import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:style_on_app/exports.dart';
import "package:path/path.dart" as path;
import 'package:style_on_app/exports/pkgs_exports.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  List<XFile>? pickedFile;
  bool hasPickedImage = false;
  late ImagePicker imagePicker;
  late TextEditingController titleController,
      descriptionController,
      quantityController,
      brandController,
      priceController,
      discountPriceController,
      optionalFieldsController,
      categoryController,
      deliveryOptionController,
      sellerNameController;

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
    deliveryOptionController = TextEditingController();
    sellerNameController = TextEditingController();
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
    deliveryOptionController.dispose();
    sellerNameController.dispose();
    super.dispose();
  }

  _onImageAdd() async {
    pickedFile = await imagePicker.pickMultiImage();
    if (pickedFile != null) setState(() => hasPickedImage = true);
  }

  _onSaveData() async {
    if (pickedFile != null && pickedFile!.isNotEmpty) {
      List<String>? storagePaths = [];
      final title = titleController.text;
      final brand = brandController.text;
      final category = categoryController.text;
      final desc = descriptionController.text;
      final qty = quantityController.text;
      final price = priceController.text;
      final discountPrice = discountPriceController.text;
      final options = optionalFieldsController.text;
      final sellerName = sellerNameController.text;

      const uuid = Uuid();
      final idBy = uuid.v1().replaceAll(RegExp(r"[a-z]+|-"), '');
      //Create Image IDs and Firebase Storage Paths List
      for (var image in pickedFile!) {
        //Excluding -(dashes) and Alphabets (a-z)
        final imageNumberID = uuid.v4().replaceAll(RegExp(r"[a-z]+|-"), '');
        final fileExt = path.extension(image.path);
        final imageName = imageNumberID + fileExt;
        final storagePath = "Products/$brand/$category/$idBy/$imageName";
        await FirebaseStorage.instance
            .ref(storagePath)
            .putFile(File(image.path));
        final downloadUrl =
            await FirebaseStorage.instance.ref(storagePath).getDownloadURL();
        storagePaths.add(downloadUrl);
      }
      final productImgSearlized = jsonEncode(storagePaths);
      log("URLS: $productImgSearlized");
      FirebaseFirestore.instance
          .collection("shop")
          .doc("products")
          .collection("products")
          .add({
        "productID": uuid.v1().replaceAll(RegExp(r"[a-z]+|-"), ''),
        "title": title,
        "description": desc,
        "images": productImgSearlized,
        "quantity": qty,
        "price": price,
        "discountPrice": discountPrice,
        "options": options,
        "seller": sellerName,
        "category": category,
        "brand": brand,
        "rating": 0,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
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
              _textField(categoryController, "Category"),
              //Product Quantitiy
              _textField(quantityController, "Quantity"),
              //Price
              _textField(priceController, "Price"),
              //Discount Price optional
              _textField(discountPriceController, "Discount Price"),

              _textField(sellerNameController, "Seller Name"),

              ///optional Color: 0xff0000ff, 0xff00ff00, 0xffff0000 / Size: M,L,S / Weight: 200KG, 150KG 0.5KG
              _textField(optionalFieldsController, "OptionalFields"),
              //Images
              ElevatedButton(onPressed: _onImageAdd, child: Text("Add Image")),
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
          suffixIcon: IconButton(
              icon: Icon(Icons.clear_sharp), onPressed: controller.clear),
          hintText: title,
          hintStyle: const TextStyle(color: Colors.white)),
    );
  }
}
