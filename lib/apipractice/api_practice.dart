import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning_new/apipractice/modal/post.dart';
import 'package:flutter_learning_new/apipractice/remote_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiPractice extends StatefulWidget {
  const ApiPractice({Key? key}) : super(key: key);

  @override
  State<ApiPractice> createState() => _ApiPracticeState();
}

class _ApiPracticeState extends State<ApiPractice> {
List<Post>? posts;
var isLoaded = false;
  List users = [];


@override void initState() {
    super.initState();
    getData();
  }

  getData() async{
  posts = (await RemoteService().getPosts())?.cast<Post>();
  if(posts != null){
    setState(() {
      isLoaded = true;
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Call'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.search,color: Colors.white,))
        ],
      ),
      body: Visibility(
        visible: isLoaded,
        replacement: Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context,index){
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: InkWell(
              child: Card(
                elevation: 6,
                margin: EdgeInsets.only(top: 4),
                shadowColor: Colors.deepPurpleAccent,
                child: Container(
                  // color : Colors.green,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(posts![index].title.toString(),style: TextStyle(fontSize: 12),maxLines: 5),

                          Container(
                            child:Text(posts![index].body.toString(),style: TextStyle(fontSize: 10),maxLines: 10),
                          ),


                    ],
                  ),
                ),
              ),
              onTap: (){
                showToast(posts![index].title.toString());
                // Fluttertoast.showToast(msg: posts![index].title.toString(),toastLength: Toast.LENGTH_LONG,
                //     fontSize: 18, gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 2,
                //     textColor: Colors.red);

              },
            ),
          );
        },
        ),
      )
      );
  }

  void checkResponse() async {
    print('Button clicked!!!');
    const  url = 'https://jsonplaceholder.typicode.com/';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    var body = response.body;
    var json = jsonDecode(body);
    if(response.statusCode == 200){
     print('got 200!1');
    }
    setState(() {

    });
    print('Fetch Users');
  }

  void showToast(String title){
    print('Button has been working!1');
    Fluttertoast.showToast(msg: title,toastLength: Toast.LENGTH_LONG,
    fontSize: 18, gravity: ToastGravity.BOTTOM,timeInSecForIosWeb: 2,
    textColor: Colors.red);
  }
}
