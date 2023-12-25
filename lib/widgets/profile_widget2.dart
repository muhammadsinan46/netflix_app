
import 'package:flutter/material.dart';
class ProfileWidget2 extends StatelessWidget {
  const ProfileWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 50,
           decoration: BoxDecoration(
                       color: const Color.fromARGB(63, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)
                    ),
     
      child: Row(
        children: [
          SizedBox(
              height: 100,
              width: 100,
              child: Image.asset(
                'images/gift.png',
              )),
          SizedBox(
            width: 300,
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                children: [
                  Align(
                     alignment: Alignment.topLeft,
                    child: Text(
                      "Add to MY List",
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Align(
                       alignment: Alignment.topLeft,
                    child: Text(
                        "Keep tarck of the TV  shows and movies you want \n to watch next."),
                  ),
                     Align(
                         alignment: Alignment.topLeft,
                       child: Container(
                        height: 50,
                        width: 200,
                        margin: EdgeInsets.only(top: 15, bottom: 15),
                        decoration: BoxDecoration(
                               color: Color.fromARGB(101, 149, 148, 148),
                          borderRadius: BorderRadius.circular(10)
                          ),
                                              
                        child: Center(child: Text("Browse to Add to My List", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)) ,
                       ),
                     )
                       
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

