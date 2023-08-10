import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginDesign extends StatefulWidget{
  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {
  var email = '';

  var emailInputController = TextEditingController();
  var passwordInputController = TextEditingController();
  bool _oberverText = true;

  void _togglePasswordStatus() {
    setState(() {
      _oberverText = !_oberverText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Design')
      ),
      body: Container(
        margin: EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Login',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                SizedBox(height: 8,),
                Text('Continue to login',
                  style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                SizedBox(height: 40),
                Container(
                  height: 60,
                  child: TextField(
                    maxLines: 1,
                      controller: emailInputController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(color: Colors.lightBlue,fontSize: 16,fontStyle: FontStyle.italic),
                      decoration: InputDecoration(
                          hintText: 'abc@email.com',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue,width: 2)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black26)
                          ),
                          label: Text('Email',style: TextStyle(color: Colors.lightBlue),),
                          prefixIcon: Icon(Icons.email),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear
                        ),
                        onPressed: (){
                          emailInputController.clear();
                        },
                      )

                      // )
                  ),
                ),),

                SizedBox(height: 20),
                Container(
                  height: 60,
                  child: TextField(
                    controller: passwordInputController,
                      style: TextStyle(color: Colors.lightBlue,fontSize: 16,fontStyle: FontStyle.italic),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: _oberverText,
                      onChanged: (val){
                        setState(() {

                        });
                      },
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                          hintText: 'Pass@123',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue,width: 2)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black26)
                          ),
                          label: Text('Password',style: TextStyle(color: Colors.lightBlue),),
                          prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _oberverText ? Icons.visibility:Icons.visibility_off,
                            // Icons.remove_red_eye
                          ),
                          onPressed: (){
                            _togglePasswordStatus();
                          },
                        )

                      )
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(onPressed: (){
                        var iEmail = emailInputController.text.toString();
                        print(iEmail);

                        setState(() {
                          email = emailInputController.text;
                          // emailInputController.value = TextEditingValue(text: iEmail);
                          // emailInputController.text = email;
                        });
                      } , child: Text('Login ->',style: TextStyle(fontSize: 18,color: Colors.white))),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Here is : $email',style: TextStyle(fontSize: 18,color: Colors.lightBlue,fontWeight: FontWeight.w700),),
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}