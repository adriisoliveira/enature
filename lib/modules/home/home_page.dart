import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/maps/maps.dart';
import 'package:payflow/modules/maps/maps_page.dart';
import 'package:payflow/modules/search/Data.dart';
import 'package:payflow/modules/search/search_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//a
List<Data> dataList = [];

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [Container(color: Colors.red), Container(color: Colors.blue)];

  // @override
  // void initState() {
  //   // TODO: implement initState
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "Dri", style: TextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text(
                "Bem vindo (a) ao app",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
            // children: [StreamBuilder(
            //   stream: FirebaseFirestore.instance
            //       .collection('usuariosTest')
            //       .snapshots(),
            //   builder: (BuildContext context, AsyncSnapshot snapshot) {

            //     if (snapshot.hasError) {
            //       return Text('Error: ${snapshot.error}');
            //     }

            //     switch (snapshot.connectionState) {
            //       case ConnectionState.waiting:
            //         return LinearProgressIndicator();
            //         break;
            //       default:
            //         return Center(
            //           child: ListView(
            //             children: snapshot.data.documents.map((DocumentSnapshot doc){
            //               return ListTile(
            //                   leading: Icon(Icons.people, size: 52),
            //                   title: Text(doc.data['nome']),
            //                   subtitle: Text(doc.data['telefone']),
            //               );
            //             }).toList(),
            //           ),
            //         );
            //     }
            //   },
            // ),],
          ),
        ),
      ),
      body: pages[controller.currentPage],
      // dataList.length == 0 ? Center(child: Text("Not aval", style: TextStyles(fontSize: 30),)): ListView.builder(
      //   itemBuilder: itemBuilder(_,index){
      //     return CardUI(dataList[index].imgUrl,dataList[index].name,dataList[index].material,dataList[index].price,);
      //   }
      //    ),
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
                icon: Icon(Icons.home, color: AppColors.primary)),
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
                      MaterialPageRoute(builder: (context) => MapsPage()));
                  // controller.setPage(1);
                  //  setState(() {});
                },
                icon: Icon(Icons.map_sharp, color: AppColors.body))
          ],
        ),
      ),
    );
  }

  // Widget CardUI(String imgUrl, String name, String material, String prince) {
  //   return Card(
  //     margin: EdgeInsets.all(15),
  //     color: Color(0xffff2fc3),
  //     child: Container(
  //       color: Colors.white,
  //       margin: EdgeInsets.all(1.5),
  //       padding: EdgeInsets.all(10),
  //       child: Column(children: <Widget>[
  //         Image.network(
  //           imgUrl,
  //           fit: BoxFit.cover,
  //           height: 100,
  //         ),
  //         SizedBox(
  //           height: 1,
  //         ),
  //         Text(
  //           name,
  //           style: TextStyles(Color: Colors.black, FontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(
  //           height: 1,
  //         ),
  //         Container(
  //           width: double.infinity,
  //           child: Text(
  //             prince,
  //             style: TextStyles(Color: Colors.red),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 1,
  //         ),
  //       ]),
  //     ),
  //   );
  // }
}
