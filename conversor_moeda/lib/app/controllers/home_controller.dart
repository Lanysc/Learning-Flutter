import 'package:flutter/cupertino.dart';

import '../models/currency_model.dart';


class HomeController {
  late List<CurrencyModel> currencies;

  final TextEditingController toText;
  final TextEditingController fromText;

  late CurrencyModel toCurrency;
  late CurrencyModel fromCurrency;

  HomeController(this.toText, this.fromText) {
    currencies = CurrencyModel.getCurrencies();
    toCurrency = currencies[0];
    fromCurrency = currencies[1];
  }

  void convert () {
    String text = toText.text;
    double value = double.tryParse(text.replaceAll(',', '.')) ?? 1.0;
    double result = 0.0;

    switch (fromCurrency.name) {
      case 'Real':
        result = value * toCurrency.real;
        break;
      case 'Dollar':
        result = value * toCurrency.dollar;
        break;
      case 'Euro':
        result = value * toCurrency.euro;
        break;
      case 'Bitcoin':
        result = value * toCurrency.bitcoin;
        break;
    }
    
    fromText.text = result.toStringAsFixed(2);
  }

}