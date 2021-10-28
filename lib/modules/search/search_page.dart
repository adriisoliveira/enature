import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
    // dataList.length == 0 ? Center(child: Text("Not aval")): ListView.builder(
    //     itemBuilder: (_,index){
    //       return CardUI(dataList[index].imgUrl,dataList[index].name,dataList[index].material,dataList[index].price,);
    //     }
    //      );
    return Scaffold(
      appBar: AppBar(
          title: Text('Ache um ponto próximo:'),
          backgroundColor: AppColors.primary),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                  // controller: editingController,
                  decoration: InputDecoration(
                      labelText: "Procurar locais",
                      // hintTex:"Informe o nome do jogador",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(25.0))))),
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
            // ListView.separated(
            //     itemBuilder: (BuildContext context, int pontos) {
            //       return ListTile(
            //         leading: Image.asset(tabela[pontos].icon),
            //         title: Text(tabela[pontos].nome),
            //         trailing: Text(tabela[pontos].descricao),
            //       );
            //     },
            //     padding: EdgeInsets.all(16),
            //     separatorBuilder: (_, ___) => Divider(),
            //     itemCount: tabela.length),
            // ListView(
            //   children: <Widget>[
            //     ListTile(
            //       leading: Icon(Icons.map),
            //       title: Text('Mapa'),
            //     ),
            //     ListTile(
            //       leading: Icon(Icons.photo_album),
            //       title: Text('Álbum'),
            //     ),
            //     ListTile(
            //       leading: Icon(Icons.phone),
            //       title: Text('Fone'),
            //     ),
            //   ],
            // )
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
        ]),
      ),
    );
  }

  void setState(Null Function() param0) {}
}
