import 'package:flutter/material.dart';
import 'package:mobile_shipper/blocs/place_bloc.dart';
import 'package:mobile_shipper/model/place.dart';

class LocationPage extends StatefulWidget {
  final String selectedAddress;
  final Function(PlaceItemRes, bool) onSelected;
  final bool _isFromAddress;
  LocationPage(this.selectedAddress, this.onSelected, this._isFromAddress);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  var _addressController;
  var placeBloc = PlaceBloc();

  @override
  void initState() {
    _addressController = TextEditingController(text: widget.selectedAddress);
    super.initState();
  }

  @override
  void dispose() {
    placeBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: <Widget>[
                      SizedBox(
                        width: 40,
                        height: 60,
                        child: Center(
                          child: Icon(Icons.location_on),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: FlatButton(
                              onPressed: () {
                                _addressController.text = "";
                              },
                              child: Icon(Icons.delete_forever)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 50),
                        child: TextField(
                          controller: _addressController,
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {
                            //user click gọi
                            placeBloc.searchPlace(str);},
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
              padding: EdgeInsets.only(top: 20),
              child: StreamBuilder(
                  stream: placeBloc.placeStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      print(snapshot.data.toString());
                      if (snapshot.data == "start") {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      print(snapshot.data.toString());
                      List<PlaceItemRes> places = snapshot.data;
                      return ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Text(places.elementAt(index).name),
                            subtitle: Text(places.elementAt(index).address),
                            onTap: () {
                            print("on tap");
                            Navigator.of(context).pop();
                            widget.onSelected(places.elementAt(index),
                            widget._isFromAddress);
                            },
                            );
                          },
                          separatorBuilder: (context, index) => Divider(
                            height: 1,
                            color: Color(0xfff5f5f5),
                          ),
                          itemCount: places.length);
                    } else {
                      return Container();
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }
}