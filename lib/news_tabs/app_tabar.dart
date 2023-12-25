import 'package:flutter/material.dart';

class AppTabBar extends StatefulWidget {
  // final TabController? tabController;
  const AppTabBar({Key? key,}) : super(key: key);

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  var radius = const Radius.circular(30);

  @override 
  Widget build(BuildContext context) {
    
    return Container(
      height: 40,

      
  padding:const  EdgeInsets.only(left: 10,  right: 10),
        child: TabBar(
            labelStyle: const TextStyle(color: Colors.black),

          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
            

            ) ,
          tabs: [
            Tab(child: Container(
              height: 40,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
              
              border: Border.all(color: Colors.white, width: 1),
              
              ),
              child: const Align(
                   alignment: Alignment.center,
                child: Text("🍿 Coming Soon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            )
            ,),
                    Tab(child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              
              border: Border.all(color: Colors.white, width: 1),
              
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text("👀 Everyone's Watching", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            )
            ,),
            
       
          
         
        ]),
    );  
  }
}