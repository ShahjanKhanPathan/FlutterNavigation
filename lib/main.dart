import 'package:flutter/material.dart';
import 'package:flutter_learning_new/widget/rounded_btn.dart';

import 'apipractice/api_practice.dart';
import 'googlemap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch : Colors.cyan,
        appBarTheme: AppBarTheme(
          color: Colors.deepPurple,
          titleTextStyle: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
      ),
      home: GoogleMap(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var emailTextControl = TextEditingController();
  var passwordTextControl = TextEditingController();
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('My Home Page'), //widget.title
        ),
        body: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  // textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailTextControl,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.orange,
                          width: 2)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey,
                            width: 2)
                    ),
                    hintText: 'Enter Email',
                    label: Text('Email',style: TextStyle(color: Colors.orange),),
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: IconButton(onPressed: (){
                      emailTextControl.clear();
                    }, icon: Icon(
                        Icons.clear
                    ),),

           ),
                ),
                Container(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: passwordTextControl,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.orange,
                          width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.grey,
                          width: 2)
                  ),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye
                          ,),
                        onPressed: (){

                        },
                      ),
                    hintText: 'Enter Password',
                    label: Text('Password',style: TextStyle(color: Colors.orange),),

                ),

                ),
                Container(
                  height: 20,
                ),

                ElevatedButton(onPressed:(){
                  var eEmail = emailTextControl.text.toString();
                  var ePassword = passwordTextControl.text;

                  print('Email : $eEmail, Password : $ePassword');

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DashBoard(eEmail,ePassword);
                  },));
                }, child: Text(
                  'Login'
                ))
              ],
            ),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

// ---------------Second Page----------------------------------------------------------------

class SecondPage extends StatelessWidget{
  const SecondPage({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome in Second Page',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              Container(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return MyHomePage(title: title);
                    },));
                  },
                  child: Text('Next',style: TextStyle(fontSize: 18),))
            ],
          ),
      ),

    );
  }


}
/*      DashBoard  Page    */

class DashBoard extends StatelessWidget{
  var myName;
  var pasword;

  DashBoard(this.myName, this.pasword);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DashBoard'),
        centerTitle: true,
        // leading: BackButton(
        //   color: Colors.black,
        // )
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcom Mr. $myName',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic,
                  color: Colors.deepPurple
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Here is your password $pasword',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic,
                    color: Colors.deepPurple
                ),
              ),
              SizedBox(
                height: 50,
              ),

              Text('Select Data',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 17,
                fontWeight:  FontWeight.w600
              ),),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () async {
                DateTime? datePicked = await showDatePicker(context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2025)
                );

                if(datePicked != null){
                  print('Date is ${datePicked.day}/${datePicked.month}/${datePicked.year}');
                }
              }
              , child: Text('Choose Date')),

              SizedBox(
                height: 10,
              ),

              ElevatedButton(onPressed: (){
                var timePicked = showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.input,
                );

                if(timePicked != null){
                  print('Time Selected is $timePicked}');
                }
              }, child: Text('Select Time')),

              SizedBox(
                height: 10,
              ),

              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ForGrid();
                },));
              }, child: Text('Grid Page'))
            ],
          ),
        ),
      ),
    );
  }

}

/*    For Grid Page */
class ForGrid extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('For Grid Page'),
        centerTitle: true,
      ),

      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(

              width: 150,
              child: RoundedButton(
buttonName: 'Play',
                icon: Icon(
                    Icons.play_arrow,
                  color: Colors.white,
                ),
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
                callback:(){
  print('Custom Button has been Clicked....');
                } ,
              ),
            ),


            Container(
              width: 150,
              child: RoundedButton(
                buttonName: 'Pause',
                icon: Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
                colorName: Colors.deepPurpleAccent,
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
                callback:(){
                  print('Second Button has been Clicked....');
                } ,
              ),
            ),
            Container(
              width: 150,
              child: RoundedButton(
                buttonName: 'Play',
                textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16
                ),
                colorName: Colors.orange,
                callback:(){
                  print('Third Button has been Clicked....');
                } ,
              ),
            ),

          ],
        ),
      )

    /*     Expande Example

      Column(
      children: [
      Expanded(
      flex: 2,
      child: Container(
        color: Colors.brown,
      ),
    ),
    Expanded(
    child: Container(
    color: Colors.pink.shade400,
    ),
    ),
    Expanded(
    flex: 3,
    child:  Container(
    color: Colors.red,
    ), ),
    Expanded(
    flex: 2,
    child:Container(
    color: Colors.cyan,
    ), )
    ],
    ) */


      // Container(
          //   color: Colors.deepPurpleAccent,
          //   width: 100,
          //   height: 100,
          // ),
          // Container(
          //   color: Colors.lightGreenAccent,
          //   width: 100,
          //   height: 100,
          // ),
          // Container(
          //   color: Colors.purple,
          //   width: 100,
          //   height: 100,
          // )

    );
  }

}

// GridView.extent(
// padding: EdgeInsets.all(6),
//
// mainAxisSpacing: 10,
// crossAxisSpacing: 10,
// maxCrossAxisExtent: 120,
// children: [
// Container(color: Colors.red),
// Container(color: Colors.orange),
// Container(color: Colors.deepPurple),
// Container(color: Colors.green),
// Container(color: Colors.brown),
// Container(color: Colors.blue),
// Container(color: Colors.cyan),
// Container(color: Colors.pink),
// Container(color: Colors.tealAccent),
// Container(color: Colors.red),
// Container(color: Colors.blue),
// Container(color: Colors.cyan),
// Container(color: Colors.pink),
// Container(color: Colors.tealAccent),
// Container(color: Colors.red),
//
// ],),
