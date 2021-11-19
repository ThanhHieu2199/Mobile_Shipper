import 'package:mobile_shipper/model/moto_item.dart';
class MotoUtils {
  static List<motoItem> cars;

  static List<motoItem> getCarList() {
    if(cars != null) {
      return cars;
    }

    cars = new List();
    cars.add(motoItem("CĂN CƯỚC", "CCCD.png", 25000));
    cars.add(motoItem("HỘ KHẨU", "sohokhau.png", 30000));
    cars.add(motoItem("HỘ CHIẾU", "hochieu.png", 35000));
    cars.add(motoItem("CÁC LOẠI BẰNG", "giaychungnhan.png", 25000));
    cars.add(motoItem("GIẤY TỜ KHÁC", "logo.png", 30000));


    return cars;
  }
}