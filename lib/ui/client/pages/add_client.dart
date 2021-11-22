import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trade_agent/data/model/client.dart';
import 'package:trade_agent/theme/style.dart';

import 'client_page.dart';

class AddCounterAgentPage extends StatefulWidget {
  const AddCounterAgentPage({Key? key}) : super(key: key);

  @override
  _AddCounterAgentPageState createState() => _AddCounterAgentPageState();
}

class _AddCounterAgentPageState extends State<AddCounterAgentPage> {
  final _formKey = GlobalKey<FormState>();

  final Completer<GoogleMapController> _mapController = Completer();

  static const CameraPosition _cameraPosition = CameraPosition(
    target: LatLng(39.6480105, 66.9865369),
    zoom: 13.4746,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    Set<Marker> markers = {
      Marker(
        infoWindow: InfoWindow(
            title: 'xona',
            snippet: 'Pizdes',
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
        markerId: const MarkerId('Karna'),
        position: const LatLng(39.64, 66.98),
        onTap: () {},
      )
    };
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Добавить КонтрАгента',
          style: AppTextStyles.appBarTitleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Ф.И.О.',
                        suffixIcon: Icon(Icons.person),
                        // border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    // const SizedBox(width: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Адрес',
                        suffixIcon: Icon(Icons.add_business),
                      ),
                    ),
                    // const SizedBox(width: 12.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Номер Телефона',
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                child: SizedBox(
                  height: mediaQuery.size.height * 0.4,
                  width: mediaQuery.size.width,
                  child: GoogleMap(
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    onTap: (location) {
                      markers.add(Marker(
                        infoWindow: InfoWindow(
                            title: 'A',
                            snippet: 'Pizdes',
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
                        markerId: const MarkerId('Karna'),
                        position: location,
                        onTap: () {},
                      ));
                    },
                    initialCameraPosition: _cameraPosition,
                    onMapCreated: (controller) {
                      _mapController.complete(controller);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            color: Colors.blueAccent,
            height: mediaQuery.size.height * 0.075,
            minWidth: mediaQuery.size.width,
            child: Text(
              'Добавить Контр Агента',
              style: AppTextStyles.buttonTextStyle.copyWith(color: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
