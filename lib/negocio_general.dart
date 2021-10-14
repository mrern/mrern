import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:nuevo/product_individual.dart';
import 'barra_top.dart';
import 'barra_top_end.dart';
import 'const.dart';


class ScrollListener extends ChangeNotifier {
  double bottom = 0, top = 0;
  double _last = 0, _first = 0;

  ScrollListener.initialise(ScrollController controller, [double height = 56]) {
    controller.addListener(() {
      final current = controller.offset;


      bottom += _last - current;
      if (bottom <= -height) bottom = -height;
      if (bottom >= 0) bottom = 0;
      _last = current;
      if (bottom <= 0 && bottom >= -height) notifyListeners();

      top += _first - current;
      if (top <= -height) top = -height;
      if (top >= 0) top = 0;
      _first = current;
      if (top <= 0 && top >= -height) notifyListeners();


    });
  }
}

class NegocioGeneral extends StatefulWidget {

  @override
  createState() =>  _NegocioGeneralState();
}

class _NegocioGeneralState extends State<NegocioGeneral>{

  final ScrollController _controller = ScrollController();
  final double _bottomNavBarHeight = 140;
  late final ScrollListener _model = ScrollListener.initialise(_controller, _bottomNavBarHeight);
  List<String> path_food = [
    "assets/images/pizza.png", "assets/images/hambur.png", "assets/images/tacos.png",
    "assets/images/comidajaponesa.png", "assets/images/lasana.png", "assets/images/comidachina.png",
    "assets/images/mascomida.png", "assets/images/otrochaguarma.png",
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

      // ignore: unnecessary_new
      body: new
      Container(
        color: Colors.white,
        child:
      Column(

        children: [
          barra_top(),
          //BarraTopEnd(),


          Expanded(
            child: Container(
              // ignore: prefer_const_constructors
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
                  top: 5.0,
                  right: 5.0,
                  left: 5.0,
                  bottom: 5.0
              ),

              child:
              animacion(context),
            ),
          )
        ],
      ),

      )

    );


  }

  ListView buildListView() {
    return ListView(
      controller: _controller,
      primary: false,
              children: [
                Container(
                  height: 180,
                ),

            buildSingleChildScrollView(),
              ],
            );
  }

  SingleChildScrollView buildSingleChildScrollView() {
    return SingleChildScrollView(

            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[

                  Container(
                    height: 45.0,
                  ),

                  Text(
                    'Descuentos',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 10,),
                  SizedBox(
                    height: 180.0,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) => productoDescuento(porcentaje: "33%",
                          path_img: path_food[index],
                          description: "Descripction...",
                          price_old: "13\$ ",
                          price: "8\$    "),
                    ),
                  ),

                 categoriaFull("Populares", "assets/images/pizza.png", "assets/images/hambur.png", "assets/images/tacos.png"),
                  categoriaFull("Promos para llevar", "assets/images/comidajaponesa.png", "assets/images/lasana.png", "assets/images/comidachina.png"),
                  categoriaFull("Promos del dia del amor", "assets/images/chaguarma.png", "assets/images/perros.png", "assets/images/otronegociochino.png"),
                  categoriaFull("Paga 1 lleva 2", "assets/images/otrochaguarma.png", "assets/images/mascomida.png", "assets/images/pizza.png"),



                ]),

            );
  }

  Column categoriaFull( String categoria, String path_img1, String path_img2, String path_img3, ) {
    return Column(
                   children: <Widget>[


                  Text(
                    categoria,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 20,
                  ),
                  producto_categoria(title: "Pruduct Name Large Large", subtitle: "Product Desciption ...", porcentaje: 33, price: 12, price_old: 15, path_img: path_img1),
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
                  producto_categoria(title: "Pruduct Name Large Large", subtitle: "Product Desciption ...", porcentaje: 33, price: 12, price_old: 15, path_img: path_img2),
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
                  producto_categoria(title: "Pruduct Name Large Large", subtitle: "Product Desciption ...", porcentaje: 33, price: 12, price_old: 15, path_img: path_img3),
                     Container(
                       height: 10,
                     ),
                     Container(
                         height: 1,
                         decoration: BoxDecoration(
                           color: Colors.grey,)
                     ),
                     Container(
                       height: 30,
                     ),
                   ],
                 );
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
                                Text(title),
                              ],
                            ),
                            Row(
                              children: [
                                Text(subtitle, style: TextStyle( color: Colors.grey),),
                              ],
                            ),

                            Row(
                              children: <Widget>[
                                Image.asset("assets/icons/ofert.png", width: 24,),
                                Text("$porcentaje%"),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(("$price\$    "), style: TextStyle(fontWeight: FontWeight.bold),),
                                Text("$price_old\$", style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),),
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





  Row productoDescuento({required String porcentaje, required String path_img, required String description, String, price, required String price_old}) {
    return
      Row(
        children: [
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset("assets/icons/ofert.png", width: 24,),
                  Text(porcentaje)
                ],
              ),
              Stack(
                  children: <Widget>[
                    Image( image: AssetImage(path_img), width: 75,),
                    Positioned(
                      left: 0,
                      bottom: 5 ,
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
              ),
              Text(description, style: TextStyle(fontFamily: "Monse", fontWeight: FontWeight.bold, color: Colors.grey  ) ),
              Row(
                children: <Widget>[
                  Text(price, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(price_old, style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.grey),),
                ],
              ),
              //"   13\$"
            ],
          ),
          Container(
            width: 20,
          )
      ],)
      ;
  }

  AnimatedBuilder animacion(BuildContext context) {
    return AnimatedBuilder(
      animation: _model,
      builder: (context, child) {
        return Stack(
          children: [
            buildListView(),
            Positioned(
              left: 0,
              right: 0,
              top: _model.top,
              child: BarraTopEnd(),
            ),
          ],
        );
      },
    );
  }
}

