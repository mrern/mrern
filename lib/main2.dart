import 'package:flutter/material.dart';
import 'package:nuevo/const.dart';
import 'package:flutter/cupertino.dart';

import "dart:async";
import 'dart:io';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  static const String routeName = '/main2';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EMPY APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Futura",
        scaffoldBackgroundColor: base,
      ),
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(30),
          //   bottomRight: Radius.circular(30),
          // )),
          backgroundColor: base,
          elevation: 0,
          flexibleSpace: Container(),
          leading: IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
            iconSize: 35,
          ),
          actions: [
            Center(
              child: Text("Paraguay"),
            ),
            IconButton(
              icon: Icon(Icons.place),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            // color: Colors.grey, //                   <--- border color
            width: 1.0,
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(45),
            // bottomLeft: Radius.circular(25),
            topRight: Radius.circular(45),
            // bottomRight: Radius.circular(45),
          ),
        ),
        padding: new EdgeInsets.fromLTRB(10.0, 25.0, 10.0, 0.0),
        child: Gallery(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              backgroundColor: transp,
              icon: Image.asset(
                'assets/icons/busqueda.png',
                width: 50,
              ),
              label: 'busqueda'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/catalogo.png',
                width: 50,
              ),
              label: 'catalogo'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/direccion.png',
                width: 50,
              ),
              label: 'direccion'),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/empy.jpeg',
                width: 50,
              ),
              label: 'empy'),
        ],
      ),
    );
  }
}

class Gallery extends StatefulWidget {

  Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {

  late bool loading;
  int n = -1;
  List<Image> iamgenes = [
    Image.asset('assets/images/cest.jpeg'),
    Image.asset('assets/images/drinks.jpeg'),
    Image.asset('assets/images/electronics.jpeg'),
    Image.asset('assets/images/fastfood.jpeg'),
    Image.asset('assets/images/fruts.jpeg'),
    Image.asset('assets/images/med.jpeg'),
    Image.asset('assets/images/bebe.png'),
    Image.asset('assets/images/belleza.png'),
    Image.asset('assets/images/ferreteria.png'),
    Image.asset('assets/images/flores.png'),
    Image.asset('assets/images/hogar.png'),
    Image.asset('assets/images/juguetes.png'),
    Image.asset('assets/images/mascotas.png'),
    Image.asset('assets/images/moda.png'),

  ];
  Axis scrollDirection = Axis.vertical;

  @override
  Widget build(BuildContext context) {

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20.0,
      ),
      itemCount: 14,
      itemBuilder: (BuildContext context, int index) {
        n = n + 1;

        return iamgenes[n];

      },
    );
  }
}
