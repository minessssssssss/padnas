import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:padna/badd.dart';
import 'package:padna/bhome.dart';
import 'package:padna/firebase_options.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized(); // Ensures Flutter is ready
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  ); 
  runApp(bloodapp());
}

class bloodapp extends StatelessWidget {
  const bloodapp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(routes: {
      '/' :(context) =>  Bhome(),
    '/badd' : (context)  =>  Badd()}) ;
  }
}
