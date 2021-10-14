import 'package:flutter/material.dart';
import 'package:nuevo/const.dart';
import 'package:flutter/cupertino.dart';
import "dart:async";
import 'list_shop.dart';
import "main2.dart";
import "barra_top_i.dart";
import 'HolaUser.dart';
import 'finderfull.dart';
import 'negocio_general.dart';

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

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String home = First.routeName;
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
      body: center(),
    );
  }
}

class center extends StatelessWidget {
  const center({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fetchUserOrder(context);
    return Center(
        child: Image(
      image: AssetImage('assets/images/animacion.gif'),
    ));
  }
}

Future<void> fetchUserOrder(context) {
  // Imagine that this function is fetching user info from another service or database.
  return Future.delayed(
      const Duration(milliseconds: 4800),
      () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => SecondRoute())));
}

class SecondRoute extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final double _bottomNavBarHeight = 80;
  late final ScrollListener _model =
      ScrollListener.initialise(_controller, _bottomNavBarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
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
            iconSize: 25,
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
      body: new Column(
        children: [
          HolaUser(),
          FinderFull(),
          Expanded(
            child: Container(
              //child: animacion_top(context),
              decoration: BoxDecoration(
                color: Colors.white,
                // border: Border.all(
                //   // color: Colors.grey, //                   <--- border color
                //   width: 1.0,
                // ),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  // bottomLeft: Radius.circular(25),
                  topRight: Radius.circular(45),
                  // bottomRight: Radius.circular(45),
                ),
              ),
              padding: EdgeInsets.only(
                  top: 25.0, right: 5.0, left: 5.0, bottom: 5.0),

              child: animacion(context),
            ),
          )
        ],
      ),
    );
  }

  AnimatedBuilder animacion(BuildContext context) {
    return AnimatedBuilder(
      animation: _model,
      builder: (context, child) {
        return Stack(
          children: [
            grilla(context),
            Positioned(
              left: 0,
              right: 0,
              bottom: _model.bottom,
              child: _bottomNavBar,
            ),
          ],
        );
      },
    );
  }

  AnimatedBuilder animacion_top(BuildContext context) {
    return AnimatedBuilder(
      animation: _model,
      builder: (context, child) {
        return Stack(
          children: [
            grilla(context),
            Positioned(
              left: 0,
              right: 0,
              top: _model.top,
              child: _bottomNavBar,
            ),
          ],
        );
      },
    );
  }

  CustomScrollView grilla(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.all(5),
          sliver: SliverGrid.count(
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            children: <Widget>[
              Fila(context, "assets/images/cest.jpeg", "Supermercado"),
              Fila(
                context,
                "assets/images/drinks.jpeg",
                "Licores",
              ),
              Fila(
                context,
                "assets/images/electronics.jpeg",
                "Tecnologia",
              ),
              Fila(
                context,
                "assets/images/fastfood.jpeg",
                "Comida Rapida",
              ),
              Fila(
                context,
                "assets/images/fruts.jpeg",
                "Frutas y Verduras",
              ),
              Fila(
                context,
                "assets/images/med.jpeg",
                "Salud",
              ),
              Fila(
                context,
                "assets/images/bebe.png",
                "Ninos",
              ),
              Fila(
                context,
                "assets/images/belleza.png",
                "Belleza",
              ),
              Fila(
                context,
                "assets/images/ferreteria.png",
                "Ferreteria",
              ),
              Fila(
                context,
                "assets/images/flores.png",
                "Flores",
              ),
              Fila(
                context,
                "assets/images/hogar.png",
                "Muebleria",
              ),
              Fila(
                context,
                "assets/images/juguetes.png",
                "Juguetes",
              ),
              Fila(context, "assets/images/mascotas.png", "Mascotas"),
              Fila(context, "assets/images/moda.png", "Moda"),
            ],
          ),
        ),
      ],
    );
  }

  Container Fila(BuildContext context, String path_img, String title) {
    return new Container(
        child: GestureDetector(
      onTap: () {
        print("elemento clicked");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ListaNegocio(category: title)));
      },
      child: Column(
          children: <Widget>[Image(image: AssetImage(path_img)), Text(title)]),
    ));
  }

  Widget get _bottomNavBar {
    return SizedBox(
      height: _bottomNavBarHeight,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Image.asset(
              'assets/images/inicio.png',
              width: 50,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
              activeIcon: Text("Inicio"),
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/historial.png',
                width: 50,
              ),
              label: 'Historial'),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/asistencia.png',
                width: 50,
              ),
              label: 'Asistencia'),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/usuario2.png',
                width: 50,
              ),
              label: 'Perfil'),
        ],
      ),
    );
  }
}

class ListaNegocio extends StatelessWidget {
  final ScrollController _controller = ScrollController();
  final double _bottomNavBarHeight = 80;
  late final ScrollListener _model =
      ScrollListener.initialise(_controller, _bottomNavBarHeight);

  late String category;

