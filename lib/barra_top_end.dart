import 'package:flutter/material.dart';

import 'const.dart';
class BarraTopEnd extends StatefulWidget {

  @override
  createState() =>  _BarraTopEndState();
}

class _BarraTopEndState extends State<BarraTopEnd>{
  Color color1 = Color(0xff363131);
  Color color2 = Color(0xffffffff);
  Color letra1 = Colors.white;
  Color letra2 = Colors.grey;
  List<String> etiquetas_name = [
    "Menu", "Descuentos", "Populares",
    "Promos para Llevar", "Promos del dia del amor",

  ];

  List<String> etiquetas_descuento_name = [
    "HASTA 50% OFF", "\$100 EN ENVIO MIN. \$1000S",


  ];
  @override
  Widget build(BuildContext context) {
    return
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsDirectional.only(start: 10.0,),
            width: MediaQuery.of(context).size.width*.90,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15.0),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],

            ),
            child:
            Column(
              children: [


                Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children :[

                      Column(
                        children: [
                          Container(
                            height: 10.0,
                          ),
                          Icon(Icons.access_time_outlined, color: Colors.orange,),
                          Image.asset("assets/icons/delivery.png", width: 24,),
                          Icon(Icons.star, color: Colors.orange,),
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
                            height: 10.0,
                          ),
                          Text("Entrega en 35 - 45 min", style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Monse",
                            fontSize: 12,
                          )),
                          Container(
                            height: 10.0,
                          ),
                          Text("Costo de envio 13\$", style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Monse",
                            fontSize: 12,
                          )),
                          Container(
                            height: 10.0,
                          ),
                          Text("Calificacion Promedio 4.1", style: TextStyle(
                            color: Colors.grey,
                            fontFamily: "Monse",
                            fontSize: 12,
                          )),

                        ],
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
                Row(
                  children: [

                    GestureDetector(
                      onTap: () {
                        color2 = Color(0xffffffff);
                        color1 =  Color(0xff363131);
                        letra2 = Colors.grey;
                        letra1 = Colors.white;
                        setState(() {

                        });
                      },
                      child:
                      Container(
                        padding: EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0, start: 10.0, end: 10.0),
                        margin: EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0, start: 5.0, end: 5.0),
                        decoration: BoxDecoration(

                          color: color1,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Text("Entrega a Domicilio", style: TextStyle(
                          color: letra1,
                        ),),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        color2 =  Color(0xff363131);
                        color1 = Color(0xffffffff);
                        letra1 = Colors.grey;
                        letra2 = Colors.white;
                        setState(() {

                        });
                      },
                      child:
                      Container(
                        padding: EdgeInsetsDirectional.only(top: 10.0, bottom: 10.0, start: 10.0, end: 10.0),
                        margin: EdgeInsetsDirectional.only(top: 5.0, bottom: 5.0, start: 5.0, end: 5.0),
                        decoration: BoxDecoration(

                          color: color2,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                          ),
                        ),
                        child: Text("Recoger en Tienda", style: TextStyle(
                          color: letra2,
                        ),),
                      ),),
                  ],
                ),

              ],
            ),
          ),

          Container(
            height: 10,
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Container(
                  height: 10,
                ),
                SizedBox(
                  height: 30.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int index) => etiquetasDescuento(
                      etiqueta: etiquetas_descuento_name[index],
                    ),
                  ),
                ),
                SizedBox(
                  height: 50.0,
                  child: ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) => etiquetas(
                      etiqueta: etiquetas_name[index],
                    ),
                  ),
                ),
              ],
            ),
          ),



        ],
      ),
    )

      ;
  }

  Column etiquetasDescuento({required String etiqueta}){
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(
                left: 5.0, right: 10.0, top: 0.0, bottom: 0.0),

            decoration: BoxDecoration(

              //borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:  Radius.circular(10), bottomLeft:  Radius.circular(10), bottomRight:  Radius.circular(10)),
            ),
            child:
            Row(
              children: [
                Image.asset("assets/icons/ofert.png", width: 20,),
                Text(etiqueta, style: TextStyle(
                  fontSize: 12,
                  color: blueking,
                )
                ),
                Icon(Icons.arrow_circle_up, color: blueking, size: 20,),
              ],
            )

        ),
      ],
    );
  }

  Column etiquetas({required String etiqueta}){
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
          padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey, //                   <--- border color
              width: 1.0,
            ),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight:  Radius.circular(10), bottomLeft:  Radius.circular(10), bottomRight:  Radius.circular(10)),
          ),
          child: Text(etiqueta, style: TextStyle(
            fontSize: 12,
            color: Colors.grey,

          )
          ),
        ),
      ],
    );
  }
}