import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/theme/color.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/client/pages/client_list.dart';
import 'package:trade_agent/ui/client/pages/client_page.dart';
import 'package:trade_agent/ui/payment/payment.dart';
import 'package:trade_agent/ui/warehouse/warehouse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> _mapController = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(39.6480105, 66.9865369),
    zoom: 13.4746,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Set<Marker> _markers = {
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueMagenta),
        infoWindow: InfoWindow(
            title: 'Kontr Agent0',
            snippet: 'Tochka',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ClientPage(
                    client: Client(
                      id: 0,
                      fullName: "FullName",
                      address: "Address",
                      phoneNumber: "+998906024795",
                      debt: true,
                    ),
                  ),
                ),
              );
            }),
        markerId: const MarkerId('0'),
        position: const LatLng(39.64, 66.98),
        onTap: () {},
      ),
      Marker(
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        infoWindow: InfoWindow(
            title: 'Kontr1',
            snippet: 'Dostavka',
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => Dialog(
                  child: SizedBox(
                    height: mediaQuery.size.height * 0.9,
                    width: 800,
                  ),
                ),
              );
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => ClientPage(
              //       client: Client(
              //         id: 0,
              //         fullName: "FullName",
              //         address: "Address",
              //         phoneNumber: "+998906024795",
              //         debt: true,
              //       ),
              //     ),
              //   ),
              // );
            }),
        markerId: const MarkerId('1'),
        position: const LatLng(39.6423, 66.9821),
        onTap: () {},
      )
    };

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: _buildDrawer(context),
      body: _buildBody(_markers),
    );
  }

  GoogleMap _buildBody(Set<Marker> markers) {
    return GoogleMap(
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      markers: markers,
      mapType: MapType.normal,
      onLongPress: (location) {},
      initialCameraPosition: _cameraPosition,
      onMapCreated: (controller) {
        _mapController.complete(controller);
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text(
        'TRADE AGENT',
        style: AppTextStyles.appBarTitleTextStyle,
      ),
    );
  }

  Drawer _buildDrawer(BuildContext context) => Drawer(
        semanticLabel: 'Drawer',
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TRADE AGENT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Anton',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(36),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text(
                'Расписание',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Контр Агенты',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterAgentListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Склад',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const WarehousePage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Заявки',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterAgentListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Возвраты',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CounterAgentListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Оплаты',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentListPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text(
                'Долги',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const PaymentListPage(),
                  ),
                );
              },
            ),
            const Divider(
              thickness: 1.0,
            ),
            ListTile(
              title: const Text(
                'Выйти',
                style: AppTextStyles.drawerTileTextStyle,
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Выйти из аккаунта'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () async {
                          // var prefs = await SharedPreferences.getInstance();
                          // await saveLogout();
                          // Navigator.of(context).pop();
                          // Navigator.of(context).pushReplacementNamed(LoginScreen.route);
                        },
                        child: const Text('Да'),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Нет'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      );
}
