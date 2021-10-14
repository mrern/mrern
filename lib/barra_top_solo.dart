import 'package:flutter/material.dart';
class barra_top_solo extends StatelessWidget {
  const barra_top_solo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5.0,

      ),
      width: double.infinity,
      height: 70,
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

            ],
          ),
        ],
      ),

    );
  }
}