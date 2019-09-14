import 'package:eclothes/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductView extends StatefulWidget {
  String title, image;
  ProductView({Key key, @required this.title, this.image}) : super(key: key);

  _ProductViewState createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool like = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back,size: 28),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                Text(widget.title,style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                like ?  IconButton(
                  icon: Icon(MaterialCommunityIcons.heart,size: 28,color: Colors.redAccent,),
                  onPressed: (){
                    setState(() {
                     like = false; 
                    });
                  },
                ) : IconButton(
                  icon: Icon(MaterialCommunityIcons.heart_outline,size: 28,),
                  onPressed: (){
                    setState(() {
                     like = true; 
                    });
                  },
                )
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 12),
              //child: Text("Inicio", style: TextStyle(fontSize: 45)),
            ),
            Center(
              child: Image(
                height: 250,
                image: NetworkImage(widget.image),
             ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Descrição",style: TextStyle(fontSize: 24),),
                  Text("Mussum Ipsum, cacilds vidis litro abertis. Viva Forevis aptent taciti sociosqu ad litora torquent. Sapien in monti palavris qui num significa nadis i pareci latim. Manduma pindureta quium dia nois paga. Quem num gosta di mé, boa gentis num é."),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Text("Comprar por R\$12,90",style: TextStyle(color: Colors.white,fontSize: 20),),
                    color: Colors.redAccent,
                    onPressed: (){

                    },
                  )
                ]
              ),
            )
          ],
        ),
      ),
    );
  }
}