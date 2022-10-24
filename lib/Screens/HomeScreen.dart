
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.grey[900],
    appBar: AppBar(
      title: const Text('My weather API'),
      centerTitle: true,
      backgroundColor: Colors.blueGrey[850],
      elevation: 0.0,
      actions: [
        IconButton(
          onPressed: (){
            Navigator.pushNamed(context, 'main.dart');
          },
         icon: const Icon(Icons.rotate_90_degrees_ccw),
         ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget> [
          Center(
            child: CircleAvatar(
              backgroundImage :AssetImage('Amandla-Copy.jpeg') ,
            ),
          )
        ],
      ),
    ),
  );
}
}