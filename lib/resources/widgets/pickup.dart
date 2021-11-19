import 'package:flutter/material.dart';
import 'package:mobile_shipper/blocs/pickup_bloc.dart';

class Pickup extends StatefulWidget {

  final int distance;
  Pickup(this.distance);

  @override
  _PickupState createState() => _PickupState();
}

class _PickupState extends State<Pickup> {

  var carBloc = new PickupBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: carBloc.stream,
      builder: (context, snapshot){
        return Stack(
          children: <Widget>[
            Container(
              constraints: BoxConstraints.expand(height: 137),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: ListView.builder(itemBuilder: (context, index) {
                return FlatButton(
                  color: carBloc.isSelected(index) ? Color(0x3000ffff) : Colors.white,
                  onPressed: () {
                    carBloc.selectItem(index);
                  },
                  child: Container(
                    constraints: BoxConstraints.expand(width: 120),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              borderRadius: BorderRadius.all(Radius.circular(2))
                          ),
                          child: Text(carBloc.carList.elementAt(index).name, style: TextStyle(color: Colors.white, fontSize: 12),),
                          padding: EdgeInsets.all(4),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xfff7f7f7),
                          ),
                          width: 64,
                          height: 64,
                          child: Center(
                            child: Image.asset(carBloc.carList.elementAt(index).assetsName),
                          ),
                        ),
                        Text(carBloc.carList.elementAt(index).pricePerKM.toString() + " \VND ", style: TextStyle(color: Color(0xff606470), fontSize: 12),)
                      ],
                    ),
                  ),
                );
              }, itemCount: carBloc.carList.length, scrollDirection: Axis.horizontal,),
            ),
            Positioned(
              bottom: 48, right: 0, left: 0, height: 50,
              child: Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("TỔNG (" + _getDistanceInfo() + "): ",
                      style: TextStyle(fontSize: 18, color: Colors.black),),
                    Text( _getTotal().toString() + " \VND ", style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)
                  ],
                ),
              ),),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: RaisedButton(onPressed: (){}, color: Color(0xff3277D8),
                  child: Text("ĐẶT XE", style: TextStyle(color: Colors.white, fontSize: 16),),),
              ),)
          ],
        );
      },
    );
  }

  String _getDistanceInfo() {
    double distanceInKM = widget.distance / 1000;
    return distanceInKM.toString() + "  km";
  }

  double _getTotal() {
    double distanceInKM = widget.distance / 1000;
    return (distanceInKM * carBloc.getCurrentCar().pricePerKM);
  }
}