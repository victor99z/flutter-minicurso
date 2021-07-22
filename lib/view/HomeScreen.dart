import 'package:flutter/material.dart';
import 'package:tutorial_flutter/view/MenuNav.dart';
import 'package:tutorial_flutter/view/PhotosCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: const Text('Home'), centerTitle: true),
        body: PhotosCard(),
        floatingActionButton: MenuNav(),
      ),
    );
  }
}

/*


FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () => {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => GaleriaScreen()))
        },
        tooltip: 'Menu',
        child: Icon(Icons.menu),
      ),

*/