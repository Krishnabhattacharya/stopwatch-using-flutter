import 'package:flutter/material.dart';
import 'package:stopp_watch/screen.dart';

import 'mainpage.dart';

void main()
{
  runApp(myapp());
}


class myapp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    //theme: ThemeData(fontFamily: 'Sc'),
    home: screen(),);
  }
}