import 'package:style_on_app/exports.dart';

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
