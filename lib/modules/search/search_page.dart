import 'package:flutter/material.dart';
import 'package:payflow/modules/search/pontos_repositories.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final tabela = PontosRepositories.tabela;

    return Scaffold( 
        appBar: AppBar(
          title: Text('Ache um ponto próximo:'),
          backgroundColor: AppColors.primary
        ),
        body: 
        // Container(
        //   child: Column(
        //     children: <Widget>[
        //       Padding(
        //       padding: const EdgeInsets.all(16),
        //       child:TextField(
        //         // controller: editingController,
        //         decoration: InputDecoration(
        //           labelText:"Procurar locais",
        //           // hintTex:"Informe o nome do jogador",
        //           prefixIcon: Icon(Icons.search),
        //           border: OutlineInputBorder(
        //             borderRadius:
        //               BorderRadius.all(Radius.circular(25.0))
        //           )
        //         )
        //       ),
        //       ),
              ListView.separated(
              itemBuilder: (BuildContext context, int pontos) {
              return ListTile(
                leading: Image.asset(tabela[pontos].icon),
                title: Text(tabela[pontos].nome),
                trailing: Text(tabela[pontos].descricao),
              );
            },
            padding: EdgeInsets.all(16),
            separatorBuilder: (_, ___) => Divider(),
            itemCount: tabela.length),
        //     ListView(
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
        //     ],
        //     )],
        //   ),
        // ),
    );
  }
}
