import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:nuevo/product_individual.dart';
import 'barra_top_i.dart';
import 'const.dart';

class ListShop extends StatefulWidget {

  @override
  createState() =>  _ListShopState();
}

class _ListShopState extends State<ListShop>{
  List<String> path_food = [
    "assets/images/supermercado.png", "assets/images/licores.png", "assets/images/tecnologia.png",
    "assets/images/comidarapida.png", "assets/images/frutasyverduras.png", "assets/images/salud.png",
    "assets/images/ninos.png", "assets/images/belleza2.png",  "assets/images/ferreteria2.png",
    "assets/images/flores2.png", "assets/images/muebleria.png",  "assets/images/jugueteria.png",
    "assets/images/mascotas2.png", "assets/images/moda2.png",
  ];

  List<String> category_food = [
    "Supermercado", "Licores", "Tecnologia",
    "Comidarapida", "Frutas y Verduras", "Salud",
    "Ninos", "Belleza",  "Ferreteria",
    "Flores", "Muebleria",  "Jugueteria",
    "Mascotas", "Moda",
  ];


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
          barraDireccion(),
          barra_topi(),
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
                  top: 25.0,
                  right: 5.0,
                  left: 5.0,
                  bottom: 5.0
              ),

              child: SingleChildScrollView(
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      SizedBox(
                        height: 160.0,
                        child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: 14,
                          itemBuilder: (BuildContext context, int index) => categorySection(
                              path_img: path_food[index],
                              description: category_food[index], ),
                        ),
                      ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Categoria", style: TextStyle( fontWeight: FontWeight.bold, fontSize: 25, ) , textAlign: TextAlign.left,),]
                ),
                     Container(
                       height: 10,
                     ),
                      categoriaFull("Wine's", "assets/images/wine1.jpg", "30 Minutos o Programada",),
                      categoriaFull("Toys Sotre", "assets/images/jugue1.jpg", "20 Minutos o Programada", ),
                      categoriaFull("Famrmatodo", "assets/images/farma1.jpg", "40 Minutos o Programada", ),
                      categoriaFull("Retorante", "assets/images/rest1.jpg", "15 Minutos o Programada", ),



                    ]),

              ),

            ),
          )
        ],
      ),

    );


  }

  Padding categoriaFull( String name, String path_img1, String duration, ) {
    return
      Padding(
        padding: EdgeInsets.only(
        top: 15.0,
        right: 10.0,
        left: 5.0,
        bottom: 5.0,
    ),
    child:
      Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(

            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image( image: AssetImage(path_img1), width: 80, height: 80, fit: BoxFit.cover ),

          ),
        ),

        Container(
          width: 15,
        ),

        Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 20,)),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(duration, style: TextStyle( fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey))
              ],
            ),

          ]
        ),
      ],
    ),);
  }

  GestureDetector producto_categoria({required String title, required String subtitle, required double porcentaje, required double price, required double price_old, required String path_img }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProductIndividual()));
      },
      child:

      Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*.69,
            child:

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                    Text(subtitle, style: TextStyle( color: Colors.grey),),
                  ],
                ),
              ],
            ),),
          Container(
            width: MediaQuery.of(context).size.width*.28,
            child:
            Stack(
                children: <Widget>[
                  Image( image: AssetImage(path_img), width: 75,),
                  Positioned(
                    right: 5,
                    top: -5 ,
                    child:
                    Container(
                      width: 24,
                      child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(2),
                          shadowColor: Colors.white,


                        ),
                        onPressed: () {},
                        child:

                        Icon(Icons.favorite_border_outlined, color: Colors.black,  size: 16,),
                      ),),
                  )
                ]
            ),),
        ],
      ),);

  }

  Padding categorySection({ required String path_img, required String description,}) {
    return Padding(
        padding: EdgeInsets.only(
            top: 5.0,
            right: 10.0,
            left: 5.0,
            bottom: 5.0,
        ),
        child: Column(
          children: <Widget>[
            Image( image: AssetImage(path_img), height: 75,),
            Text(description, style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),

            //"   13\$"
          ],
        ),
      )
      ;
  }

  Container barraDireccion() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
              children:[
                IconButton(
                  focusColor: Colors.purple,
                  hoverColor: Colors.green,
                  splashColor: Colors.green,
                  highlightColor: Colors.green,
                  icon: Icon(Icons.place_rounded, color: Colors.purple,),
                  onPressed: () {},
                ),
                Text("Buenos Aires", style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,

                ),),]),
          IconButton(

            icon: Icon(Icons.arrow_drop_down_rounded, color: Colors.purple,),
            onPressed: () {},
          ),
          IconButton(

            icon: Icon(Icons.circle_notifications, color: Colors.purple,),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

