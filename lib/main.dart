// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:maps/APIS/API2/show_user_data.dart';
import 'package:maps/APIS/API3/show_single_user_data.dart';
import 'package:maps/APIS/API4/show_user_not_found.dart';
import 'package:maps/APIS/API5/list_resource_data.dart';
import 'package:maps/APIS/API5/sho_list_resource.dart';
import 'package:maps/APIS/API6/show_create_data.dart';
import 'package:maps/funnel_chart.dart';
import 'package:maps/memory_image.dart';
import 'package:maps/pyramid_chart.dart';
import 'package:maps/sf_cartesian_chart.dart';
import 'dart:core';

import 'package:maps/office_chart.dart';
import 'package:maps/circular_chart.dart';
import 'package:maps/spark_area_chart.dart';

import 'APIS/API1/model/employee_data_model.dart';
import 'APIS/API1/rest_apis.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<EmployeeData>? products;
  const MyApp({Key? key, this.products}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: CreatesData(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? googleMapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  CameraPosition initialCameraPosition = CameraPosition(
    target: LatLng(
      21.170240,
      72.831062,
    ),
    zoom: 15,
  );

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LatLngBounds bounds = LatLngBounds(
      southwest: LatLng(21.170240, 72.831062),
      northeast: LatLng(21.170240, 72.831062),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Maps"),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            tiltGesturesEnabled: true,
            minMaxZoomPreference: MinMaxZoomPreference(13, 30),
            scrollGesturesEnabled: true,
            // ignore: prefer_collection_literals
            gestureRecognizers: Set()
              ..add(
                Factory<PanGestureRecognizer>(
                  () => PanGestureRecognizer(),
                ),
              ),
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            compassEnabled: true,
            cameraTargetBounds: CameraTargetBounds(bounds),
            buildingsEnabled: true,

            trafficEnabled: true,
            // polygons: {
            //   Polygon(
            //     polygonId: PolygonId("id"),
            //     fillColor: Colors.green,
            //     strokeColor: Colors.red,
            //     strokeWidth: 2,
            //     points: markers.entries.map((e) => e.value.position).toList(),
            //   ),
            // },
            initialCameraPosition: initialCameraPosition,
            mapType: MapType.normal,
            polylines: {
              Polyline(
                polylineId: PolylineId("overview_polylineId"),
                color: Colors.red,
                width: 5,
                points: markers.entries.map((e) => e.value.position).toList(),
              ),
            },
            onMapCreated: (controller) {
              setState(() {
                googleMapController = controller;
              });
            },
            onLongPress: (LatLng latLng) {
              final MarkerId markerId = MarkerId(
                UniqueKey().toString(),
              );
              final Marker marker = Marker(
                markerId: markerId,
                position: latLng,
              );
              setState(() {
                markers.addAll({markerId: marker});
              });
            },
            markers: Set<Marker>.of(markers.values),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => googleMapController?.animateCamera(
            CameraUpdate.newCameraPosition(initialCameraPosition)),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        child: Icon(
          Icons.center_focus_strong,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
