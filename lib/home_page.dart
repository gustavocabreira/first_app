import 'package:first_app/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const NavigationDrawerWidiget(),
      appBar: AppBar(
        title: const Text('App bar')
      ),
      body: const SizedBox(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}