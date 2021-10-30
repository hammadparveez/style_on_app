import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports/pkgs_exports.dart';

import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/address/address_screen.dart';
import 'package:style_on_app/ui/base_widgets/default_appbar.dart';
import 'package:style_on_app/utils/extensions/ext.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart'
    as mask;

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

  @override
  void initState() {
    super.initState();
    _ccController = MaskedTextController(mask: '0000 0000 0000 0000');
    _expiryController = MaskedTextController(mask: '00/00');
    _cvvController = MaskedTextController(mask: '0000');
    _cardHolderController = TextEditingController();
    context.read(cardNumberService).reset();
    Future.microtask(() => context.read(cardNumberService).updateCardNo(''));
  }

  @override
  void didUpdateWidget(covariant PaymentScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    log("Did Update Widget PamentScreen");
  }

  @override
  void dispose() {
    _ccController.dispose();
    _expiryController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }

  _onCardNumerInput(String? value) {
    context.read(cardNumberService).updateCardNo(value!);
    setState(() {});
  }

  _onCardHolderInput(String? value) {
    context.read(cardNumberService).updateCardHolder(value!);
  }

  _onCardExpiryInput(String? value) {
    context.read(cardNumberService).updateCardExpiry(value!);
  }

  _onCardCvvInput(String? value) {
    context.read(cardNumberService).updateCardCvv(value!);
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
                Consumer(builder: (context, watch, child) {
                  return CreditCardWidget(
                    onCreditCardWidgetChange: (brand) {
                      debugPrint("Card Change");
                    },
                    cardNumber: watch(cardNumberService).cardNumber,
                    expiryDate: watch(cardNumberService).cardExpiry,
                    cardHolderName: watch(cardNumberService).cardHolder,
                    cvvCode: watch(cardNumberService).cardCVV,
                    showBackView: false,
                    width: context.heightFactor(.5),
                    textStyle: const TextStyle(
                        fontSize: kfontSmallest,
                        color: kWhiteColor,
                        shadows: [Shadow(color: kDarkGrey, blurRadius: 1)],
                        fontFamily: 'halter',
                        package: 'flutter_credit_card',
                        fontWeight: FontWeight.w500),
                    obscureCardCvv: false,
                    obscureCardNumber: false,
                    isHolderNameVisible: true,
                    backgroundImage: ImagePaths.ccBG,
                  );
                }),
                largestVrtSpacer,
                CustomizedTextFieldWithLabel(
                  keyboardType: TextInputType.number,
                  onValueChange: _onCardNumerInput,
                  controller: _ccController,
                  label: AppStrings.creditCardNo,
                  hintText: AppStrings.enterCCno,
                ),
                CustomizedTextFieldWithLabel(
                  onValueChange: _onCardHolderInput,
                  controller: _cardHolderController,
                  label: AppStrings.nameOnCard,
                  hintText: AppStrings.enterCCName,
                ),
                Row(
                  children: [
                    Flexible(
                      child: CustomizedTextFieldWithLabel(
                        keyboardType: TextInputType.number,
                        onValueChange: _onCardExpiryInput,
                        controller: _expiryController,
                        label: AppStrings.ccExp,
                        hintText: AppStrings.enterExptDate,
                      ),
                    ),
                    mediumHztSpacer,
                    Flexible(
                      child: CustomizedTextFieldWithLabel(
                        keyboardType: TextInputType.number,
                        onValueChange: _onCardCvvInput,
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
                          text: const Text(AppStrings.cod)),
                      CustomElevatedButton(
                          onTap: () {},
                          buttonColor: kThemeColor,
                          text: const Text(AppStrings.payNow)),
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
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLimit;

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
    this.inputFormatters,
    this.maxLimit,
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
            //inputFormatters: inputFormatters,
            autofillHints: [AutofillHints.creditCardExpirationDate],
            validator: validator,
            controller: controller,
            onChanged: onValueChange,
            style: inputTextStyle ?? _defaultTextStyle,
            keyboardType: keyboardType,
            maxLength: maxLimit,
            decoration: InputDecoration(
                counterText: '',
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

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    log("OldValue $oldValue and NewValue $newValue");
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // if (text.length == 2) {
    //   if (oldValue.text) string = text;
    // }

    return newValue.copyWith(
        text: text, selection: TextSelection.collapsed(offset: text.length));
  }
}
