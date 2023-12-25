import 'package:flutter/material.dart';
import 'package:netflix/screens/home_screen.dart';

class EveryOnesTab extends StatelessWidget {
  const EveryOnesTab({ required this.itemIndex, Key?key }):super(key: key);
 final int itemIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //margin: EdgeInsets.only(left: 1, right: 10),
      height: 400,
      //color: Colors.white,
      child: Column(
     //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     mainAxisSize: MainAxisSize.min,
        children: [
           const SizedBox(height: 10,),
          Container(
            height: 200,
          child:  Image.network(
                                  'http://image.tmdb.org/t/p/w500' +
                                      trendingMovies[itemIndex]['backdrop_path'],
                                  fit: BoxFit.cover,
                                  width:double.infinity,
                                   height: 100,
                                ),
          ),
          SizedBox(
            
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
         mainAxisSize: MainAxisSize.min,
              children: [
                Image.network(
                  "https://occ-0-3709-3662.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABanvhKgwgugxee29kbwM4Ng8FUhZ5qXV4mAwoGHNCJQsVXeymrqPNbFOlSVbFzvtwttoFCC7HCcG5jprGIGFjwXI7gqbEeJII6GDZjWcl-N5bXH0HRb3dFFmG_nHQCO3R95rp87XV2E0xqUDUkqXzgmcSCsJq76tGSlbicFJllaS33G2nQyUsQ.png?r=ec9",
                  width: 150,
                  
                ),
                Row(
                  children: [
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,), label: Text("Share", style: TextStyle(color: Colors.white),),),
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,), label: Text("My List", style: TextStyle(color: Colors.white),),),
                    TextButton.icon(onPressed: (){}, icon: Icon(Icons.play_arrow,color: Colors.white,), label: Text("Play", style: TextStyle(color: Colors.white),),),
          
                  ],
                )
                
              ],
            ),
          ),
       Padding(
        
         padding: const EdgeInsets.only(bottom:8.0),
         child: Text("An intelligence operative for a shadowy global peacekeeping agency races to stop a hacker from stealing its most valuable — and dangerous — weapon."),
       ),
              Align(
               
               alignment: Alignment.topLeft,
               child: Text(" Starring: Gal Gadot ,Jamie Dornan ,Alia Bhatt", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),))
        ],
      ),
    );
  }
}
