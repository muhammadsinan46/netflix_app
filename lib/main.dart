import 'package:flutter/material.dart';

import 'package:netflix/screens/home_screen.dart';
import 'package:netflix/screens/new&hot_screen.dart';
import 'package:netflix/screens/profile_screen.dart';
import 'package:netflix/screens/search_screen.dart';
import 'package:netflix/screens/splash_screen.dart';

void main() {
  runApp(const HomePage());
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark()
      ),
      home: const SplashScreen(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _navIndex =0;
  final screens = [
    HomeScreen(),
    SearchScreen(),
    NewScreen(),
    ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
      body: screens[_navIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 45, 45, 45),
        selectedItemColor: Colors.white,
        unselectedItemColor:const Color.fromARGB(255, 146, 145, 145),
        currentIndex: _navIndex,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_max_outlined), label: "Home"),
        BottomNavigationBarItem(icon:  Icon(Icons.search), label: "Search"),
        BottomNavigationBarItem(icon: Icon(Icons.video_library), label: "New & Hot"),
        BottomNavigationBarItem(icon: Icon(Icons.person_3_outlined), label: "My netflix"),
      ],
      onTap: (index){
        setState(() {
          _navIndex =index;
        });
      },
      ),

    );
  }
}
