import 'package:flutter/material.dart';
class barra_top extends StatelessWidget {
  const barra_top({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 5.0,

      ),
      width: double.infinity,
      height: 120,
      // ignore: prefer_const_constructors
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/top.png'),
          fit: BoxFit.cover,
        ),
      ),

      child:
          Stack(
            children: [
              Column(

                children: [

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          print("elemento clicked");
                          Navigator.pop(context);;
                        },

                        child:
                        Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 25,),),
                      Container(
                        width: MediaQuery.of(context).size.width*.70,
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
                                      child: Icon(Icons.search, color: Colors.white, size: 40,),
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
                      )
                    ],
                  ),
                  Container(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        height: 50,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.all(2.5),
                            shadowColor: Colors.white,


                          ),
                          onPressed: () {

                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: AssetImage("assets/images/wine1.jpg",),

                          ),


                        ),),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Deltoro Burguer", style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Text("Ver mas Informacion", style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monse",
                                fontSize: 12,
                              )),
                              Icon(Icons.arrow_forward_ios, color: Colors.white,),
                            ],
                          ),


                        ],
                      )
                    ],
                  ),



                ],
              ),

              Positioned(
                  top: 120.0,
                  left: MediaQuery.of(context).size.width*.05,
                  child: Container(

                    width: MediaQuery.of(context).size.width*.90,
                    decoration: BoxDecoration(


                      color: Colors.transparent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0.0),
                        topRight: Radius.circular(15),
                        bottomRight: Radius.circular(0.0),
                      ),

                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children :[
                        Container(
                          width: 10.0,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 10.0,
                            ),
                            Icon(Icons.access_time_outlined, color: Colors.orange,),

                          ],
                        ),
                        Container(
                          width: 10.0,
                        ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 15.0,
                          ),

                          Text("Entrega en 35 - 50 min", style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Monse",
                            fontSize: 12,
                          )),


                        ],
                      ),
                        Container(
                          width: 10.0,
                        ),
                      Column(

                        children: [
                          Container(
                            height: 10.0,
                          ),
                          Icon(Icons.favorite_border_rounded, color: Colors.black,),
                        ],
                      ),
                        Container(
                          width: 10.0,
                        ),
                        Column(

                          children: [
                            Container(
                              height: 10.0,
                            ),
                            Icon(Icons.share_rounded, color: Colors.black,),
                            Container(
                              height: 20,
                            )
                          ],
                        ),
                      ]
                    ),
                  ),)
            ],
          ),

    );
  }
}