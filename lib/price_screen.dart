import 'package:flutter/material.dart';
import 'coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io'show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency= 'USD';

  DropdownButton<String> androidDropdown(){

    List<DropdownMenuItem<String>> dropdownItems = [];//리스트중에서도 드랍다운메뉴아이템의 스트링속성만가지고있는 리스트가 드랍다운아이템이라는 말임ㅋㅋ근데 비었음ㅋㅋ
    for (String currency in currenciesList){//for in 루프문을 써주면 간편해요 ^^
      var newItem = DropdownMenuItem(//동적변수var newItem은  DropdownMenuItem의 텍스트와 성질이랑 같다는거임ㅋㅋ
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);//그 빈공간에 뉴아이템을 채워주는거임ㅋㅋ
    }
    return DropdownButton<String>(
        value: selectedCurrency,
        items:dropdownItems,
        onChanged: (value){
          setState(() {
            selectedCurrency= value;
          });
        });}
  CupertinoPicker iOSPicker(){
    List<Text> pickerItems = [];
    for (String currency in currenciesList){
      pickerItems.add(Text(currency));
    }

   return CupertinoPicker(
      backgroundColor: Colors.lightBlueAccent,
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex){
        print(selectedIndex);
      },
      children:pickerItems,
    );}



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
                  '1 BTC = ? USD',
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
            color: Colors.lightBlueAccent,
            child:Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

