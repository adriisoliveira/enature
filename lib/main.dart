import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:payflow/blocs/application_bloc.dart';
import 'package:payflow/modules/home/home_page.dart';
import 'package:payflow/modules/maps/maps_api.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:provider/provider.dart';
import 'app_widget.dart';

void main() {
  runApp(AppFirebase());
}

class AppFirebase extends StatefulWidget {
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ApplicationBloc(),
      //   children:[
      //   MaterialApp(
      //   title: 'E-Nature',
      //   theme: ThemeData(
      //     primarySwatch: Colors.green,
      //     visualDensity: VisualDensity.adaptivePlatformDensity,
      //   ),
      //   //home: HomePage(user: null),
      // ),
      //   FutureBuilder(
      //         future: _initialization,
      //     builder: (context, snapshot) {
      //       if (snapshot.hasError) {
      //         return Material(
      //           child: Center(
      //             child: Text(
      //               "Não foi possível inicializar o Firebase",
      //               textDirection: TextDirection.ltr,
      //             ),
      //           ),
      //         );
      //       } else if (snapshot.connectionState == ConnectionState.done) {
      //         return AppWidget();
      //       } else {
      //         return Material(
      //           child: Center(
      //             child: CircularProgressIndicator(),
      //           ),
      //         );
      //       }
      //     })
      // ]
    child: FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        }),
    );
    
  }
}
