import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime{
  String location; // location name for the ui
  String time;     // the time for  that location
  String flag;     // url for assiets flag icon
  String url;      // location url for api endpoint
  bool isDaytime;   // true or false isDaytime

  // le constructeur
  WorldTime({this.location, this.flag, this.url});

  // definition de la requeteapi de la ville
  Future <void> getTime() async {

   try {
     //  on remplace Europe/Paris = $url car seule cette partie qui varie
     Response response = await get('http://worldtimeapi.org/api/timezone/$url');

     // essayons d'acceder à ces informations contenuent dans ce Json en le decodant
     Map data =jsonDecode(response.body);

     print(data); // affichage des informations

     // extraire des proprietés du fichier json(data): temps, ofset,...
     String dateTime = data['datetime'];
     String offset   = data['utc_offset'].substring(1,3);


     // Formatage de la date, pour cela creons un objet dateTim
     DateTime now = DateTime.parse(dateTime);
     now = now.add(Duration(hours: int.parse(offset)));

     //print(now);
     // conversion de now en string et affectation à time
     //time =now.toString();


     // condition sur isDaytime avec terary operators
     isDaytime = now.hour > 6 && now.hour <20 ? true : false;

     // Formatage suite install intl
     time =DateFormat.jm().format(now);

   } catch(e){
     print(' error: $e');
     time = 'can t get time data';
   }

  }
}