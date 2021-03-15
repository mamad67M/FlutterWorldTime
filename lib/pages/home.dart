import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ici definir une variable qui map les variables provenant de l'expéditeur
       Map data = {};
  @override
  Widget build(BuildContext context) {
    // cela permet de recuperer toutes les variables passées en arg et de les affecter à data
    data = data.isNotEmpty ?  data : ModalRoute.of(context).settings.arguments; // ne charge que si  != de numm
    print(data);

    // gestion du backgroundImage
    String bgImg = data['isDaytime'] ? 'day.png' : 'night.png';
    //gestion de la baniere en haut du mobil
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
    body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              FlatButton.icon(
                  onPressed: () async{
                  dynamic result = await  Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location':result['location'],
                      'flag': result['flag'],
                      'isDaytime': result['isDaytime']
                    };
                  });
                  },
                  icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                  ),
                  label: Text(
                      'Exit Location',
                      style: TextStyle(
                        color: Colors.grey[300]
                      ),
                  ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // centrer le contenue de row
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    );
  }
}
