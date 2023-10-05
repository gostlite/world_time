import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import "dart:convert" as convert;
import 'package:world_time/pages/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
String text = "loading";
void setupDate() async{
  WorldTime instance = WorldTime(flag:'germany.png',location: 'Lagos',url: "Africa/Lagos");
  await instance.getData();
  print(instance.isDay);
  final Map data= {'location':instance.location, 'flag':instance.flag, 'time':instance.time, 'isDay':instance.isDay};

Navigator.pushReplacementNamed(context, '/home', arguments:data);
setState(() {
  text = instance.time.toString();
});
}

  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("inti state ran");

setupDate();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      body:Padding(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child:SpinKitFadingCube(
            color: Colors.white,
            size: 80.0,

          ),

        ),
      ) ,

      );

  }
}
