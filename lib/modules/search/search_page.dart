import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/maps/maps_place.dart';
import 'package:payflow/modules/search/Data.dart';
import 'package:payflow/modules/search/pontos_repositories.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SearchPage extends StatelessWidget {
  // List<Data> dataList = [];

  // @override
  // Void initState() {
  //   super.initState();
  //   DatabaseReference referenceData =
  //       FirebaseDatabase.instance.reference().child("Data");
  //   referenceData.once().then((DataSnapshot dataSnapShot) {
  //     dataList.clear();
  //     var keys = dataSnapShot.value.keys;
  //     var values = dataSnapShot.value;

  //     for (var key in keys) {
  //       Data data = new Data(
  //         values[key]["imgUrl"],
  //         values[key]["name"],
  //         values[key]["material"],
  //         values[key]["price"],
  //       );
  //       dataList.add(data);
  //     }
  //     setState(() {
  //       //
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
  final controller = HomeController();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
    
    final tabela = PontosRepositories.tabela;

    final String aba;
    List<Data> dataList = [];
    DatabaseReference referenceData =
        FirebaseDatabase.instance.reference().child("Data");
    referenceData.once().then((DataSnapshot dataSnapShot) {
      dataList.clear();
      var keys = dataSnapShot.value.keys;
      var values = dataSnapShot.value;

      for (var key in keys) {
        Data data = new Data(
          values[key]["imgUrl"],
          values[key]["name"],
          values[key]["material"],
          values[key]["price"],
        );
        dataList.add(data);
      }
      setState(() {
        //
      });
    });

    return Scaffold(
      appBar: AppBar(
          title: Text('Ache um ponto próximo:'),
          backgroundColor: AppColors.primary
        ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  decoration: InputDecoration(
                      labelText: "Procurar locais",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))
                  )
                )
              ),
            ),
            dataList.length == 0
                ? Center(child: Text("Not aval"))
                : ListView.builder(itemBuilder: (context, index) {
                    return CardUI(
                      dataList[index].imgUrl,
                      dataList[index].name,
                      dataList[index].material,
                      dataList[index].price,
                    );
            })
          ],
        ),
        
      ),
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(Icons.home,
                color: controller.currentPage == 0
                ? AppColors.primary: AppColors.body)),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SearchPage()));
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                child: Icon(
                  Icons.search_sharp,
                  color: AppColors.background,
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MapsPlace()));
                  // controller.setPage(1);
                  //  setState(() {});
                },
                icon: Icon(Icons.map_sharp,
                color: controller.currentPage == 1
                ? AppColors.primary
                : AppColors.body))
          ],
        ),
      ),
    );
  }

  Widget CardUI(String imgUrl, String name, String material, String prince) {
    return Card(
      margin: EdgeInsets.all(15),
      color: Color(0xffff2fc3),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(1.5),
        padding: EdgeInsets.all(10),
        child: Column(children: <Widget>[
          // Image.network(
          //   imgUrl,
          //   fit: BoxFit.cover,
          //   height: 100,
          // ),
          // SizedBox(
          //   height: 1,
          // ),
          Text(
            name,
            //style: TextStyles(Color: Colors.black, FontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            width: double.infinity,
            child: Text(
              prince,
              //style: TextStyles(Color: Colors.red),
            ),
          ),
          SizedBox(
            height: 1,
          ),
        ]
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
