import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as location;
import 'package:provider/provider.dart';
import 'package:remis/stores/branchnearbystore.dart';
import 'package:url_launcher/url_launcher.dart';

class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  GoogleMapController mapController;
  location.Location _location = location.Location();
  LatLng _center = const LatLng(6.5483768, 3.1438748);
  String address = "Nearby Alagomeji";
  String addressPicker = "Search";
  bool fetched = false;
  bool showCard = false;
  static const API_KEY = "AIzaSyBgzO5fJYtGzXy61jKLYqz4sVE6gYqNBOU";
  static const double minExtent = 0.15;
  static const double maxExtent = 0.6;
  double initialExtent = minExtent;
  bool isExpanded = false;

//  6.5008806, 3.3778282

  _onMapCreated(GoogleMapController controller) async {
    final branchNearbyStore = Provider.of<BranchNearbyStore>(context);
//    mapController = controller;
//    _location.onLocationChanged.listen((l) {
//      _setMaker(l);
//      branchNearbyStore.getNearbyBranches(
//          latitude: l.latitude.toString(), longitude: l.longitude.toString());
//
//      print(l.toString() + " center");
//      mapController.animateCamera(
//        CameraUpdate.newCameraPosition(
//          CameraPosition(
//            target: LatLng(l.latitude, l.longitude),
//            zoom: 15,
//          ),
//        ),
//      );
//    });
    mapController = controller;
    location.LocationData data = await _location.getLocation();

    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(data.latitude, data.longitude),
          zoom: 15,
        ),
      ),
    );
    await branchNearbyStore.getNearbyBranches(
        latitude: data.latitude.toString(),
        longitude: data.longitude.toString());

    var result = await Geocoder.local.findAddressesFromCoordinates(
        Coordinates(data.latitude, data.longitude));
    setState(() {
      address =
          "Nearby " + result[0].featureName + ", " + result[0].thoroughfare;
    });
  }

  void _setMaker(location.LocationData l) async {
    var result = await Geocoder.local
        .findAddressesFromCoordinates(Coordinates(l.latitude, l.longitude));
    setState(() {
      address =
          "Nearby " + result[0].featureName + ", " + result[0].thoroughfare;
    });

    final icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(2, 2)), 'assets/tool.png');
    markers.add(Marker(
        markerId: MarkerId("Marker"),
        position: _center,
        icon: icon,
        draggable: true));
  }

