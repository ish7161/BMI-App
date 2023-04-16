import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'bmi app',
      debugShowCheckedModeBanner: false ,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super (key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController= TextEditingController();
  var inController= TextEditingController();
  var result ="";
  var bgColor= Colors.indigo.shade200;
@override
Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('bmi app'),
      ),
       body: Container(
         color: bgColor,
         child: Center(
           child: Container(

             width: 300,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text('bmi',style: TextStyle(
                   fontSize: 34, fontWeight: FontWeight.w700
                 ),),
                 SizedBox(height: 21,),
                 TextField(
                   controller: wtController ,
                   decoration: InputDecoration(
                     label: Text('Enter the weight in kgs'),
                     prefixIcon: Icon(Icons.line_weight)
                   ),
                   keyboardType: TextInputType.number,
                 ),
                 SizedBox(height: 11,),
                 TextField(
                   controller: ftController ,
                   decoration: InputDecoration(
                       label: Text('Enter the height in ft'),
                       prefixIcon: Icon(Icons.height)
                   ),
                   keyboardType: TextInputType.number,

                 ),
                 SizedBox(height: 11,),
                 TextField(
                   controller: inController ,
                   decoration: InputDecoration(
                       label: Text('Enter the height in inch'),
                       prefixIcon: Icon(Icons.height)
                   ),
                   keyboardType: TextInputType.number,

                 ),
                 SizedBox(height: 16,),
                 ElevatedButton(onPressed: (){
                   var wt = wtController.text.toString();
                   var ft = ftController.text.toString();
                   var inch = inController.text.toString();
                   if(wt!=""&& ft!="" && inch!=""){

                     var iWt = int.parse(wt);
                     var ift = int.parse(ft);
                     int iInch = int.parse(inch);

                     var tInch= (ift*12)+iInch;
                     var tCm = tInch*2.54;
                     var tM = tCm/100;
                     var bmi = iWt/(tM*tM);
                     var msg= "";
                     if (bmi>25){
                       msg = " you are overweight";
                       bgColor= Colors.orange.shade200;
                     } else if(bmi<18){
                       msg = "you are underweight!!";
                       bgColor= Colors.red.shade200;
                     }
                     else{
                       msg = " you are healthy";
                       bgColor= Colors.green;
                     }
                     setState((){
                       result = "$msg \n your bmi is : $bmi";
                     });



                   }else{
                     setState((){
                       result ="please fill all the required lines";
                     });

                   }
                 }, child: Text('calculate')),
                 SizedBox(height: 11,),
                 Text(result,style: TextStyle(
                   fontSize: 19
                 ),)
               ],
             ),
           ),
         ),
       ),

       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
