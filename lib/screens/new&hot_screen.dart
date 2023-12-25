import 'package:flutter/material.dart';
import 'package:netflix/news_tabs/app_tabar.dart';
import 'package:netflix/news_tabs/comingsoon_tab.dart';
import 'package:netflix/news_tabs/everyones_tab.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text("New & Hot",style: TextStyle(color: Colors.white),)),
            bottom: const PreferredSize(
                preferredSize: Size.fromHeight(60), child: AppTabBar())),
        body: TabBarView(children: [
          _buildComingSoon(context),
          evryOneswatching(context),
        ]),
      ),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return ListView.builder(
         shrinkWrap: true,
        itemCount: 10, itemBuilder: (context, index) =>  ComingSoonTab(itemIndex: index,));
  }

  Widget evryOneswatching(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
       itemCount: 10,itemBuilder:(context, index) => EveryOnesTab(itemIndex: index,),
   
    );
  }
}

