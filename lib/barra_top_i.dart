import 'package:flutter/material.dart';
import 'const.dart';
class barra_topi extends StatelessWidget {
  const barra_topi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              print("elemento clicked");
              Navigator.pop(context);;
            },

            child:
            Icon(Icons.arrow_back_ios_new_rounded, color: colorarrow, size: 35,),),
          Container(
            width: MediaQuery.of(context).size.width*.85,
            height: 50,
            decoration: BoxDecoration(
              color: colorfondosearch,
               border: Border.all(
               color: Colors.white, //                   <--- border color
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
                        borderSide: BorderSide(color: colorfondosearch, width: 2),
                      ),
                    ), ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}