import 'dart:developer';

import 'package:flutter_hooks/flutter_hooks.dart';
import "package:flash/flash.dart" as flash;
import 'package:style_on_app/exports.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
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

  _onSetData() async {
    context.showErrorBar(
        content: Text(
          "Something went wrong",
        ),
        duration: Duration(seconds: 10));
    //var isValid = _formKey.currentState?.validate() ?? false;
    //await Future.delayed(Duration(milliseconds: 2));
    //var focusScope = FocusScope.of(context);
    //if (focusScope.hasPrimaryFocus) focusScope.unfocus();
    //FocusManager.instance.primaryFocus!.unfocus();
    // WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
  }

  String? _firstNameValidator(String? value) {
    if (value!.isEmpty) return "First Name must be filled";
  }

  String? _lastNameValidator(String? value) {}
  String? _addrValidator(String? value) {}
  String? _cityValidator(String? value) {}
  String? _zipCodeValidator(String? value) {}
  String? _stateValidator(String? value) {}
  String? _phoneNoValidator(String? value) {}

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
      resizeToAvoidBottomInset: true,
      appBar: DefaultAppBar(appBarColor: kTransParent),
      body: LayoutBuilder(builder: (context, cons) {
        log("Constraints $cons");
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPadding20),
            child: Column(
              children: [
                mediumVrtSpacer,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        onTap: () {
                          log("Tapped");
                          WidgetsBinding.instance?.focusManager.primaryFocus
                              ?.unfocus();
                        },
                        child: Text(AppStrings.shipping, style: _defaultStyle)),
                    _circles,
                    Text(AppStrings.payment,
                        style: _defaultStyle?.copyWith(color: kDarkGrey)),
                    _circles,
                    Text(AppStrings.orderPlaced,
                        style: _defaultStyle?.copyWith(color: kDarkGrey)),
                  ],
                ),
                mediumVrtSpacer,
                Text(AppStrings.addShippingInfo,
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        ?.copyWith(color: kThemeColor, fontSize: kfont20)),
                mediumVrtSpacer,
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.firstName,
                          hintText: AppStrings.enterFirstName,
                          validator: _firstNameValidator,
                          controller: firstNameController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.lastName,
                          validator: _lastNameValidator,
                          hintText: AppStrings.enterLastName,
                          controller: lastNameController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.address,
                          validator: _addrValidator,
                          hintText: AppStrings.enterAddress,
                          controller: addressController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.city,
                          hintText: AppStrings.enterCity,
                          validator: _cityValidator,
                          controller: cityController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.zipCode,
                          validator: _zipCodeValidator,
                          hintText: AppStrings.enterZipCode,
                          controller: stateController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.state,
                          validator: _stateValidator,
                          hintText: AppStrings.enterState,
                          controller: zipCodeController)),
                      _buildFieldWithDefaultPadding(CustomLabeledTextField(
                          labelText: AppStrings.mobileNo,
                          validator: _phoneNoValidator,
                          hintText: AppStrings.enterPhoneNo,
                          controller: mobileNoController)),
                    ],
                  ),
                ),
                FullWidthIconButton(
                    buttonColor: kThemeColor,
                    text: const Text(AppStrings.proceedToPay),
                    onTap: _onSetData),
              ],
            ),
          ),
        );
      }),
    );
  }

  _buildFieldWithDefaultPadding(Widget child) {
    return Padding(
        padding: const EdgeInsets.only(bottom: kPadding10), child: child);
  }

  _buildCircle([double radius = kValue10]) {
    return SizedBox.square(
      dimension: radius,
      child: const CircleAvatar(backgroundColor: kThemeColor),
    );
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
