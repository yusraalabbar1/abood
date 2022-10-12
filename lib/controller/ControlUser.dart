import 'package:abood/view/user/start/welcom.dart';
import 'package:flutter/material.dart';
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
  List<Map<dynamic, dynamic>> allSetting = [];
  var face, whats, site;
  var about, term, privec, prot, idCity, page = 0;
  StatefulWidget pageRout = const welcom();
  var idSec, idSubSec;
  SaveIdSubSec(c) {
    idSubSec = c;
    update();
  }

  SavrIdSec(c) {
    idSec = c;
    update();
  }

  ChangePage(c) {
    pageRout = c;
    update();
  }

  SavePage(c) {
    page = c;
    update();
  }

  SaveAllSetting(c) {
    allSetting = c;
    update();
  }

  SaveAbout(c) {
    about = c;
    update();
  }

  SaveTerm(c) {
    term = c;
    update();
  }

  SavePriv(c) {
    privec = c;
    update();
  }

  SaveProt(c) {
    prot = c;
    update;
  }

  SaveSite(c) {
    site = c;
    update();
  }

  SaveWhats(c) {
    whats = c;
    update();
  }

  SaveFaceBook(c) {
    face = c;
    update();
  }

  ident(c) {
    identif = c;
    update();
  }

  SaveallCity(c) {
    allCity = c;
    update();
  }

  SaveaCityId(c) {
    idCity = c;
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
