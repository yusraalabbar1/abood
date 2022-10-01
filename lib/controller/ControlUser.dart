import 'package:get/get.dart';

class Homecontroller extends GetxController {
  var userType,
      countryId,
      mobileNumber,
      password,
      firstName,
      lastName,
      fullName,
      deviceId,
      createDate,
      active,
      id,
      saveaCountryId,
      email,
      passwordcon,
      idReg,
      identif,
      cityId;
  bool islogin = false;
  List<Map<dynamic, dynamic>> saveallCountry = [];
  List<Map<dynamic, dynamic>> allCity = [];
  ident(c) {
    identif = c;
    update();
  }

  SaveallCity(c) {
    allCity = c;
    update();
  }

  SaveaisLogin(c) {
    islogin = c;
    update();
  }

  SaveIdRegister(c) {
    idReg = c;
    update();
  }

  SaveallCountry(c) {
    saveallCountry = c;
    update();
  }

  SaveaCountryId(c) {
    saveaCountryId = c;
    update();
  }

  SaveuserType(var c) {
    userType = c;
    update();
  }

  SavecountryId(var c) {
    countryId = c;
    update();
  }

  SavemobileNumber(var c) {
    mobileNumber = c;
    update();
  }

  Saveemail(var c) {
    email = c;
    update();
  }

  Savepassword(var c) {
    password = c;
    update();
  }

  SavepasswordConf(var c) {
    passwordcon = c;
    update();
  }

  SavefirstName(var c) {
    firstName = c;
    update();
  }

  SavelastName(var c) {
    lastName = c;
    update();
  }

  SavefullName(var c) {
    fullName = c;
    update();
  }

  SavedeviceId(var c) {
    deviceId = c;
    update();
  }

  Saveactive(var c) {
    active = c;
    update();
  }

  Saveid(var c) {
    id = c;
    update();
  }
}
