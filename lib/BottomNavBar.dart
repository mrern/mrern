import 'package:flutter/material.dart';
// ignore: unused_import

import 'const.dart';

// // ignore: camel_case_types
// class bottomnavbar extends StatefulWidget {
//   final controller = ScrollController();

//   @override
//   _bottomnavbarState createState() => _bottomnavbarState();
// }

// // ignore: camel_case_types
// class _bottomnavbarState extends State<bottomnavbar> {
// int home = 0;

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
// onTap: (index) {
//   setState(() {
//     home = index;
//   });
// },
//       currentIndex: home,
//       backgroundColor: transp,
//       elevation: 0,
//       fixedColor: base,
//       items: [
//         BottomNavigationBarItem(
//             backgroundColor: transp,
//             icon: Image.asset(
//               'assets/icons/direccion.png',
//               width: 50,
//             ),
//             label: 'Empy'),
//         BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/historial.png',
//               width: 50,
//             ),
//             label: 'historial'),
//         BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/asistenciategnica.png',
//               width: 50,
//             ),
//             label: 'direccion'),
//         BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/usuario2.png',
//               width: 50,
//             ),
//             label: 'usuario'),
//       ],
//     );
//   }
// }

class navbar extends StatefulWidget {
  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int home = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      onTap: (index) {
        setState(() {
          home = index;
        });
      },
      currentIndex: home,
      fixedColor: base,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
            backgroundColor: transp,
            icon: Image.asset(
              'assets/icons/direccion.png',
              width: 50,
            ),
            label: 'direccion'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/historial.png',
              width: 50,
            ),
            label: 'historial'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/asistenciategnica.png',
              width: 50,
            ),
            label: 'Chat'),
        BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/usuario2.png',
              width: 50,
            ),
            label: 'User'),
      ],
    );
  }
}
