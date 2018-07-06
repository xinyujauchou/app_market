import 'package:flutter/material.dart';
import 'dart:async';
import 'mainPage.dart';

class Splash extends StatefulWidget {
  @override
  SplashState createState() {
      return SplashState();
    }
}

class SplashState extends State<Splash> {
  //BuildContext buildContext;

  @override
    void initState() {
      super.initState();
      new Timer(Duration(seconds: 3), (){
        Navigator.pushAndRemoveUntil(context, new MaterialPageRoute<void>(
          builder: (BuildContext context) {
              return MainPage();
          }
        ), (route) => false);
      });
    }

  @override
    Widget build(BuildContext context) {
     // buildContext = context;
      return Scaffold(
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(decoration: BoxDecoration(color: Colors.redAccent),) ,
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 50.0,
                          child: Icon(Icons.apps, color: Colors.redAccent, size: 80.0,),
                          backgroundColor: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('App Market', style: TextStyle(color: Colors.white, fontSize: 17.0, fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(
                          backgroundColor: Colors.brown,
                          strokeWidth: 2.0,
                        ),
                        Padding(padding: const EdgeInsets.only(top: 8.0),),
                        Text('loadind...', style: TextStyle(color: Colors.white, fontSize: 17.0),),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
      );
    }
}