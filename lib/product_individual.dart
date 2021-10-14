import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'barra_top_solo.dart';
import 'const.dart';
import 'package:flutter/material.dart';

int cantidad = 0;
double price = 20.00;
double total = 0.0;

class ProductIndividual extends StatefulWidget {

  @override
  createState() =>  _ProductIndividualState();
}

class _ProductIndividualState extends State<ProductIndividual> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            // shape: RoundedRectangleBorder(
            //     borderRadius: BorderRadius.only(
            //   bottomLeft: Radius.circular(30),
            //   bottomRight: Radius.circular(30),
            // )),
            backgroundColor: base,
            elevation: 0,
          ),
        ),
      extendBody: true,
      // extendBodyBehindAppBar: true,

      body: new Column(

          children: [
      barra_top_solo(),
      Expanded(
      child: Container(
      decoration: BoxDecoration(
      color: Colors.white,
      // border: Border.all(
      //   // color: Colors.grey, //                   <--- border color
      //   width: 1.0,
      // ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        // bottomLeft: Radius.circular(25),
        topRight: Radius.circular(0),
        // bottomRight: Radius.circular(45),
      ),
    ),
    padding: EdgeInsets.only(
    top: 0.0,
    right: 5.0,
    left: 5.0,
    bottom: 5.0
    ),

    child:

    ListView(

        children: [
          Image( image: AssetImage("assets/images/burguer.jpg"), width: 75,),
          Container(
            height: 10,
          ),
          Row(
            children: [
              Text("Title Product"),
            ],
          ),
          Container(
            height: 10,
          ),
              Text("Product Description ... Product Description ... Product Description ... Product Description ... Product Description ... Product Description ...",
                style: TextStyle( color: Colors.grey,
                                fontFamily: "Monse"
              ),),
          Container(
            height: 10,
          ),
          Row(
            children: <Widget>[
              Text(("12\$    "), style: TextStyle(fontWeight: FontWeight.bold),),
              Text("15\$", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),),
            ],
          ),
          Container(
            height: 10,
          ),
          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          Container(
            height: 10,
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: <Widget>[
              Text("Seleccione su Bebida"),
              Align(
                  alignment: Alignment.centerRight,
                  child:
                  Container(
                alignment: Alignment.center,
                height: 25.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey, //                   <--- border color
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                ),
                child: Text(" Obligatorio ", style: TextStyle( color: Colors.grey)),
              ), ),

            ]

          ),

          bebidaProduct("Cocacola"),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          bebidaProduct("Cocacola Sin Azucar"),
          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          bebidaProduct("Sprite Sin Azucar"),
          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          bebidaProduct("Fanta Sin Azucar"),
          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          Container(
            height: 20,
          ),

              Text("Personaliza tu Stacker"),
              Text("Seleciona maximo 3 opciones", style: TextStyle( color: Colors.grey),),
          extraProduct("Sin queso"),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),

          extraProduct("Sin panceta"),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),

          extraProduct("Sin salsa stacker"),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),

          extraProduct("Sin cebolla"),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),

          Container(
            height: 20,
          ),

          Text("Elige extra para tu Stacker"),
          Text("Seleciona maximo 4 opciones", style: TextStyle( color: Colors.grey),),
          Container(
            height: 10,
          ),
          extraProduct2("Con Jamon", 3.00),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          extraProduct2("Con Queso", 2.00),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          extraProduct2agotado("Con fritas papas", 2.50),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),
          extraProduct2("Con panceta", 1.50),

          Container(
              height: 1,
              decoration: BoxDecoration(
                color: Colors.grey,)
          ),


        ],
      ),

      ),
      )
          ],
      ),
      bottomNavigationBar: barrainferior()
    );
  }

  Container barrainferior() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          Container(
            height: 40.0,
            width: 150,
            alignment: Alignment.center,

            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.grey, //                   <--- border color
                width: 1.0,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(

                ),
                ElevatedButton(onPressed: () {
                  if(cantidad > 0){
                    cantidad = cantidad - 1;
                    total = price*cantidad;
                    setState( () {

                    });
                  }

                }, child:
                Icon(Icons.remove_circle_outline_outlined, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                    //shadowColor: Colors.purple,
                    onPrimary: Colors.purple,
                  ),
                ),
                Text("$cantidad"),
                ElevatedButton(onPressed: () {
                  cantidad = cantidad + 1;
                  total = price*cantidad;
                  setState( () {

                  });
                }, child:
                Icon(Icons.add_circle_outline_outlined, color: Colors.black),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(2),
                    //shadowColor: Colors.purple,
                    onPrimary: Colors.purple,
                  ),
                ),

                Container(

                ),
              ],
            ),),

         ElevatedButton(

              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),),
                padding: EdgeInsets.all(2),
                //shadowColor: Colors.purple,
                onPrimary: Colors.purple,

              ),
              onPressed: () {},
              child: Text(" Agregar \$$total ", style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold)),
            ),


      ],
      ),);
  }

  Row bebidaProduct(String name) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,

            children: <Widget>[
              Text(name , style: TextStyle( color: Colors.grey)),
              Align(
                alignment: Alignment.centerRight,
                child:
                Container(
                  alignment: Alignment.center,
                  height: 25.0,
                  child: Icon(Icons.circle_outlined, color: Colors.grey,),
                ), ),


            ]

        );
  }

  Row extraProduct(String name) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: <Widget>[
          Text(name , style: TextStyle( color: Colors.grey)),
          Align(
            alignment: Alignment.centerRight,
            child:
            Container(
              alignment: Alignment.center,
              height: 25.0,
              child: Icon(Icons.crop_square_outlined, color: Colors.grey,),
            ), ),


        ]

    );
  }

  Row extraProduct2(String name, double extra_price) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.end,

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(name , style: TextStyle( color: Colors.grey)),
              Text("+ \$$extra_price"),
            ],
          ),

          Align(
            alignment: Alignment.centerRight,
            child:
            Container(
              alignment: Alignment.center,
              height: 25.0,
              child: Icon(Icons.crop_square_outlined, color: Colors.grey,),
            ), ),


        ]

    );
  }

  Row extraProduct2agotado(String name, double extra_price) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(name , style: TextStyle( color: Colors.grey)),
              Text("+ \$$extra_price" , style: TextStyle( color: Colors.grey)),

            ],
          ),

          Align(
            alignment: Alignment.topCenter,
            child:
            Container(
              alignment: Alignment.center,
              height: 25.0,
              decoration: BoxDecoration(
                color: red,
                border: Border.all(
                  color: red, //                   <--- border color
                  width: 1.0,
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(" Agotado ", style: TextStyle( color: reddark, fontWeight: FontWeight.bold)),
            ), ),



        ]

    );
  }
}

