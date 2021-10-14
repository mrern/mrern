import 'package:flutter/material.dart';

class Finder extends StatefulWidget {

  @override
  createState() =>  _FinderState();
}

class _FinderState extends State<Finder>{


  bool _visibility = true;
  bool _visibility2 = false;



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
        onTap: () {
      print("elemento clicked");
      Navigator.pop(context);;
    },

    child:
        Icon(Icons.arrow_back, color: Colors.white, size: 25,),),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 5,
          ),
          child: Text(
            "De que tienes Ganas hoy?",
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ),
        // Container(
        //   padding: EdgeInsets.only(left: 2),
        // ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: AlignmentDirectional.topEnd,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[




                Visibility(
                  visible: _visibility,
                  child: IconButton(

                    icon: Image.asset(
                      'assets/images/busqueda.png',
                      width: 80,
                    ),
                    onPressed: () {

                      _visibility = false;
                      _visibility2 = true;
                      print(_visibility);
                      print(_visibility2);
                      setState( () {

                      });

                    },
                  ),),
                Visibility(
                  visible: _visibility2,
                  child:
                  Container(
                    height: 60,
                    child:
                    Padding(
                      padding: EdgeInsets.only(
                          top: 5.0,
                          right: 5.0,
                          left: 5.0,
                          bottom: 5.0
                      ),
                      child:
                      TextField( textCapitalization: TextCapitalization.words, textInputAction: TextInputAction.search, obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(8.0)), ),
                          labelText: 'Buscar',
                        ), ),),),),
              ],
            ),
          ),
        ),
      ],

    );
  }
}