import 'package:abood/model/admin/jsonModel/SearchModel.dart';
import 'package:get/get.dart';

class ControllerProduct extends GetxController {
  List<Map<dynamic, dynamic>> saveAllCateg = [];
  List<Map<dynamic, dynamic>> saveAllCategwithout = [];
  List<Map<dynamic, dynamic>> saveSubCateg = [];
  List<Map<dynamic, dynamic>> saveStorUserId = [];
  List<Map<dynamic, dynamic>> saveSub2Categ = [];
  List<String> bannerImg = [];
  List<Map<dynamic, dynamic>> saveContrilerBannerMap = [];
  Map<dynamic, dynamic> ItemsById = {};
  List<String> bannerImgMain = [];
  List<Map<dynamic, dynamic>> saveContrilerBannerMapMain = [];
  List<DatumSearch> v = [];
  List<Map<dynamic, dynamic>> myFavorite = [];
  List<Map<dynamic, dynamic>> myCart = [];
  List<Map<dynamic, dynamic>> myRate = [];
  dynamic total;
  SaveMyCart(v) {
    myCart = v;
    update();
  }

  SaveMyCartTotal(v) {
    total = v;
    update();
  }

  SaveMyRate(v) {
    myRate = v;
    update();
  }

  SaveMyFavorite(v) {
    myFavorite = v;
    update();
  }

  SaveSearchCateg(v) {
    v = v;
    update();
  }

  SaveItemsById(v) {
    ItemsById = v;
    update();
  }

  SaveStorUserId(v) {
    saveStorUserId = v;
    update();
  }

  SaveAllCateg(v) {
    saveAllCateg = v;
    update();
  }

  SaveAllCategWithoutall(v) {
    saveAllCategwithout = v;
    update();
  }

  SaveContrilerBannerImage(v) {
    bannerImg = v;
    update();
  }

  SaveContrilerBannerMap(v) {
    saveContrilerBannerMap = v;
    update();
  }

  SaveMainBannerImage(v) {
    bannerImgMain = v;
    update();
  }

  SaveMainBannerMap(v) {
    saveContrilerBannerMapMain = v;
    update();
  }

  SaveSubCateg(v) {
    saveSubCateg = v;
    update();
  }

  SaveSub2Categ(v) {
    saveSub2Categ = v;
    update();
  }
}
