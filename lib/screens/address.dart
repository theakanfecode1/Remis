import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:remis/screens/vendorlist.dart';

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {

  String addressPicker = "Input Address";
  static const API_KEY = "AIzaSyBgzO5fJYtGzXy61jKLYqz4sVE6gYqNBOU";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      appBar: AppBar(
        elevation: 0,
        title: Text("Address",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "MontserratSemiBold"
          ),),
        backgroundColor: Color(0xff1A3365),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff1A3365),

              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30,top: 10),
                child: SvgPicture.asset("assets/tracking.svg",
                  color: Colors.white,
                  width: 30,),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:30.0),
                      child: Text("where do you want your fuel delivered?",
                      style: TextStyle(
                        fontSize: 17,
                        color: Color(0xff1A3365),
                        fontFamily: "MontserratMedium"
                      ),),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Flexible(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(70),
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  onTap:() async {
                                    Prediction p = await PlacesAutocomplete.show(
                                        context: context,
                                        apiKey: API_KEY,
                                        mode: Mode.overlay,
                                        onError: (error){
                                          print(error.errorMessage + " ERROR");
                                        },
                                        language: "en",
                                        components: [Component(Component.country, "ng")]);
                                    displayPrediction(p);
                                  },
                                  child: Card(
                                    elevation: 3.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(

                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: <Widget>[
                                                  CircleAvatar(
                                                    radius: 25.0,
                                                    backgroundColor: Color(0xffE6EFFF),
                                                  ),
                                                  SvgPicture.asset(
                                                    'assets/fuel.svg',
                                                    width: 30,
                                                    color: Color(0xff1A3365),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Expanded(child: Text(addressPicker,style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: "NunitoSemiBold"
                                            ),)),
                                          ],
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 58,
                                  child: RaisedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(CupertinoPageRoute(
                                          builder: (BuildContext context) =>
                                              VendorList(),
                                          maintainState: false));
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(8)),
                                    color: Color(0xff1A3365),
                                    child: (Text(
                                      "Proceed",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Nunito",
                                          fontSize: 20),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<Null> displayPrediction(Prediction p) async {
    if (p != null) {
      // get detail (lat/lng)

      GoogleMapsPlaces _places = new GoogleMapsPlaces(apiKey: API_KEY);
      PlacesDetailsResponse detail = await _places.getDetailsByPlaceId(p.placeId);
      final lat = detail.result.geometry.location.lat;
      final lng = detail.result.geometry.location.lng;
      var result = await Geocoder.local
          .findAddressesFromCoordinates(Coordinates(lat, lng));

      setState(() {
        addressPicker = p.description;


      });





    }
  }
}
