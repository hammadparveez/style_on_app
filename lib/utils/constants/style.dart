import 'package:style_on_app/exports.dart';


  //font sizes
   const double kfontSmallest = 12.5;
   const double kfont14 = 14;
   const double kfont16 = 16;
   const double kfont18 = 18;
   const double kfont20 = 20;
   const double kfont25 = 25;
   const double kfont35 = 35;
   const double kfontLarge = 50;
   const double kfontLargest = 55;

  //Values
   const double kValue8 = 8;
   const double kValue10 = 10;
   const double kValue20 = 20;
   const double kValue25 = 25;
   const double kValue30 = 30;
   const double kValue35 = 35;

  //Padding
   const double kPaddingDefault = 8;
   const double kPadding10 = 10;
   const double kPadding20 = 20;

  //Colors
   const kThemeColor = Color(0xFF3D3D3D);
   const kWhiteColor = Color(0xFFFFFFFF);
   const kLightGrey = Color(0xFFE6E6E6);
   const kMedGrey = Color(0xFFBBBBBB);
   const kDarkGrey = Color(0xFF949494);
   const kDarkestGrey = Color(0xFF4D4D4D);
   const kLightRed = Color(0xFFFF6A6A);
   const kMedRed = Color(0xFFFA4F4F);
   const kDarkRed = Color(0xFFF82E2E);

  //Widgets
  //Vertical Spacers
   const smallVrtSpacer =  SizedBox(height: kValue8);
   const mediumVrtSpacer =  SizedBox(height: kValue10);
   const largeVrtSpacer =  SizedBox(height: kValue20);
   const largestVrtSpacer =  SizedBox(height: kValue30);
  //Horizontal Spacers
   const smallHztSpacer =  SizedBox(width: kValue8);
   const mediumHztSpacer =  SizedBox(width: kValue10);
   const largeHztSpacer =  SizedBox(width: kValue20);
   const largestHztSpacer =  SizedBox(width: kValue30);

  //TextStyles
   const smallestTextStyle = TextStyle(
    fontSize: kfontSmallest,
    color: kDarkGrey,
  );
   const smallestBTextStyle = TextStyle(
    fontSize: kfontSmallest,
    color: kDarkGrey,
    fontWeight: FontWeight.w600,
  );
   const defaultTextStyle = TextStyle(
    color: kDarkestGrey,
  );
   const defaultBTextStyle = TextStyle(
    color: kDarkestGrey,
    fontWeight: FontWeight.w600,
  );
   const medTextStyle = TextStyle(
    fontSize: kfont16,
    color: kDarkestGrey,
  );
   const medBTextStyle = TextStyle(
    fontSize: kfont16,
    color: kDarkestGrey,
    fontWeight: FontWeight.w600,
  );
   const bigBTextStyle = TextStyle(
    fontSize: kfont35,
    color: kWhiteColor,
  );
   const biggerBTextStyle = TextStyle(
    fontSize: kfontLarge,
    color: kWhiteColor,
    fontWeight: FontWeight.w600,
  );
   const biggestBTextStyle = TextStyle(
    fontSize: kfontLargest,
    color: kWhiteColor,
    fontWeight: FontWeight.w600,
  );

