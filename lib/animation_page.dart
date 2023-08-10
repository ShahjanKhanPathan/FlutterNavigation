import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDesign extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => MyDesignState();

}

class MyDesignState extends State<MyDesign>{
  var mainWidth = 200.0;
  var mainHeight = 100.0;
  var countValue = 0;
  bool change = true;
  var myOpacity = 1.0;
  Decoration myDecor = BoxDecoration(
    borderRadius: BorderRadius.circular(10),
        color: Colors.brown
  );
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Login Design'),
       centerTitle: true,
     ),
     body: Container(
       margin: EdgeInsets.only(top: 40),
       child: Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               AnimatedContainer(
                   curve: Curves.easeOutCirc,
                   width: mainWidth,
                   height: mainHeight,
                   decoration: myDecor,
                   duration: Duration(seconds: 1)
               ),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){
                 setState(() {
                   if(change){
                     mainWidth = 100.0;
                     mainHeight = 200.0;
                     myDecor = BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.deepPurple
                     );
                     change = false;
                   } else{
                     mainWidth = 200.0;
                     mainHeight = 100.0;
                     change = true;
                     myDecor = BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: Colors.brown
                     );

                   }

                 });
               }, child: Text('Animate',style: TextStyle(color: Colors.white),)),
               SizedBox(height: 50,),

               AnimatedOpacity(opacity: myOpacity, duration: Duration(
                 seconds: 2
               ),
               curve: Curves.easeOut,
               child: Container(
                 width: 100,
                 height: 100,
                 color: Colors.orange,
               ),),
               SizedBox(height: 10,),
               ElevatedButton(onPressed: (){

                 setState(() {
                   if(change){
                     myOpacity = 0.0;
                     change = false;
                   }else{
                     change = true;
                     myOpacity = 1.0;
                   }
                 });
               }, child: Text('Press',style: TextStyle(color: Colors.white),))
             ],
           ),
         ],
       ),
     )
   );
  }

}