import 'dart:async';

import 'package:flutter/material.dart';

class mainpage extends StatefulWidget {
  const mainpage({Key? key}) : super(key: key);

  @override
  State<mainpage> createState() => _mainpageState();
}

class _mainpageState extends State<mainpage> {
  String hours="00",mins="00",secs="00";
  int hour=0,min=0,sec=0;
  bool isrunning=false,isvisiable=false;
  late Timer t;
  @override
// void initState() {
//     // TODO: implement initState
//     super.initState();
//     starttime();
//   }
  void starttime()
  {
    setState((){
      isrunning=true;
    });
    t=Timer.periodic(Duration(seconds: 1), (timer) {
      _startsec();
    });
  }
  void _startsec()
  {
    setState(() {
      if(sec<59) {
        sec++;
        secs = sec.toString();
        if (secs.length == 1) {
          secs = "0" + secs;
        }
     }
       else
         {
         _startmin();
      }
    });
  }
  void _startmin()
  {
    setState(() {
   if(min<59)
     {
       sec=0;
       secs="00";
       min++;
       mins=min.toString();
       if(mins.length==1) {
         mins = "0" + mins;
       }
       else
         {
           _starthour();
         }
     }
    });
  }
  void _starthour()
  {
    setState(() {
      min=0;
      mins="00";
      hour++;
      hours=hour.toString();
      if(hours.length==1)
        {
          hours="0"+hours;
        }
    });
  }
  void stop()
  {
    setState(() {
      isrunning=false;
    });
    t.cancel();
    isvisiable=check();
  }
void reset()
{
  setState(() {
    t.cancel();
    sec=0;
    min=0;
    hour=0;
    secs="00";
    mins="00";
    hours="00";
    isvisiable=false;
  });
}
bool check()

{
  if(min!=0||sec!=0||hour!=0)
    return true;
  return false;
}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurple[900],
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[800],
          title: Center(child: Text('STOPWATCH',style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),)),),
      body: Stack(
        children: [
             Padding(
               padding: EdgeInsets.only(top: MediaQuery.of(context).size.height/5),
               child: Column(
               children: [
                 Center(
              child:Text('$hours:$mins:$secs',style: TextStyle(fontSize: 82,color: Colors.white,fontWeight: FontWeight.bold),)
                  ),
                 Padding(
                   padding: const EdgeInsets.only(top: 80,left: 45,right: 45),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[

                      SizedBox(
                       height: 60,
                       child:  ElevatedButton(onPressed: (){
                         if((isrunning)){stop();}
                           else {
                           starttime();
                         }}, child: Text(isrunning?'PAUSE':'START',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),))
                     ),

                      Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: SizedBox(
                           height: 60,
                           child: isvisiable? ElevatedButton(onPressed: (){reset();

                           }, child: Text('RESET',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)):
                    SizedBox(
                    ),
                     ),
                      ),

                     ],
                   ),
                 ),

                 ],
               ),
              ),
            ],
          ),
         ),
        );
  }
}
