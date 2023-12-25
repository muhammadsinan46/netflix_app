import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.name,
      required this.radius,
      required this.icon,
      required this.Bheight,
      required this.Bwidth,
      required this.fontSize,
      Key? key})
      : super(key: key);
  final String name;
  final double radius;
  final Icon icon;
  final double Bheight;
  final double Bwidth;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(radius)),
          height: Bheight,
          width: Bwidth,
          child: Align(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  icon,
                  SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(name, style: TextStyle(fontWeight: FontWeight.bold, fontSize:fontSize ),))
                ],
              )),
        ));
  }
}
