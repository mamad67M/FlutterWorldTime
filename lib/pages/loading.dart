import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


 // methode setUp qui utilise la classe worldTime

  void setUpWorldTime() async
  {
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'berlin.png', url: 'Europe/Berlin');
   await instance.getTime();

       // apres le traitement transferer les data vers home
   Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
      'isDaytime' : instance.isDaytime
    }); // permet de naviguer de this.screen vers home avec le variables definies

  }


  @override
  void initState(){
    super.initState();
    setUpWorldTime(); // appel de la fonction
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      // appel de la variable time defini plus haut dans
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
