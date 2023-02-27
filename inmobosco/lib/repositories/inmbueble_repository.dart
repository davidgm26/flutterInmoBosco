import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;
import 'package:inmobosco/config/locator.dart';
import 'package:inmobosco/models/inmuebles.dart';
import 'package:inmobosco/rest/rest.dart';

const _postLimit = 20;


@singleton
class InmuebleRepository {

  late RestAuthenticatedClient _client;

  InmuebleRepository() {
    _client = getIt<RestAuthenticatedClient>();
  }

  Future<InmuebleResponse> fetchInmuebles(int index) async {

    String url = "/inmueble/?page=${index}";  
  
    final response = await _client.get(url);
    
    return InmuebleResponse.fromJson(jsonDecode(response));
  
  }

}