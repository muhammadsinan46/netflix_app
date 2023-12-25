import 'package:flutter/material.dart';
class CustomButton2 extends StatelessWidget {
  const CustomButton2({required this.name,   required this.icon,   required this.Bcolor, required this.Fcolor, Key? key}):super(key: key);
   final String name;
     final Icon icon;
     final Color Bcolor;
     final Color Fcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, left: 5, right: 5),
    decoration: BoxDecoration( color: Bcolor,borderRadius:BorderRadius.circular(10) ),
      height: 50,
      width: 100,
     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [icon, Text(name, style: TextStyle(color: Fcolor, fontSize: 20, fontWeight: FontWeight.bold),)],),
    );
  }
}
