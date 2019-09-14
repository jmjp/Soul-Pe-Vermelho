import 'package:eclothes/src/pages/productView.dart';
import 'package:flutter/material.dart';

class RoupaCard extends StatefulWidget {
  String image;
  String title;
  RoupaCard({Key key, @required this.image, @required this.title}) : super(key: key);

  _RoupaCardState createState() => _RoupaCardState();
}

class _RoupaCardState extends State<RoupaCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.only(top: 5,left: 5,right: 5,bottom: 2),
       width: 100,
       child: Stack(
         children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(10),
               gradient: LinearGradient(
                 colors: [Colors.white,Color(0xFFf8f8f8)],//[Color(0xFF5B1519),Color(0xFFBC1834)],
                 begin: Alignment.bottomCenter,
                 end: Alignment.topCenter
               ),
               border: Border.all(color: Colors.grey.withOpacity(0.3),width: 1)
             ),
             margin: EdgeInsets.only(top: 25,bottom: 5),
             padding: EdgeInsets.only(top: 75),
             child: Column(
               children: <Widget>[
                 Text(widget.title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),),
                 Text("Souvenir Londrina"),

               ],
             ),
             
           ),
           Positioned(
             top: 0,
             left: 36,
             child: InkWell(
               child: Image(
                height: 100,
                image: NetworkImage(widget.image)
              ),
              onTap: (){
                Navigator.push(context, new MaterialPageRoute(
                  builder: (_) => ProductView(title: widget.title,image: widget.image,)
                ));
              },
             )
           ),
           Positioned(
             bottom: -7,
             left: 29,
             child: FlatButton.icon(
               icon: Icon(Icons.shopping_basket,color: Colors.white,),
               label: Text("Comprar",style: TextStyle(color: Colors.white),),
               color: Colors.redAccent,
               onPressed: (){
                 Navigator.push(context, new MaterialPageRoute(
                  builder: (_) => ProductView(title: widget.title,image: widget.image,)
                ));
               },
             ),
           )
         ],
       ),
    );
  }
}