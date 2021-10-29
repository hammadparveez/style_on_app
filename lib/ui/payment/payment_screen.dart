import 'package:flutter_credit_card/flutter_credit_card.dart';

import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/address/address_screen.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';
import 'package:style_on_app/utils/extensions/ext.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late TextEditingController _ccController,
      _expiryController,
      _cvvController,
      _cardHolderController;
  bool _isCardFlipped = false;

  @override
  void initState() {
    super.initState();
    _ccController = TextEditingController();
    _expiryController = TextEditingController();
    _cvvController = TextEditingController();
    _cardHolderController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _ccController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
  }

  _onCardNumerInput(String? value) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPadding20),
          child: SizedBox(
            height:
                context.heightFactor() - (context.safeArea + kToolbarHeight),
            child: Column(
              children: [
                CreditCardWidget(
                  onCreditCardWidgetChange: (brand) {},
                  cardNumber: _ccController.text,
                  expiryDate: _expiryController.text,
                  cardHolderName: _cardHolderController.text,
                  cvvCode: '123', //_cvvController.text,
                  showBackView: false,
                  width: context.heightFactor(.5),
                  textStyle: const TextStyle(
                      fontSize: kfontSmallest,
                      color: kWhiteColor,
                      fontFamily: 'halter',
                      package: 'flutter_credit_card',
                      fontWeight: FontWeight.w500),
                  obscureCardCvv: false,
                  obscureCardNumber: false,
                  isHolderNameVisible: true,
                  backgroundImage: ImagePaths.ccBG,
                  glassmorphismConfig: Glassmorphism(
                      blurX: 0,
                      blurY: 0,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: <Color>[
                          kDarkRed.withOpacity(.9),
                          kThemeColor,
                        ],
                        stops: const <double>[
                          0.1,
                          .2,
                        ],
                      )),
                ),
                largestVrtSpacer,
                CustomizedTextFieldWithLabel(
                  onValueChange: _onCardNumerInput,
                  controller: _ccController,
                  label: AppStrings.creditCardNo,
                  hintText: AppStrings.enterCCno,
                ),
                CustomizedTextFieldWithLabel(
                  controller: _cardHolderController,
                  label: AppStrings.nameOnCard,
                  hintText: AppStrings.enterCCName,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomizedTextFieldWithLabel(
                        controller: _expiryController,
                        label: AppStrings.ccExp,
                        hintText: AppStrings.enterExptDate,
                      ),
                    ),
                    mediumHztSpacer,
                    Flexible(
                      child: CustomizedTextFieldWithLabel(
                        controller: _cvvController,
                        label: AppStrings.cvv,
                        hintText: AppStrings.enterCVV,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomElevatedButton(
                          onTap: () {},
                          buttonColor: kThemeColor,
                          text: Text(AppStrings.cod)),
                      CustomElevatedButton(
                          onTap: () {},
                          buttonColor: kThemeColor,
                          text: Text(AppStrings.payNow)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomizedTextFieldWithLabel extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onValueChange;
  final TextInputType? keyboardType;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final TextStyle? labelTextStyle;
  final InputBorder? primaryBorder;
  final String label, hintText;
  const CustomizedTextFieldWithLabel({
    Key? key,
    required this.controller,
    required this.label,
    required this.hintText,
    this.validator,
    this.onValueChange,
    this.keyboardType,
    this.hintTextStyle,
    this.inputTextStyle,
    this.labelTextStyle,
    this.primaryBorder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _defaultTextStyle = Theme.of(context)
        .textTheme
        .bodyText2
        ?.copyWith(fontSize: kfontSmallest13, fontWeight: FontWeight.bold);
    final _defaultBorder = Theme.of(context)
        .inputDecorationTheme
        .enabledBorder
        ?.copyWith(borderSide: BorderSide(color: kMedGrey, width: 1.5));
    return Padding(
      padding: const EdgeInsets.only(bottom: kPadding20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: labelTextStyle ?? _defaultTextStyle),
          TextFormField(
            validator: validator,
            controller: controller,
            onChanged: onValueChange,
            style: inputTextStyle ?? _defaultTextStyle,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                isDense: true,
                enabledBorder: primaryBorder ?? _defaultBorder,
                focusedBorder: primaryBorder ?? _defaultBorder,
                hintText: hintText,
                hintStyle: hintTextStyle ??
                    _defaultTextStyle?.copyWith(color: kMedGrey)),
          ),
        ],
      ),
    );
  }
}
