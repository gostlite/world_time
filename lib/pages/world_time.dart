import 'package:http/http.dart' as http;
import "dart:convert" as convert;
import 'package:intl/intl.dart' as intl;

class WorldTime{
  String? location;
  String? time;
  String? url;
  String? flag;
  bool? isDay;
  WorldTime({this.url,this.flag, this.location });
  Future<void> getData()async{
    try{
      Uri link = Uri.https("worldtimeapi.org",'/api/timezone/$url');
      http.Response response = await http.get(link);
      Map data = convert.jsonDecode(response.body);
      // set properties from the data
      String datetime = data['datetime'].toString();
      String offset = data['utc_offset'].substring(1,3);

      // create time object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));


      // set now to string
      isDay = now.hour > 6 && now.hour <20 ? true :false;
      time = intl.DateFormat.jm().format(now) ;
      print(time);
    }
    catch(e){
      print("an error was caught $e");
      time ="could not get time";
    }



  }
}