  ListaNegocio({String category = "Category"}) {
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: base,
          elevation: 0,
        ),
      ),
      body: new Column(
        children: [
          barraDireccion(),
          barra_topi(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: colorgentle,
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
                top: 18.0,
              ),
              child: animacion(context),
            ),
          )
        ],
      ),
    );
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
          Row(children: [
            IconButton(
              focusColor: Colors.purple,
              hoverColor: Colors.green,
              splashColor: Colors.green,
              highlightColor: Colors.green,
              icon: Icon(
                Icons.place_rounded,
                color: Colors.purple,
              ),
              onPressed: () {},
            ),
            Text(
              "Buenos Aires",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ]),
          IconButton(
            icon: Icon(
              Icons.arrow_drop_down_rounded,
              color: Colors.purple,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.circle_notifications,
              color: Colors.purple,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  GestureDetector buildRow(String negocio, String path_img, String calificacion,
      BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("elemento clicked");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => NegocioGeneral()));
        },
        child: Row(
          children: [
            Padding(
              padding: new EdgeInsets.fromLTRB(10.0, 0.0, 00.0, 0.0),
            ),
            Column(
              children: [
                Image(
                  image: AssetImage(path_img),
                  height: 70,
                )
              ],
            ),
            Padding(
              padding: new EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Align(alignment: Alignment.topLeft, child: Text('Negocio'))
                  ],
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage(calificacion),
                      height: 25,
                    )
                  ],
                ),
                Row(
                  children: [
                    Image(
                      image: AssetImage("assets/images/expres.png"),
                      height: 25,
                    ),
                    Padding(
                      padding: new EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 0.0),
                    ),
                    Text("Direccion")
                  ],
                ),
              ],
            )
          ],
        ));
  }

  AnimatedBuilder animacion(BuildContext context) {
    return AnimatedBuilder(
      animation: _model,
      builder: (context, child) {
        return Stack(
          children: [
            grilla(context),
          ],
        );
      },
    );
  }

  Widget get _bottomNavBar {
    return SizedBox(
      height: _bottomNavBarHeight,
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showUnselectedLabels: true,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Image.asset(
              'assets/images/inicio.png',
              width: 50,
            ),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/historial.png',
                width: 50,
              ),
              label: 'Historial'),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/asistencia.png',
                width: 50,
              ),
              label: 'Asistencia'),
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                'assets/images/usuario2.png',
                width: 50,
              ),
              label: 'Perfil'),
        ],
      ),
    );
  }

  ListView grilla(BuildContext context) {
    return ListView(
        //controller: _controller,
        children: [
          Container(
            height: 15,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                this.category,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colortitle,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("elemento clicked");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ListShop()));
                },
                child: Text(
                  "Ver todos ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: colortitle,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            child: Text(
              "Category Description, Category Description, Category Description, Category Description,Category Description",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "Monse",
                fontSize: 8,
              ),
            ),
            padding: EdgeInsets.only(
                top: 5.0, right: 15.0, left: 15.0, bottom: 35.0),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              negocio(
                  context,
                  "assets/images/tecno.png",
                  "assets/images/samsung.png",
                  "Samsung",
                  "40 minutos o programda"),
              negocio(
                  context,
                  "assets/images/mac0.jpg",
                  "assets/images/mac1.png",
                  "Macdonalds",
                  "30 minutos o programda"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              negocio(
                  context,
                  "assets/images/rest0.jpg",
                  "assets/images/rest1.jpg",
                  "Restaurante",
                  "20 minutos o programda"),
              negocio(
                  context,
                  "assets/images/farma0.jpg",
                  "assets/images/farma1.jpg",
                  "Farmatodo",
                  "50 minutos o programda"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              negocio(
                  context,
                  "assets/images/jugue0.jpg",
                  "assets/images/jugue1.jpg",
                  "Toys Store",
                  "40 minutos o programda"),
              negocio(
                  context,
                  "assets/images/wine0.jpg",
                  "assets/images/wine1.jpg",
                  "Wine's",
                  "30 minutos o programda"),
            ],
          ),
          GestureDetector(
              onTap: () {
                print("Container clicked");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ListShop()));
                //Navigator.pushReplacementNamed(context, path_activity);
              },
              child: new Container(
                height: 60.0,
                padding: new EdgeInsets.fromLTRB(10.0, 10.0, 1.0, 10.0),
                margin: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 20, bottom: 3),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [colortop, colorbotoom],
                      stops: [0.5, 1.0],
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter),
                  color: Colors.white,
                  border: Border.all(
                    color: colorgentle, //                   <--- border color
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Ver mas de +200 Tiendas",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
              )),
          Container(
            height: 10,
          )
        ]);
  }

  Column negocio(BuildContext context, String path_img1, String path_img2,
      String title, String description) {
    return Column(children: [
      //Stack(),
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(
          //   // color: Colors.grey, //                   <--- border color
          //   width: 1.0,
          // ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            // bottomLeft: Radius.circular(25),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            // bottomRight: Radius.circular(45),
          ),
        ),
        padding: EdgeInsets.only(top: 4.0, right: 4.0, left: 4.0, bottom: 4.0),
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Image(
                image: AssetImage(path_img1),
                width: 120,
                height: 100,
                fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 25,
            left: 20,
            child: Container(
              width: 80,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(2.5),
                  shadowColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NegocioGeneral()));
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(path_img2),
                ),
              ),
            ),
          )
        ]),
      ),

      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      Text(
        description,
        style: TextStyle(
          color: Colors.grey,
          fontSize: 8,
        ),
      ),
      Container(
        height: 10,
      )
    ]);
  }
}
