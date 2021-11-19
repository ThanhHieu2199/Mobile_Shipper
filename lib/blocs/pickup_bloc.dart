import 'dart:async';

import 'package:mobile_shipper/config/moto_utils.dart';
import 'package:mobile_shipper/model/moto_item.dart';

class PickupBloc {
  var _pickupController = new StreamController();
  var carList = MotoUtils.getCarList();
  get stream => _pickupController.stream;

  var currentSelected = 0;

  void selectItem(int index) {
    currentSelected = index;
    _pickupController.sink.add(currentSelected);
  }

  bool isSelected(int index) {
    return index == currentSelected;
  }

  motoItem getCurrentCar() {
    return carList.elementAt(currentSelected);
  }

  void dispose() {
    _pickupController.close();
  }
}