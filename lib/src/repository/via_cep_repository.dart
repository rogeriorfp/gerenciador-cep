import 'dart:convert';

import 'package:http/http.dart';

import '../models/cep.dart';

class ViaCepRepository {
  Future<Cep?> fetchCep(String cep) async {
    var response = await get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    Cep address;
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      address = Cep.fromJson(json);
      return address;
    }
    return null;
  }
}
