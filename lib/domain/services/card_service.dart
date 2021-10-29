import 'package:style_on_app/exports/ui_exports.dart';

enum CardServiceFieldType {
  cardNumber,
  cardHolder,
  cardExpiry,
  cardCVV,
}

class CardService extends ChangeNotifier {
  String _cardNumber = '';
  String _cardHolder = '';
  String _cardExpiry = '';
  String _cardCVV = '';
  bool _isCardFlipped = false;
  String get cardHolder => _cardHolder;
  bool get isCardFlipped => _isCardFlipped;

  String get cardNumber => _cardNumber;

  String get cardExpiry => _cardExpiry;
  String get cardCVV => _cardCVV;

  updateCardNo(String num) {
    _cardNumber = num;
    notifyListeners();
  }

  updateCardHolder(String name) {
    _cardHolder = name;
  }

  updateCardExpiry(String expiry) {
    _cardExpiry = expiry;
  }

  updateCardCvv(String cvv) {
    _cardCVV = cvv;
    notifyListeners();
  }

  hasCardFilpped() {
    _isCardFlipped = !_isCardFlipped;
    notifyListeners();
  }
}
