import 'package:style_on_app/exports/ui_exports.dart';
import 'package:style_on_app/exports/utils_export.dart';
import 'package:style_on_app/ui/address/address_screen.dart';

import 'package:style_on_app/utils/extensions/ext.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kThemeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPadding20),
          child: Column(
            children: [
              CreditCardWidget(
                onCreditCardWidgetChange: (brand) {
                  debugPrint("Brand ${brand.brandName}");
                },
                cardNumber: '3744 4444 4444 4444',
                expiryDate: '02/23',
                cardHolderName: 'Mason Ali',
                cvvCode: '125',
                showBackView: false,
                labelCardHolder: 'Hammad Parveez',
                obscureCardCvv: false,
                obscureCardNumber: false,
                isHolderNameVisible: true,
                labelExpiredDate: "Exp:",
                cardBgColor: kMedRed,
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
              _buildFieldWithDefaultPadding(
                DefaultTextStyle(
                  style: TextStyle(color: kThemeColor),
                  child: TextFormField(
                    decoration:
                        InputDecoration(hintText: AppStrings.creditCardNo),
                  ),
                ),
              ),
              _buildFieldWithDefaultPadding(
                CustomLabeledTextField(
                    labelText: AppStrings.nameOnCard,
                    hintText: AppStrings.enterCCName,
                    controller: TextEditingController()),
              ),
              // _buildFieldWithDefaultPadding(
              //   Row(
              //     children: [
              //       CustomLabeledTextField(
              //           labelText: AppStrings.ccExp,
              //           hintText: AppStrings.enterExptDate,
              //           controller: TextEditingController()),
              //       mediumHztSpacer,
              //       Flexible(
              //         child: CustomLabeledTextField(
              //             labelText: AppStrings.cvv,
              //             hintText: AppStrings.enterCVV,
              //             controller: TextEditingController()),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _buildFieldWithDefaultPadding(Widget child) {
    return Padding(
        padding: const EdgeInsets.only(bottom: kPadding10), child: child);
  }
}
