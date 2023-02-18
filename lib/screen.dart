import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stopp_watch/mainpage.dart';
class screen extends StatefulWidget {
  const screen({Key? key}) : super(key: key);

  @override
  State<screen> createState() => _screenState();
}

class _screenState extends State<screen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>mainpage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
     gradient: LinearGradient(colors: [
       Colors.redAccent,
       Colors.deepPurple,
       //Colors.pink

     ],),

      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
           // Container(height: 40,),
            Padding(
              padding: const EdgeInsets.only(top: 68.0,left: 10),
              child: Lottie.asset('assets/ani/ani.json'),
            ),
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/2,),
              child: Center(
                child: Text('STOPWATCH',style: TextStyle(color: Colors.black,fontSize: 55,fontWeight: FontWeight.bold,),
                ),
              ),
            )
        ],
      ),
      )
    );
  }
}
