import 'package:ezka/constans/app_text_style.dart';
import 'package:ezka/constans/color/app_gradient.dart';
import 'package:ezka/screens/home_screen/home_controller.dart';
import 'package:ezka/widgets/app_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatelessWidget {
  static String routeName = "/home-view";
  HomeView({Key? key}) : super(key: key);
  final HomeController homeController = Get.put(HomeController(), tag: HomeController.instanceName);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradient().backGroundGradient,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                homeController.postLocationToFirebase();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "Mevcut Konumu Kullan",
                    style: AppTextStyle().hintTextStyle,
                  )
                ],
              ),
            ),
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: GoogleMap(
                  initialCameraPosition: homeController.initPlex,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    homeController.mapController = controller;
                  },
                  // ignore: prefer_collection_literals
                  gestureRecognizers: Set()
                    ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
                    ..add(Factory<VerticalDragGestureRecognizer>(() => VerticalDragGestureRecognizer())),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
