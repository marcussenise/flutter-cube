import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Object taxi;
  late Object room;

  @override
  void initState() {
    room = Object(fileName: "assets/bedroom.obj");
    taxi = Object(fileName: "assets/ford/Mondeo_Taxi.obj");
    taxi.position.setValues(0, 0, 3);
    taxi.updateTransform();
    super.initState();    
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Cube(
          onSceneCreated: (Scene scene){
            scene.world.add(room);
            scene.world.add(taxi);
            scene.camera.zoom = 10;
          },
        ),
      )
    );
  }
}
