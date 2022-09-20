import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
 
void main()
{
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learning',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:MyHomePage(),
    );
  }
}
 
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState()
  {
    return _MyHomePageState();
  }
}
 
class _MyHomePageState extends State<MyHomePage> {
  List <Widget> countries = [
    Text("India"),
    Text("Usa"),
    Text("Uk"),
    Text("Australia"),
    Text("Africa"),
    Text("New zealand"),
    Text("Germany"),
    Text("Italy"),
    Text("Russia"),
    Text("China"),
  ];
  String selectedValue = "";
  @override
  Widget build(BuildContext context) {
    return new CupertinoPageScaffold(
      navigationBar:CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            onPressed: ()
            {
 
            },
            color: CupertinoColors.label,
          ),
          middle: Text("Profile"),
        ),
      child:Container(
        margin: EdgeInsets.all(40),
        width: double.infinity,
        height: MediaQuery.of(context).size.height*0.50,
        //alignment: Alignment.topCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: Text("Show DatePicker"),
              onPressed: (){
                showPicker();
              },
            ),
            Material(
              child: Text(
                  selectedValue,
                  style: TextStyle(
                      fontSize: 18
                  ),
                ),
            ),
          ]
        )
      ),
    );
  }
 
  void showPicker()
  {  showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return Container(
          height: MediaQuery.of(context).copyWith().size.height*0.25,
          color: Colors.white,
          child: CupertinoPicker(
            children: countries,
            onSelectedItemChanged: (value){
                Text text = countries[value];
                selectedValue = text.data.toString();
                setState(() {
 
                });
            },
            itemExtent: 25,
            diameterRatio:1,
            useMagnifier: true,
            magnification: 1.3,
            looping: true,
          )
        );
      }
    );
  }
}
