import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:payflow/blocs/application_bloc.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/search/search_page.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:provider/provider.dart';

class MapsApi extends StatefulWidget {
  const MapsApi({Key? key}) : super(key: key);

  @override
  _MapsApiState createState() => _MapsApiState();
}

class _MapsApiState extends State<MapsApi> {
  var a = 3;
  final controller = HomeController();
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);

    return Scaffold(
      appBar: AppBar(
          title: Text('Encontre seu local'),
          backgroundColor: AppColors.primary),
      body: (applicationBloc.currentLocation == null)
      ? Center(child: CircularProgressIndicator(),)
      : ListView(
        children: [
          TextField(
            decoration: InputDecoration(
            hintText: 'Busque o endereço',
            icon: Icon(Icons.search)
            ),
          ),
          Container(
            height: 500.0,
            child: GoogleMap(
              mapType: MapType.normal,
              myLocationEnabled: true,
              initialCameraPosition: CameraPosition(
                target: 
                //LatLng(-12.9372120717467, -38.40660717386153),
                LatLng(applicationBloc.currentLocation.latitude,applicationBloc.currentLocation.longitude),
                zoom: 14,
              ),
              // markers: (a == 0)
              // ? <Marker>[].toSet()
              // : [
              //     Marker(
              //     markerId: MarkerId('m1'),
              //     position:
              //         LatLng(
              //           -12.9372120717467, -38.40660717386153
              //         ),
              //   ),
              // ].toSet(),
            ),
          )
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
                      MaterialPageRoute(builder: (context) => MapsApi()));
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
