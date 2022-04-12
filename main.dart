import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var fruitIndex = 0;
  String dropdownValue = '1';
  String selectedNumber = '';
  var fruit = ['Apple','Orange','Rambutan','Mango'];
  var number = ['1','2','3','4'];

  //initialize fruit index based on selected number
  void validateFruit() {
    setState(() {
      selectedNumber = dropdownValue;
      if(selectedNumber == '1')
        fruitIndex = 0;
      else if(selectedNumber == '2')
        fruitIndex = 1;
      else if(selectedNumber == '3')
        fruitIndex = 2;
      else  
        fruitIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fruit Chooser'),
        ),
        body: Center(
          child : Column(
          children: [
              Container( 
                child: Text('Choose your fruit\n\n1.Apple\n2.Orange\n3.Rambutan\n4.Mango', style: TextStyle(fontSize: 15),),
                margin: EdgeInsets.only(top: 20, bottom: 20),
              ), 
              
              Row( 
              mainAxisAlignment: MainAxisAlignment.center,
              children: [ 

              Container(
              margin: EdgeInsets.only(right: 10),
              child:  
              DropdownButton(
                value: dropdownValue,
                icon: Icon(Icons.keyboard_arrow_down),
                //iconSize: 
                //elevation: 
                //style: 
      
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: number.map((String items){
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items)
                  );
                }).toList(),
              ),),
              
              RaisedButton(
                child: Text('Select'),
                onPressed: validateFruit,
                color: Colors.blue,
                textColor: Colors.white,
              ),
              ]),

              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child :
                //Print Fruit on Text Widget 
                Text(selectedNumber == ''
                ? ' '
                : fruit[fruitIndex], 
                  style: TextStyle(fontSize: 15,)
                )
              ),

              
            ]),
        ),
      ),
    );
  }
}