import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DovizController extends GetxController {
  var birimler = [
    "EUR",
    "USD",
    "GBP",
    "RUB",
    "JPY",
    "SAR",
    "ILS",
    "MXN",
    "CNY",
    "KRW",
  ].obs;
  var alis = "AlÄ±Å";
  var alisDeger = [].obs;
  var satis = "SatÄ±Å";
  var satisDeger = [].obs;
  var degisim = "DeÄiÅim";
  var degisimDeger = [].obs;
  var kurDeger = [1.0, 1, 1, 1, 1, 1, 1, 1, 1, 1].obs;
  var tlDeger = [1.0, 1, 1, 1, 1, 1, 1, 1, 1, 1].obs;
// usd eur gbp rub jpy sar ıls mxn cny krw
  void incrementCounter() async {
    var url = Uri.parse('https://finans.truncgil.com/today.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var cozumleme = jsonDecode(response.body);

      for (var i = 0; i < birimler.length; i++) {
        alisDeger.add(cozumleme[birimler[i]][alis]);
        satisDeger.add(cozumleme[birimler[i]][satis]);
        degisimDeger.add(cozumleme[birimler[i]][degisim]);
      }
    }
  }

  void dovizToTl(doviz) async {
    var url = Uri.parse('https://finans.truncgil.com/today.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var cozumleme = jsonDecode(response.body);
      kurDeger.clear();
      tlDeger.clear();
      for (var i = 0; i < birimler.length; i++) {
        var hspla;
        hspla = cozumleme[birimler[i]][satis];
        String cleanedAlisStr = hspla.replaceAll(',', '.');
        double alisDouble = double.parse(cleanedAlisStr);

        kurDeger.add(doviz);
        tlDeger.add(doviz * alisDouble);
      }
    }
  }

  void tlToDoviz(tl) async {
    var url = Uri.parse('https://finans.truncgil.com/today.json');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var cozumleme = jsonDecode(response.body);
      for (var i = 0; i < birimler.length; i++) {
        var hspla;
        hspla = cozumleme[birimler[i]][satis];
        String cleanedAlisStr = hspla.replaceAll(',', '.');
        double alisDouble = double.parse(cleanedAlisStr);
        print(tl / alisDouble);
      }
    }
  }
}
