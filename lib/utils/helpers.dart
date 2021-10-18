double parseString(String value) => int.parse(value).toDouble();

double calcDiscount(String total, String discount) {
  final price = parseString(total);
  final disCountPrice = parseString(discount);
  return (disCountPrice / price) * 100;
}