//  _onCameraMove(CameraPosition position){
//    _lastMapPosition = position.target;
//  }
  @override
  Widget build(BuildContext context) {
    final branchNearbyStore = Provider.of<BranchNearbyStore>(context);
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          height: 300,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff1A3365),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 0, 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Find Station",
                      style: TextStyle(
                          fontFamily: "MontserratMedium", fontSize: 20),
                    ),
                    Text(
                      "Current Location:",
                      style: TextStyle(
                          fontFamily: "MontserratMedium", fontSize: 20),
                    ),
                  ]),
            ],
          ),
        ),
        bottom: PreferredSize(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
                child: Text(
                  address.replaceAll("Nearby", ""),
                  style: TextStyle(
                      fontFamily: "MontserratSemiBold",
                      color: Color(0xffFFBB00),
                      fontSize: 15),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(30)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  showCard = !showCard;
                });
              },
              icon: SvgPicture.asset(
                "assets/search.svg",
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(target: _center, zoom: 12.0),
            onMapCreated: _onMapCreated,
            mapType: MapType.normal,
            markers: Set.from(markers),
            myLocationEnabled: true,
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 100, 0.0),
              child: DraggableScrollableActuator(
                child: DraggableScrollableSheet(
                    initialChildSize: initialExtent,
                    minChildSize: minExtent,
                    maxChildSize: maxExtent,
                    builder: (context, listController) {
                      BuildContext dragContext = context;
                      return Observer(
                        builder: (_) => Container(
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                color: Color(0xff1A3365)),
                            child: ListView.builder(
                                controller: listController,
                                itemCount:
                                    branchNearbyStore.nearbyBranches.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == 0) {
                                    return GestureDetector(
                                      onTap: () {
//                                        setState(() {
//                                          initialExtent =
//                                          isExpanded ? maxExtent : minExtent;
//                                          isExpanded = !isExpanded;
//                                        });
//                                        DraggableScrollableActuator.reset(dragContext);
                                      },
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 2.5, right: 2.5),
                                            child: Container(
                                              height: 5,
                                              decoration: BoxDecoration(
                                                  color: Colors.lightBlue,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10))),
                                            ),
                                          ),
                                          Container(
                                            height: 70,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Icon(
                                                  Icons.keyboard_arrow_down,
                                                  color: Colors.white,
                                                ),
                                                Flexible(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: <Widget>[
                                                      Text(
                                                        address,
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "MontserratSemiBold"),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        "Fuel Station",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontFamily:
                                                                "Montserrat"),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8.0),
                                                  child: Text(
                                                    branchNearbyStore
                                                        .nearbyBranches.length
                                                        .toString(),
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFBB00),
                                                        fontSize: 50),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                  return ListTile(
                                    onTap: () async {
                                      final url =
                                          "https://maps.google.com/maps?daddr=${branchNearbyStore.nearbyBranches[index - 1].latitude},${branchNearbyStore.nearbyBranches[index - 1].longitude}";
                                      print(url);
                                      if (await canLaunch(url)) {
                                        await launch(url,
                                            enableJavaScript: true);
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: "Cannot load url");
                                      }
                                    },
                                    title: Text(
                                      branchNearbyStore
                                          .nearbyBranches[index - 1].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: "MontserratSemiBold"),
                                    ),
                                    trailing: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          color: Color(0xff353A50)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(14.0),
                                        child: SvgPicture.asset(
                                          "assets/direction.svg",
                                          color: Colors.white,
                                          width: 20,
                                        ),
                                      ),
                                    ),
                                    leading: Stack(
                                      alignment: Alignment.center,
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Color(0xffD8FBE4),
                                          radius: 20,
                                        ),
                                        SvgPicture.asset(
                                          "assets/fuellocation.svg",
                                          color: Color(0xff1A3365),
                                          width: 20,
                                        )
                                      ],
                                    ),
                                    subtitle: Text(
                                      branchNearbyStore
                                          .nearbyBranches[index - 1].distance,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontFamily: "Montserrat"),
                                    ),
                                  );
                                })),
                      );
                    }),
              ),
            ),
          ),
          if (showCard)
            GestureDetector(
              onTap: () async {
                Prediction p = await PlacesAutocomplete.show(
                    context: context,
                    apiKey: API_KEY,
                    mode: Mode.overlay,
                    onError: (error) {
                      print(error.errorMessage + " ERROR");
                    },
                    language: "en",
                    components: [Component(Component.country, "ng")]);
                displayPrediction(p);
              },
              child: Card(
                elevation: 3.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                ),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    alignment: Alignment.center,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.search),
                        SizedBox(
                          width: 30,
                        ),
                        Expanded(
                            child: Text(
                          addressPicker,
                          style: TextStyle(
                              fontSize: 15, fontFamily: "NunitoSemiBold"),
                        )),
                      ],
                    )),
              ),
            ),
        ],
      ),
    );
  }

  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)
      final branchNearbyStore = Provider.of<BranchNearbyStore>(context);

      GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: API_KEY);
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      var result = await Geocoder.local
          .findAddressesFromCoordinates(Coordinates(lat, lng));
      await branchNearbyStore.getNearbyBranches(
          latitude: lat.toString(), longitude: lng.toString());
      setState(() {
        addressPicker = p.description;
        address =
            "Nearby " + result[0].featureName + ", " + result[0].thoroughfare;
      });
    }
  }

  List<Marker> markers = [];
}
