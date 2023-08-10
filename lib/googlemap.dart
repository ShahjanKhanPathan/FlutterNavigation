import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMap extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _GoogleMap();
}

class _GoogleMap extends State<GoogleMap>{
  var _currentIndex = 0;

  void _onItemTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  List<Widget> pagesOption = <Widget>[
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),

  ];
  
  // final Completer<GoogleMapController> _controller = Completer();
  // static const CameraPosition intialPosition = CameraPosition(target: LatLng(23.019968, 72.555771), zoom: 14.0,tilt: 60);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation'),
        centerTitle: true,
      ),
     drawer: MainDrawer(),

     body: pagesOption.elementAt(_currentIndex),
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       selectedItemColor: Colors.teal,
       selectedFontSize: 16,
       selectedIconTheme: IconThemeData(size: 28),
       selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500,fontStyle: FontStyle.italic),
       items: const <BottomNavigationBarItem>[
         BottomNavigationBarItem(
           backgroundColor: Colors.lightBlue,
           icon: Icon(Icons.home),
           label: 'Home',
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.search),
           label: 'Search',
           backgroundColor: Colors.deepPurpleAccent,
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.person),
           label: 'Profile',
           backgroundColor: Colors.redAccent,
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.settings),
           label: 'Setting',
           backgroundColor: Colors.green,
         ),
       ],
       currentIndex: _currentIndex,
       onTap: _onItemTap,

     ),
    );
  }

}

class PageOne extends StatelessWidget {
  // const PageOne({Key? key}) : super(key: key);
  var title = 'Page One';

  // PageOne(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(
        'Page One',style: TextStyle(fontSize: 20,color: Colors.lightBlue,fontWeight: FontWeight.w700),)),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  void showToast() {
    Fluttertoast.showToast(
        msg: 'Search Page is ready to go!!',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.deepPurpleAccent
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Page Two',style: TextStyle(fontSize: 20,color: Colors.deepPurpleAccent,fontWeight: FontWeight.w700),),
          SizedBox(height: 20,),
          OutlinedButton(onPressed: showToast,child: Text(('Show Toast')))
        ],
      )),

    );
  }
}

class PageThree extends StatelessWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Page Three',style: TextStyle(fontSize: 20,color: Colors.redAccent,fontWeight: FontWeight.w700),)),

    );
  }
}

class PageFour extends StatelessWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Text('Page Four',style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.w700),)),
    );
  }
}

/*             Main Drawer      */

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {


  void showToast() {
    Fluttertoast.showToast(
        msg: 'This is toast notification',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.yellow
    );
  }

  final snackBar = SnackBar(
    content: const Text('Yay! A SnackBar!'),
    action: SnackBarAction(
      label: 'Ok',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Drawer(
child: Column(
  
    children: [
  
      Container(
  
        width: double.infinity,
  
        color: Theme.of(context).primaryColor,
  
        child: Center(
  
          child: Column(
  
            children: [
  
              Container(
  
                margin: EdgeInsets.only(top: 30),
  
                width: 100,
  
                height: 100,
  
               decoration: BoxDecoration(
  
                 image: DecorationImage(image: AssetImage('assets/images/logo.png'))
  
               ),
  
              ),
  
              SizedBox(height: 12,),
  
              Text('Anup Singh', style: TextStyle(color:  Colors.white,fontSize: 18,fontStyle: FontStyle.italic,fontWeight: FontWeight.w700),),
  
              SizedBox(height: 6,),
  
              Text('anupsingh@email.com', style: TextStyle(color:  Colors.white,fontSize: 14,fontStyle: FontStyle.italic,fontWeight: FontWeight.w700),),
  
              SizedBox(height: 20,)
  
            ],
  
          ),
  
        ),
  
      ),
  
  
  
      ListTile(
  
        leading: Icon(
  
          Icons.person
  
        ),
  
        title: Text('Profile', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color : Colors.lightBlue),),
  
        onTap: showToast,
          //     (){
          //   showToast;
          //   Navigator.push(context, MaterialPageRoute(builder: (context) => PageThree(),));
          // }
  
      ),
  
  
  
      ListTile(
  
        leading: Icon(
  
          Icons.settings
  
        ),
  
        title: Text('Setting',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color : Colors.lightBlue),),
  
        onTap: (){

          // Navigator.pushReplacement(
          //
          //   context,
          //
          //   MaterialPageRoute(builder: (context) => PageFour()),
          //
          // );
          //
          //
          //
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageFour(),));
          //
          // Navigator.pop(context);
  
          final snackBar = SnackBar(
  
            content: const Text('Clicked!!'),
  
            action: SnackBarAction(
  
              label: 'Undo',
  
              onPressed: () {
  
                // Some code to undo the change.
  
              },
  
            ),
  
          );
  
  
  
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
  
          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PageFour(),));
  
          // Navigator.push(context, MaterialPageRoute(builder: (context){ return PageFour();
  
          // }
  
          // ));
  
        },
        ),
  
  
  
      ListTile(
  
        leading: Icon(
  
          Icons.logout
  
        ),
  
        title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16, color : Colors.lightBlue),),

      )
  
    ],
  

),

      )
    ;
  }
}






