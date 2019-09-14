import 'package:eclothes/src/pages/dashBoard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 130,bottom: 60),
              child: Image(
                  image: AssetImage('assets/images/logo-pevermelho.png'),
                  height: 70,
                ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Color(0xFFf8f8f8),width: 2)
                    ),
                    hintText: "Email@provedor.com",
                    contentPadding: EdgeInsets.all(16)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7),
                      borderSide: BorderSide(color: Color(0xFFf8f8f8),width: 2)
                    ),
                    hintText: "senha12**",
                    contentPadding: EdgeInsets.all(16)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                MaterialButton(
                  
                  minWidth: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Text("ENTRAR",style: TextStyle(color: Colors.white),),
                  color: Colors.blueAccent,
                  onPressed: (){
                    Navigator.pushReplacement(context, new MaterialPageRoute(
                      builder: (_) => Dashboard()
                    ));
                  },
                )
                ],
              ),
            ),
            Divider(
              color: Colors.grey,
            ),
            Text("Ou conecte-se com",style: TextStyle(color: Colors.grey)),
            Container(
              padding: EdgeInsets.only(left: 5, right: 5,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FlatButton.icon(
                    icon: Icon(FontAwesome.facebook_official, color: Colors.white,),
                    label: Text("Facebook", style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    onPressed: (){

                    },
                  ),
                  FlatButton.icon(
                    icon: Icon(FontAwesome.google,color: Colors.white,),
                    label: Text("Google", style: TextStyle(color: Colors.white),),
                    color: Colors.redAccent,
                    onPressed: (){

                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}