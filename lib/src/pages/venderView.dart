import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:image_picker/image_picker.dart';

class VenderView extends StatefulWidget {
  VenderView({Key key}) : super(key: key);

  _VenderViewState createState() => _VenderViewState();
}

class _VenderViewState extends State<VenderView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool like = true;
  File _image;
  double valor;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
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
                Text("Adicionar novo item",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                _image != null ?  IconButton(
                  icon: Icon(MaterialCommunityIcons.close,size: 28),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ) : IconButton(
                  icon: Icon(MaterialCommunityIcons.camera,size: 28,),
                  onPressed: (){
                    getImage();
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
              child: Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFf8f8f8),Colors.white],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border.all(color: Colors.grey,width: 2)
                ),
                child: _image == null ? IconButton(
                  icon: Icon(Icons.camera),
                  onPressed: (){
                    getImage();
                  },
                ) : Image(image: FileImage(_image),fit: BoxFit.cover,),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Descrição",style: TextStyle(fontSize: 24),),
                  TextField(
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintMaxLines: 10,
                      
                      hintText: "Escreva uma breve descrição do item que deseja vender",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1)
                        
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Valor",style: TextStyle(fontSize: 24),),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintMaxLines: 1,
                      
                      hintText: "Escreva uma breve descrição do item que deseja vender",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1)
                        
                      ),
                      
                    ),
                    onChanged: (value){
                      setState(() {
                       valor = double.parse(value); 
                      });
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    height: 50,
                    child: valor != null ? Text("Vender por R\$ ${valor.toString()}",style: TextStyle(color: Colors.white,fontSize: 20),) : Text("Adicione um valor",style: TextStyle(color: Colors.white,fontSize: 20),),
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