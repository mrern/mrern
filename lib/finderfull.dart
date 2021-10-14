import 'package:flutter/material.dart';

class FinderFull extends StatefulWidget {

      @override
      createState() =>  _FinderFullState();
}

class _FinderFullState extends State<FinderFull>{


  bool _visibility = true;
  bool _visibility2 = false;



  @override
  Widget build(BuildContext context) {
    return Row(
        children: [

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5,
            ),
            child: Text(
              "De que tienes Ganas hoy?",
              style: TextStyle(color: Colors.white, fontSize: 10),
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
                    Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: 10.0),
                        child:
                    Container(
                      width: MediaQuery.of(context).size.width*.60,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        // border: Border.all(
                        //   // color: Colors.grey, //                   <--- border color
                        //   width: 1.0,
                        // ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child:
                            TextField(

                              textCapitalization: TextCapitalization.words, textInputAction: TextInputAction.search, obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Busca un Producto',

                                suffixIcon:
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(end: 10.0, start:10.0),
                                  child:
                                  ElevatedButton(

                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.purple,
                                      shape: new RoundedRectangleBorder(
                                        borderRadius: new BorderRadius.circular(15.0),),
                                      padding: EdgeInsets.all(2),
                                      //shadowColor: Colors.purple,
                                      onPrimary: Colors.white,

                                    ),
                                    onPressed: () {},
                                    child: Icon(Icons.search, color: Colors.white, size: 20,),
                                  ),),
                                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)), borderSide: BorderSide(color: Colors.white, width: 2),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                              ), ),
                          ),

                        ],
                      ),
                    ),),),
                ],
              ),
            ),
          ),
        ],

    );
  }
}