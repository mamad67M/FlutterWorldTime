import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London',   location: 'London',   flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin',   location: 'Berlin',   flag: 'germany.png'),
    WorldTime(url: 'Europe/Athens',   location: 'Athens',   flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo',    location: 'Cairo',    flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi',  location: 'Nairobi',  flag: 'kenya.png'),
    WorldTime(url: 'Africa/Conakry',  location: 'Conakry',  flag: 'guinee.jpg'),
    WorldTime(url: 'America/Chicago', location: 'Chicago',  flag: 'usa.png'),
    WorldTime(url: 'America/New_York',location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  //defintion de la fonction
  void updateTime(index) async{
    WorldTime instance = locations[index];
    await instance.getTime(); // attendre le chargement du data pour aller à la navigation
    // Gestion de la navigation
    Navigator.pop(context, {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime' : instance.isDaytime
    });
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){ // fonction qui boucle sur la liste (locations)
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              // mettre in padding autour du contenu du Card
              child: Card(
                child: ListTile(
                  onTap: (){
                    //print(locations[index].location);
                    updateTime(index);
                  },
                  title: Text(locations[index].location), // le titre correspondant  à l'index
                  leading: CircleAvatar( // bgIm correspondant à l'index
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  )
                ),
              ),
            );
          }
      ),
    );
  }
}

