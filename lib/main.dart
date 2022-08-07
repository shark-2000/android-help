import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testing_concepts/view/Home.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _init = Firebase.initializeApp();
   MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Welcome to software testing help by shark',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:FutureBuilder(future:_init,builder:( context,snapshot){
       if(snapshot.hasError){return Scaffold(body: Center(child: Container(child: Text("Error",style: TextStyle(fontSize: 90),),)));}
       if(snapshot.connectionState==ConnectionState.done){return Home();}
       return Center(child: CircularProgressIndicator(),);

    },
    ));
  }
}



