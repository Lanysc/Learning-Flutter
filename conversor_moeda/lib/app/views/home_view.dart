// ignore_for_file: prefer_const_constructors, sort_child_properties_last, deprecated_member_use

import 'dart:ffi';

import 'package:flutter/material.dart';

import '../components/currency_box.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();
  final TextEditingController fromText = TextEditingController();
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText, fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30, top: 100, bottom: 20),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png', 
                  width: 150, 
                  height: 150
                ),
                SizedBox(
                  height: 50,
                ),
                
                CurrencyBox(
                  selecterdItem: homeController.toCurrency,
                  controller: toText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.toCurrency = model!;
                    });
                  },
                  ),
                SizedBox(
                  height: 10,
                ),
        
                CurrencyBox(
                  selecterdItem: homeController.fromCurrency,
                  controller: fromText,
                  items: homeController.currencies,
                  onChanged: (model) {
                    setState(() {
                      homeController.fromCurrency = model!;
                    });
                  },
                  ),
                SizedBox(
                  height: 50,
                ),
                
                RaisedButton(
                  onPressed: () {
                    homeController.convert();
                  }, 
                  child: Text('CONVERTER'),
                  color: Colors.amber,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}