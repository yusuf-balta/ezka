import 'package:ezka/constans/app_padding.dart';
import 'package:ezka/constans/app_text_style.dart';
import 'package:ezka/constans/color/app_gradient.dart';
import 'package:ezka/screens/detail_screen/detail_screen.dart';
import 'package:ezka/screens/home_screen/home_controller.dart';
import 'package:ezka/screens/login_screen/login_view.dart';
import 'package:ezka/widgets/app_button.dart';
import 'package:ezka/widgets/app_dialogs.dart';
import 'package:ezka/widgets/app_scaffold.dart';
import 'package:ezka/widgets/app_text_input_second.dart';
import 'package:ezka/widgets/custom_spacer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeView extends StatefulWidget {
  static String routeName = "/home-view";
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  final HomeController homeController = Get.put(HomeController(), tag: HomeController.instanceName);
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradient().backGroundGradient,
        ),
        child: Column(
          children: [
            SizedBox(
              height: context.height * 0.08,
              child: TabBar(
                labelColor: Colors.white,
                labelStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
                controller: tabController,
                indicatorColor: Colors.black,
                tabs: const [
                  Tab(
                    text: 'Map',
                  ),
                  Tab(
                    text: 'Search',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [_mapView(), _searchView()],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _searchView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: context.height * 0.2,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppPadding().horizonPaddingX2),
            padding: EdgeInsets.symmetric(horizontal: AppPadding().verticalPaddingx1, vertical: AppPadding().verticalPaddingx2),
            decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              children: [
                AppTextInputSecond(
                  hintText: "İsim",
                  controller: homeController.nameController,
                  isUnderline: true,
                ),
                const CustomSpacer(isHeight: true),
                AppTextInputSecond(
                  isUnderline: true,
                  hintText: "Soy isim",
                  controller: homeController.surNameController,
                ),
                const CustomSpacer(isHeight: true),
                AppTextInputSecond(
                  isUnderline: true,
                  hintText: "Şehir",
                  controller: homeController.cityNameController,
                ),
                const CustomSpacer(isHeight: true),
                AppButton(
                  radius: 15,
                  width: context.width,
                  onPressed: () async {
                    AppDialogs.loadingDialog(context);
                    await homeController.getDataFromDb(context);

                    if (homeController.getUserModel != null) {
                      Navigator.pop(context);
                      Get.to(DetailScreen(userModel: homeController.getUserModel!));
                      homeController.clearUser();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  text: "ARA",
                  textStyle: AppTextStyle().searchButtonTextStyle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _mapView() {
    return Column(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () {
              homeController.fireBaseService.logOut();
              Get.offAllNamed(LoginView.routeName);
            },
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            homeController.postLocationToFirebase(context);
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
    );
  }
}
