import 'package:eclothes/src/pages/login.dart';
import 'package:eclothes/src/pages/venderView.dart';
import 'package:eclothes/src/widgets/roupaCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white,Color(0xFFF8F8F8)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Scaffold(
      backgroundColor: Colors.transparent,
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
                  icon: Icon(Icons.menu,size: 28),
                  onPressed: (){
                    _scaffoldKey.currentState.isDrawerOpen ? _scaffoldKey.currentState.openEndDrawer() :  _scaffoldKey.currentState.openDrawer();
                  },
                ),
                Image(
                  image: AssetImage('assets/images/logo-pevermelho.png'),
                  height: 45,
                ),
                IconButton(
                  icon: Icon(Icons.search,size: 28,),
                  onPressed: (){

                  },
                )
              ],
            ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 6),
              child: Text("Inicio", style: TextStyle(fontSize: 45)),
            ),
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 10,top: 5,bottom: 5,right: 10),
                  padding: EdgeInsets.all(5),
                  child: InkWell(
                    child: Text("I ♥ Londrina",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),
                    onTap: (){

                    },
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF3C6997),Colors.blueAccent],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft
                    ),
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              children: <Widget>[
                RoupaCard(image: 'https://myrealdomain.com/images/camisa-em-png-5.png',title: "Camiseta Basica",),
                RoupaCard(image: 'https://myrealdomain.com/images/camisa-em-png-6.png',title: "Camiseta Basica"),
                RoupaCard(image: 'http://www.existacomunicacao.com.br/wp-content/uploads/Caneca-branca-personalizada-em-curitiba-exista-comunicacao-1.png',title: "Caneca"),
                RoupaCard(image: 'https://myrealdomain.com/images/camisa-em-png-5.png',title: "Camiseta Basica"),
                RoupaCard(image: 'https://i1.wp.com/lavanya.com.br/wp-content/uploads/2019/05/Lavanya-enchimento-de-almofada-2.png?fit=1100%2C1100',title: "Almofada"),
                RoupaCard(image: 'https://myrealdomain.com/images/camisa-em-png-6.png',title: "Camiseta Basica"),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2017/02/23/13/05/profile-2092113_960_720.png'),
                    radius: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  Text("Olá, Usuario")
                ],
              )
            ),
            Divider(
              color: Colors.grey,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: Text("Camisetas"),
                  leading: Icon(MaterialCommunityIcons.tshirt_crew_outline),
                ),
                ListTile(
                  title: Text("Canecas"),
                  leading: Icon(MaterialCommunityIcons.cup),
                ),
                ListTile(
                  title: Text("Bebidas"),
                  leading: Icon(Icons.local_drink),
                ),
                ListTile(
                  title: Text("Almofados"),
                  leading: Icon(MaterialCommunityIcons.sofa),
                ),
                ListTile(
                  title: Text("Chaveiros"),
                  leading: Icon(MaterialCommunityIcons.key_plus),
                ),
                ListTile(
                  title: Text("Vender"),
                  leading: Icon(Icons.add),
                  onTap: (){
                    Navigator.push(context, new MaterialPageRoute(
                      builder: (_) => VenderView()
                    ));
                  },
                ),
                ListTile(
                  title: Text("Configuração"),
                  leading: Icon(Feather.settings),
                ),
                ListTile(
                  title: Text("Sair"),
                  leading: Icon(Feather.log_out),
                  onTap: (){
                    Navigator.pushReplacement(context, new MaterialPageRoute(
                      builder: (_) => LoginPage()
                    ));
                  },
                ),
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}