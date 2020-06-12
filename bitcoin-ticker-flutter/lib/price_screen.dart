import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = currenciesList[0];
  double bTCValue = 0;

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> itemList = [];
    for (String currency in currenciesList) {
      itemList.add(DropdownMenuItem(
        child: Text(currency),
        value: currency,
      ));
    }
    return itemList;
  }

  DropdownButton getAndroidDropdownButton(
      {List<DropdownMenuItem<String>> items, String defaultValue}) {
    return DropdownButton(
      value: defaultValue,
      items: items,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCoinData();
        });
      },
    );
  }

  List<Text> getPickerItems() {
    List<Text> itemList = [];
    for (String currency in currenciesList) {
      itemList.add(Text(currency));
    }
    return itemList;
  }

  CupertinoPicker getIOSPicker({List<Text> items}) {
    return CupertinoPicker(
      backgroundColor: Colors.blue,
      itemExtent: 32.0,
      children: items,
      onSelectedItemChanged: (index) {
        setState(() {
          selectedCurrency = currenciesList[index];
          getCoinData();
        });
      },
    );
  }

  Future<void> getCoinData() async {
    CoinData coinData = CoinData();
    double value = await coinData.getBTCData(selectedCurrency);
    setState(() {
      bTCValue = value;
    });
  }

  @override
  void initState() {
    super.initState();
    getCoinData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = $bTCValue $selectedCurrency',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS
                ? getIOSPicker(items: getPickerItems())
                : getAndroidDropdownButton(
                    defaultValue: selectedCurrency, items: getDropdownItems()),
          ),
        ],
      ),
    );
  }
}
