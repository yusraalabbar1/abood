import 'package:get/get.dart';

class ControllerAdmin extends GetxController {
  var idProduct;

  var nameItem, priceItem, noteItem, desItem;
  SavepriceItem(v) {
    priceItem = v;
    update();
  }

  SavenameItem(v) {
    nameItem = v;
    update();
  }

  SavenoteItem(v) {
    noteItem = v;
    update();
  }

  SavedesItem(v) {
    desItem = v;
    update();
  }

  SaveidProduct(v) {
    idProduct = v;
    update();
  }
}
