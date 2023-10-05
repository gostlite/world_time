import 'package:flutter/material.dart';
import 'dart:convert' as convert;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    // setting the argument passed from the loading route to the home route
      data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>;
      String bgImage = data['isDay'] ? 'day.png' : 'night.png';
    return Scaffold(
      
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: SafeArea(

            child: Column(
              children: <Widget>[
                TextButton.icon(onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, "/country");

                  setState(() {
                    data = result;
                  });
                }, icon: Icon(Icons.edit_location, color: Colors.grey[300],), label: Text("Choose location", style: TextStyle(
                    color: Colors.grey[300]
                ),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(data['location'], style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                    ),),

                    // Text('hello world')
                  ],
                ),
                SizedBox(height: 10,),
                Text(data['time'], style: TextStyle(
                  fontSize: 66,
                  color: Colors.red
                ),)],
            ),
          ),
        ),
      ),
    );
  }
}

