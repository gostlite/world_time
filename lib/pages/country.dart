import 'package:flutter/material.dart';
import 'package:world_time/pages/world_time.dart';
class Country extends StatefulWidget {
  const Country({super.key});

  @override
  State<Country> createState() => _CountryState();
}

class _CountryState extends State<Country> {
int count = 0;

List<WorldTime> locations = [
  WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
  WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
  WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
  WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
  WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
  WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
  WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
  WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
];

void updateTime(index)async{
  WorldTime instance = locations[index];
  await instance.getData();
  // navigate to the home route
  final Map data= {'location':instance.location, 'flag':instance.flag, 'time':instance.time, 'isDay':instance.isDay};

  Navigator.pop(context,data);
}

  @override
  Widget build(BuildContext context) {
    print("Build function ran");
    return  Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Choose location"),
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: locations.length,itemBuilder: (context, index){
        return Card(
          child: ListTile(// to be studied
            onTap: (){
              updateTime(index);
            },
            title:Text(locations[index].location.toString()),
            leading: CircleAvatar(
              backgroundImage: AssetImage('assets/${locations[index].flag}'),
            ),
          ),
        );
      })
    );
  }
}
