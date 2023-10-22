import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/cep.dart';

class Back4AppRepository {
  final _client = http.Client();

  Map<String, String>? defaultHeaders;

  final _baseUrl = Uri.https('parseapi.back4app.com', '/classes/CEP');

  Back4AppRepository() {
    defaultHeaders = {
      'X-Parse-Application-Id': dotenv.env['BACK4APP_APP_ID']!,
      'X-Parse-REST-API-Key': dotenv.env['BACK4APP_API_KEY']!,
    };
  }

  Future<List<Cep>> fetchCeps() async {
    final response = await _client.get(
      _baseUrl,
      headers: defaultHeaders,
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = jsonDecode(response.body)['results'];
      return jsonResponse.cast<Cep>();
    } else {
      throw Exception('Não foi possível carregar os CEPs do Back4App.');
    }
  }
}
