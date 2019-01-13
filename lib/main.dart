import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //menghilangkan mode debug
      title: 'Mozilla Flutter', //title di navbar
      home: HomeScreen(), //class homescreen
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() {
    return new HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  final myController = TextEditingController(); //controller untuk textfield
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mozilla Flutter'),
        backgroundColor: Colors.greenAccent,

        //menambahkan action button
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_to_queue, color: Colors.white),
            onPressed: () {
              //navigate ke second screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ); //kita akan buat class secondscreen
            },
          )
        ],
      ),

      //menampilkan teksfield
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: TextField(
          controller: myController,
        ),
      ),

      //menambahkan floating action button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(myController.text),
                );
              });
        },
        tooltip: 'Menampilkan value text',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Second Screen'),
        backgroundColor: Colors.red,
      ),

      body: //Image.asset('assets/upin.png'),
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.apps,
                color: Colors.green,
                size: 40,
              ),
              Text('Apps')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.add_a_photo,
                color: Colors.green,
                size: 40,
              ),
              Text('Galeri')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.alarm),
                color: Colors.green,
                onPressed: () {
                  //untuk toast
                  Fluttertoast.showToast(
                      msg: 'Ini Alarm',
                      toastLength: Toast.LENGTH_LONG,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      timeInSecForIos: 1,
                      gravity: ToastGravity.CENTER);
                },
              ),
              Text('Alarm')
            ],
          ),
        ],
      ),

      //bottom menu
      bottomNavigationBar: BottomNavigationBar(currentIndex: 0, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text('Home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail),
          title: Text('Message'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('Profile'),
        ),
      ]),
    );
  }
}
