import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.fcgp7-1.fna.fbcdn.net/v/t1.0-9/1981741_1917473805170113_6444380151955575651_n.jpg?_nc_cat=102&_nc_sid=19026a&_nc_eui2=AeH-TMz0EBPl2pRHwtpDGrYMcEp9bTyJWKNwSn1tPIlYo9TnSCjFnI5Hot9i-1jdUKl7-ThTHL5AKJbPF_K0HtFW&_nc_oc=AQlHGN1fFVo8XFcx_lA4W6JLRpEuP3ayxPSWVoEsQlVe06PM5MPytEh70Ol85I5rECs&_nc_ht=scontent.fcgp7-1.fna&oh=665eed54f9ab715b6ae844f8f663edcc&oe=5EF8BD86'),
                radius: 50,
              ),
              Text(
                'Misbah Ahmad',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  fontFamily: 'Acme',
                ),
              ),
              Text(
                'Software Engineer',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
                width: 120,
                child: Divider(
                  color: Colors.white,
                  thickness: 2,
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: ListTile(
                  leading: Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '+88 01914 590820',
                    style: TextStyle(color: Colors.teal, fontSize: 20),
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: ListTile(
                  leading: Icon(
                    Icons.email,
                    color: Colors.teal,
                  ),
                  title: Text(
                    'imiiucian@gmail.com',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        backgroundColor: Colors.teal,
//        body: SafeArea(
//          child: Row(
//            mainAxisSize: MainAxisSize.max,
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//              Container(
//                width: 100,
//                color: Colors.red,
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  Container(
//                    width: 100,
//                    height: 100,
//                    color: Colors.yellow,
//                  ),
//                  Container(
//                    width: 100,
//                    height: 100,
//                    color: Colors.green,
//                  ),
//                ],
//              ),
//              Container(
//                width: 100,
//                color: Colors.blue,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
