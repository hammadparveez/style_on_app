import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late TextEditingController firstNameController,
      lastNameController,
      addressController,
      cityController,
      stateController,
      zipCodeController,
      mobileNoController;

  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    addressController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();
    zipCodeController = TextEditingController();
    mobileNoController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipCodeController.dispose();
    mobileNoController.dispose();
    super.dispose();
  }

  _buildCircle([double radius = kValue10]) {
    return SizedBox.square(
      dimension: radius,
      child: CircleAvatar(backgroundColor: kThemeColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _defaultStyle =
        Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: kfont16);
    var _circles = Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Row(
          children: [
            _buildCircle(),
            _buildCircle(kValue8),
            _buildCircle(kValue4),
          ],
        ));

    return Scaffold(
      appBar: DefaultAppBar(appBarColor: kTransParent),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPadding20),
        child: Column(
          children: [
            mediumVrtSpacer,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(AppStrings.shipping, style: _defaultStyle),
                _circles,
                Text(AppStrings.payment,
                    style: _defaultStyle?.copyWith(color: kDarkGrey)),
                _circles,
                Text(AppStrings.orderPlaced,
                    style: _defaultStyle?.copyWith(color: kDarkGrey)),
              ],
            ),
            mediumVrtSpacer,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppStrings.addShippingInfo,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          ?.copyWith(color: kThemeColor, fontSize: kfont20)),
                  mediumVrtSpacer,
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.firstName,
                      hintText: AppStrings.enterFirstName,
                      controller: firstNameController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.lastName,
                      hintText: AppStrings.enterLastName,
                      controller: lastNameController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.address,
                      hintText: AppStrings.enterAddress,
                      controller: addressController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.city,
                      hintText: AppStrings.enterCity,
                      controller: cityController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.zipCode,
                      hintText: AppStrings.enterZipCode,
                      controller: stateController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.state,
                      hintText: AppStrings.enterState,
                      controller: zipCodeController)),
                  _buildFieldWithDefaultPadding(CustomLabeledTextField(
                      labelText: AppStrings.mobileNo,
                      hintText: AppStrings.enterPhoneNo,
                      controller: mobileNoController)),
                ],
              ),
            ),
            FullWidthIconButton(
                buttonColor: kThemeColor,
                text: const Text(AppStrings.proceedToPay),
                onTap: () {}),
          ],
        ),
      ),
    );
  }

  _buildFieldWithDefaultPadding(Widget child) {
    return Padding(
        padding: const EdgeInsets.only(bottom: kPadding10), child: child);
  }
}

class CustomLabeledTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  const CustomLabeledTextField({
    Key? key,
    this.validator,
    required this.labelText,
    required this.hintText,
    required this.controller,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _inputDecoration = Theme.of(context).inputDecorationTheme;
    var _defaultBorder = _inputDecoration.border
        ?.copyWith(borderSide: BorderSide(color: kMedRed));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(fontSize: kfontSmallest13),
        ),
        TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
                isDense: true,
                border: _defaultBorder,
                enabledBorder: _defaultBorder,
                focusedBorder: _defaultBorder,
                hintStyle:
                    _inputDecoration.hintStyle?.copyWith(color: kDarkGrey),
                hintText: hintText)),
      ],
    );
  }
}
