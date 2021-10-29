import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/maps/maps.dart';
import 'package:payflow/modules/maps/maps_api.dart';
import 'package:payflow/modules/maps/maps_place.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/modules/maps/maps_page.dart';
import 'package:payflow/modules/search/Data.dart';
import 'package:payflow/modules/search/search_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user,}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

//a
List<Data> dataList = [];

class _HomePageState extends State<HomePage> {
  final ScrollController _controllerOne = ScrollController();
  final controller = HomeController();
  final pages = [Container(color: Colors.red), Container(color: Colors.blue)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(152),
        child: Container(
          height: 132,
          color: AppColors.primary,
          child: Center(
            child: ListTile(
              title: Text.rich(
                TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "${widget.user.name}",
                          style: TextStyles.titleBoldBackground)
                    ]),
              ),
              subtitle: Text(
                "Bem vindo (a) ao E-Nature",
                style: TextStyles.captionShape,
              ),
              trailing: Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(image: NetworkImage(widget.user.photoURL!))),
              ),
            ),
          ),
        ),),
      body: SingleChildScrollView(
        child:Container(
          child: Card(
                color: AppColors.shape, 
                child: Container(
                  padding: EdgeInsets.all(32.0),
                  child: Column(
                    children: <Widget>[
                      Image.asset(AppImages.natureTitle),
                      Divider(),
                      Text('\nFique à vontade para encontrar o ponto de reciclagem mais próximo da sua localização contribuindo para o tratamento de resíduos de maneira adequada, mitigando impactos ambientais, basta cliclar na lupa e depois procurar seu local no mapa.\n',
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0),
                  ),
                  Divider(),
                  Text('\nVoce sabe o que é lixo eletrônico?\n',
                  textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Image.asset(AppImages.elixoLogo),
                  Text(
                    '\n\nO conceito de lixo eletrônico engloba diversas questões que vão desde o lixo informacional até o descarte de aparelhos eletrônicos.\nPode-se dizer que é todo o resíduo material de otigem inorgânica.Por exemplo: \n\n -Monitores de computador \n -Telefones celulares \n -Geladeiras \n -Carregadores \n -Pilhas \n\nEntre outros, classificados entre os tipos de linha, tal como verde (notebooks e tablets) e azul (batedeiras  e furadeiras).\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0)
                  ),
                  Divider(),
                  Text(
                    '\nProblemas do descarte incorreto!\n',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  Image.asset(AppImages.elixo),
                  Text(
                    '\nDe maneira geral, os principais danos causados pelo lixo eletrônico ao meio ambiente e a população são dividios entre: \n -Redução do tempo de vida últil dos aterros \n -Contaminação por metais pesados \n -Danos a saúde pública\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0)
                  ),
                  Divider(),
                  Text(
                    '\nA E-Nature\n',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0, color: AppColors.primary)
                  ),
                  Image.asset(AppImages.nature, width: 180,height: 180,),
                  Text('\n\nQuem somos',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: AppColors.primary)),
                  Text('\n\nO E-nature é uma cooperação brasileira que facilita o acesso à informação para usuários que desejam contribuir para a construção de uma sociedade sustentável proporcionando a conversão do desperdício de materiais tecnológicos em produtos de potencial utilidade gerando o tratamento adequado dos periféricos.',
                  textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0)
                  ),
                  Text(
                    '\n\nNossa missão',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: AppColors.primary)
                  ),
                  Text(
                    '\n\nGarantir o respeito às pessoas e ao meio ambiente através da gestão ambiental apropriada, entregue-se benefícios ao meio ambiente como a reciclagem visando sempre um amanhã sustentável.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0)
                  ),
                  Text(
                    '\n\nVisão',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20.0, color: AppColors.primary)
                  ),
                  Text(
                    '\n\n Contribuir com credibilidade e transparência para ser referência de software que colabora para que o processo seja fácil para o usuário e como resultado, buscamos oferecer um produto limpo com qualidade e equilíbrio ambiental. Acreditamos que junto podemos reduzir o impacto do desperdício diário.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15.0)
                  ),
                ],
              ),
            ),
          ),
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
                      MaterialPageRoute(builder: (context) => MapsApi()));
                  // controller.setPage(1);
                  //  setState(() {});
                },
                icon: Icon(Icons.map,
                color: controller.currentPage == 1
                ? AppColors.primary
                : AppColors.body))
          ],
        ),
      ),
    );  
  }
}
