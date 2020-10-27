import 'dart:math';

import 'package:flutter/material.dart'; 

void main() => runApp(MyApp()); 

class MyApp extends StatefulWidget { 
   @override 
   _MyAppState createState() => _MyAppState(); 
  } 

  class _MyAppState extends State<MyApp> {   
    final TextEditingController _height = TextEditingController(); 
    final TextEditingController _weight = TextEditingController(); 
    double height = 0.0, weight = 0.0, result=0.0;   
    String boer,james,hume,peters, boerBF,jamesBF,humeBF,petersBF; 
    //
    int selectedRadio,selectedRadio2;

    @override 
    void initState(){
      super.initState();
      selectedRadio = 0;
      selectedRadio2 =0;
    }
    setSelectedRadio(int val){
      setState((){
        selectedRadio = val;
      });
    }
    setSelectedRadio2(int val){
      setState((){
        selectedRadio2 = val;
      });
    }
    
  @override   
  Widget build(BuildContext context) { 
     return MaterialApp(      
        title: 'Material App',
        home: Scaffold(
          resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text('Lean Body Mass Calculator' ,
            style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.deepOrangeAccent,
          ),   
          body: SingleChildScrollView( 
          child: Column(
            children: <Widget>[   
              ButtonBar(  
                alignment: MainAxisAlignment.start, 
                 children: <Widget>[ 
                   Text('Gender',style:TextStyle(fontWeight: FontWeight.bold,fontSize:15)),
                   Radio(
                     value: 1,
                     groupValue: selectedRadio,
                     activeColor: Colors.red,
                     onChanged:(val){
                       print("Radio $val");
                       setSelectedRadio(val);
                     },  
                   ),
                    Text('Male',style:TextStyle(fontSize:13)),
                   Radio(
                     value: 2,
                     groupValue: selectedRadio,
                     activeColor: Colors.blue,
                     onChanged:(val){
                       print("Radio $val");
                       setSelectedRadio(val);
                     },
                   ),
                   Text('Female',style:TextStyle(fontSize:13)),
                 ],
               ),
               ButtonBar(  
                 alignment: MainAxisAlignment.start,
                 children: <Widget>[ 
                   Text('Age 14 or younger?',style:TextStyle(fontWeight: FontWeight.bold,fontSize:15)),
                   Radio(
                     value: 1,
                     groupValue: selectedRadio2,
                     activeColor: Colors.orange,
                     onChanged:(val){
                       print("Radio $val");
                       setSelectedRadio2(val);
                     },
                   ),
                    Text('Yes',style:TextStyle(fontSize:13)),
                   Radio(
                     value: 2,
                     groupValue: selectedRadio2,
                     activeColor: Colors.green,
                     onChanged:(val){
                       print("Radio $val");
                       setSelectedRadio2(val);
                     },
                   ),
                   Text('No',style:TextStyle(fontSize:13)),
                 ],
               ),
              Container(child: 
              Text("Height :",style:TextStyle(fontWeight: FontWeight.bold,fontSize:17)),
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0), 
                child: TextField( 
                  decoration: InputDecoration( 
                     hintText: "Height(cm)", 
                  ), 
                  keyboardType: TextInputType.numberWithOptions(), 
                  controller: _height, 
                ),
              ),
              Container(child: 
              Text("Weight : ",style:TextStyle(fontWeight: FontWeight.bold,fontSize:17)),
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(50, 10, 50, 0),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 0, 50, 0), 
                child: TextField( 
                  decoration: InputDecoration( 
                     hintText: "Weight(kg)", 
                  ), 
                  keyboardType: TextInputType.numberWithOptions(), 
                  controller: _weight, 
                ),
              ),
              Row(
                mainAxisAlignment:MainAxisAlignment.center,
                children:<Widget>[
                 
                 Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton.icon(  
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),),
                      color: Colors.black,
                    splashColor: Colors.green,
                    label: Text("Calculate",style: TextStyle(color:Colors.white),),
                    onPressed: _onPress,    
                    icon:Icon(Icons.play_arrow,color: Colors.lightBlue),
                  ),  
                 ),
                 Padding(
                  padding: EdgeInsets.all(5),
                  child: RaisedButton(
                     shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),),
                      color: Colors.black,
                    splashColor: Colors.indigo,
                    child: Text("Clear",style: TextStyle(color:Colors.white),),
                    onPressed: _onPress1,
                  ), 
                 ),
                ],
              ),

            Container(child: 
              Text("Results:",
              style:TextStyle(
                fontSize:20,
                fontWeight: FontWeight.bold)),
                alignment: Alignment.centerLeft,
            ),
            Container(child: 
              Text('The lean body meass based on different formulas:',
              style:TextStyle(
                fontSize:16)),
              alignment: Alignment.centerLeft,
            ),
            
             Container( 
              color: Colors.white,
              padding: EdgeInsets.all(20.0),
              child: Table(
                border: TableBorder.all(color: Colors.black),
                children: [
                  TableRow(children: [
                    Text('Formula',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:16)),
                    Text('Lean Body Mass',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:16)
                        ),
                    Text('Body Fat',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:16)),
                  ]),
                  TableRow(children: [
                    Text('Peters(for Children)',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:14)
                        ),
                    Text('$peters',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)), 
                    Text('$petersBF',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)),  
                  ]),
                   TableRow(
                     decoration:BoxDecoration(color: Colors.grey),
                     children: [
                     Text(''),
                     Text(''),
                     Text(''), 
                  ]),
                  TableRow(children: [
                    Text('Boer',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:14)),
                    Text('$boer',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)),  
                     Text('$boerBF',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)),  
                  ]),
                  TableRow(children: [
                    Text('James',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:14)),
                    Text('$james',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)),
                     Text('$jamesBF',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)), 
                  ]), 
                   TableRow(children: [
                    Text('Hume',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize:14)
                        ),
                    Text('$hume',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)),
                     Text('$humeBF',
                        textAlign: TextAlign.center,
                        style:TextStyle(
                        fontSize:14)), 
                  ]), 
                ]),
                  ),
            ],
          ),
        ),
        ),
     );
   }
  void _onPress() {
    setState((){
      height = double.parse(_height.text);
      weight = double.parse(_weight.text);

      if (selectedRadio == 1 && selectedRadio2 == 1) {
        double peter_1 =  3.8 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));
        double boer_1 = (0.407 * weight) + (0.267 * height) - 19.2;
        double james_1 = (1.1 * weight) - (128 * (pow(weight / height, 2)));
        double hume_1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;
        
                double p1Bodyfat = 100 - (peter_1 / weight) * 100;
                double b1Bodyfat = 100 - (boer_1 / weight) * 100;
                double j1Bodyfat = 100 - (james_1 / weight) * 100;
                double h1Bodyfat = 100 - (hume_1 / weight) * 100;

                  peters = peter_1.toStringAsFixed(2)+'kg';        
                  boer = boer_1.toStringAsFixed(2)+'kg';
                  james = james_1.toStringAsFixed(2)+'kg';
                  hume = hume_1.toStringAsFixed(2)+'kg';

                  petersBF = p1Bodyfat.toStringAsFixed(0)+'%';        
                  boerBF = b1Bodyfat.toStringAsFixed(0)+'%';
                  jamesBF = j1Bodyfat.toStringAsFixed(0)+'%';
                  humeBF = h1Bodyfat.toStringAsFixed(0)+'%';
              } 
              else if (selectedRadio == 1 && selectedRadio2 == 2) {
                double boer_1 = (0.407 * weight) + (0.267 * height) - 19.2;
                double james_1 = (1.1 * weight) - (128 * (pow(weight / height, 2)));
                double hume_1 = (0.32810 * weight) + (0.33929 * height) - 29.5336;
        
                double b1Bodyfat = 100 - (boer_1 / weight) * 100;
                double j1Bodyfat = 100 - (james_1 / weight) * 100;
                double h1Bodyfat = 100 - (hume_1 / weight) * 100;

                peters = 'null';
                boer = boer_1.toStringAsFixed(2)+'kg';
                james = james_1.toStringAsFixed(2)+'kg';
                hume = hume_1.toStringAsFixed(2)+'kg';

                petersBF = 'null';
                boerBF = b1Bodyfat.toStringAsFixed(0)+'%';
                jamesBF = j1Bodyfat.toStringAsFixed(0)+'%';
                humeBF = h1Bodyfat.toStringAsFixed(0)+'%';
              } 
              else if (selectedRadio == 2 && selectedRadio2 == 1) {
                double peter_1 = 3.8 * (0.0215 * (pow(weight, 0.6469)) * (pow(height, 0.7236)));
                double boer_1 = (0.252 * weight) + (0.473 * height) - 48.3;
                double james_1 = (1.07 * weight) - (148 * (pow(weight / height, 2)));
                double hume_1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;
                
                double p1Bodyfat = 100 - (peter_1 / weight) * 100;
                double b1Bodyfat = 100 - (boer_1 / weight) * 100;
                double j1Bodyfat = 100 - (james_1 / weight) * 100;
                double h1Bodyfat = 100 - (hume_1 / weight) * 100;

                peters = peter_1.toStringAsFixed(2)+'kg';        
                boer = boer_1.toStringAsFixed(2)+'kg';
                james = james_1.toStringAsFixed(2)+'kg';
                hume = hume_1.toStringAsFixed(2)+'kg';
                
                petersBF = p1Bodyfat.toStringAsFixed(0)+'%';
                boerBF = b1Bodyfat.toStringAsFixed(0)+'%';
                jamesBF = j1Bodyfat.toStringAsFixed(0)+'%';
                humeBF = h1Bodyfat.toStringAsFixed(0)+'%';
                
              } 
              else if (selectedRadio2 == 2 && selectedRadio2 == 2) {
                double boer_1 = (0.252 * weight) + (0.473 * height) - 48.3;
                double james_1 = (1.07 * weight) - (148 * (pow(weight / height, 2)));
                double hume_1 = (0.29569 * weight) + (0.41813 * height) - 43.2933;
        
                double b1Bodyfat = 100 - (boer_1 / weight) * 100;
                double j1Bodyfat = 100 - (james_1 / weight) * 100;
                double h1Bodyfat = 100 - (hume_1 / weight) * 100;
                
                peters='null'; 
                boer = boer_1.toStringAsFixed(2)+'kg';
                james = james_1.toStringAsFixed(2)+'kg';
                hume = hume_1.toStringAsFixed(2)+'kg';
                
                petersBF='null';
                boerBF = b1Bodyfat.toStringAsFixed(0)+'%';
                jamesBF = j1Bodyfat.toStringAsFixed(0)+'%';
                humeBF = h1Bodyfat.toStringAsFixed(0)+'%';
                
              }
            });
          }
          void _onPress1() {
             _weight.clear();
             _height.clear();
             setState((){
               selectedRadio=null;
               selectedRadio2=null;
               peters = '-';
               petersBF = '-';
               boer='-';
               boerBF='-';
               james='-';
               jamesBF='-';
               hume='-';
               humeBF='-';
             } );
          }
          String format(double n){
            return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
          }
      

 
}
        