import 'package:first_app/widget/navigation_drawer_widget.dart';
import 'package:flutter/material.dart';

class EntidadesPage extends StatefulWidget {
  const EntidadesPage({ Key? key }) : super(key: key);

  @override
  State<EntidadesPage> createState() => _EntidadesPageState();
}

class _EntidadesPageState extends State<EntidadesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidiget(),
      appBar: AppBar(
        title: const Text('Entidades'),
        backgroundColor: const Color.fromRGBO(192, 13, 75, 1),
      )
    );
  }
}