import 'package:flutter/material.dart';


/* Making Custom Button*/

class RoundedButton extends StatelessWidget{

  final String buttonName;
  final Icon? icon;
  final Color? colorName;
  final TextStyle? textStyle;
  final VoidCallback? callback;


  RoundedButton
  ({
   required this.buttonName,
     this.icon,
    this.colorName,
    this.textStyle,
    this.callback
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: ()
    {
      callback!();
    },
        child: icon != null ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
          SizedBox(
            width: 6,
          ),
          Text(buttonName, style: textStyle)
          ],

        ) :
        Text(buttonName, style: textStyle,
        ),
        
        style: ElevatedButton.styleFrom(
        primary: colorName,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.
            all(Radius.circular(10)
            )
          ),

    
    )
        
        
    );
  }

}