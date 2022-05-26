import 'dart:async';
import 'package:flutter/material.dart';
import 'introduction_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    IntroductionPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset('windows/assets/images/LaunchImage.jpg',
        fit: BoxFit.cover,
        )//FlutterLogo(size:MediaQuery.of(context).size.height)
    );
  }
}


class SecondScreen extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SecondScreen> {
  final name = TextEditingController();
  final address = TextEditingController();
  final phoneNum = TextEditingController();
  final email = TextEditingController();
  final dob = TextEditingController();
  final ssn = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Job Finder'),
        ),
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                Text('Personal Information',
                    textAlign: TextAlign.left,
                ),
                Divider(
                  color: Colors.grey
                ),
                TextField(
                  controller: name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: address,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Address',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: phoneNum,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: dob,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Date of Birth',
                  ),
                ),
                SizedBox(height: 5),
                TextField(
                  controller: ssn,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'SSN',
                  ),
                ),
                SizedBox(height: 5),
                Text('Job Interests',
                  textAlign: TextAlign.left,
                ),
                Divider(
                    color: Colors.grey
                ),

              ],

            )

        ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(ssn.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: const Icon(Icons.text_fields),
      ),

        //floatingActionButton: FloatingActionButt,

    );
  }
}