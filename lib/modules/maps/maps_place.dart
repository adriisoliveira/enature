import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/search/search_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class MapsPlace extends StatefulWidget {
  const MapsPlace({ Key? key }) : super(key: key);

  @override
  State<MapsPlace> createState() => _MapsPlaceState();
}

class _MapsPlaceState extends State<MapsPlace> {
  final ScrollController _controllerOne = ScrollController();
  final controller = HomeController();
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Encontre seu local'),
          backgroundColor: AppColors.primary),
      body: ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: 'Busque o endereço',
            icon: Icon(Icons.search)
          ),
        ),
        Container(
          height: 500.0,
          child:GoogleMap(
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 2.5,
          ),
        ),
        ),
      ],
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
}