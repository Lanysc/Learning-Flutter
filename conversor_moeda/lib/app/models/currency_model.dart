class CurrencyModel {
  final String name;
  final double real;
  final double dollar;
  final double euro;
  final double bitcoin;

  CurrencyModel(this.name, this.real, this.dollar, this.euro, this.bitcoin);

  static List<CurrencyModel> getCurrencies() {
    return <CurrencyModel> [
      CurrencyModel('Real', 1.0, 0.18, 0.15, 0.000016),
      CurrencyModel('Dollar', 5.65, 1.0, 0.85, 0.000088),
      CurrencyModel('Euro', 6.62, 1.17, 1.0, 0.00010),
      CurrencyModel('Bitcoin', 64116.61, 11351.00, 9689.00, 1),
    ];
  }
}