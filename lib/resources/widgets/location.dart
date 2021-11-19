import 'package:flutter/material.dart';
import 'package:mobile_shipper/model/place.dart';
import 'package:mobile_shipper/resources/location_page.dart';

class location extends StatefulWidget {
  final Function(PlaceItemRes, bool) onSelected;
  location(this.onSelected);
  @override
  _locationState createState() => _locationState();
}

class _locationState extends State<location> {
  PlaceItemRes fromAddress;
  PlaceItemRes toAddress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Color(0x88999999),
              offset: Offset(0, 5),
              blurRadius: 5.0,
            ),
          ]),
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => LocationPage(
                      fromAddress == null ? "" : fromAddress.name,
                          (place, isFrom) {
                        widget.onSelected(place, isFrom);
                        fromAddress = place;
                        setState(() {});
                      }, true
                  )));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Icon(Icons.location_on),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Icon(Icons.location_city),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
                       "Tp Thủ Đức",
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LocationPage(
                        toAddress == null ? "" : toAddress.name,
                            (place, isFrom) {
                          widget.onSelected(place, isFrom);
                          toAddress = place;
                          setState(() {});
                        }, false
                    )));
              },
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: <Widget>[
                    SizedBox(
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Icon(Icons.car_rental),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      width: 40,
                      height: 50,
                      child: Center(
                        child: Icon(Icons.location_city),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 40, right: 50),
                      child: Text(
              "Trường đại học công nghệ TP Hồ Chí Minh",
                        style:
                        TextStyle(fontSize: 16, color: Color(0xff323643)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}