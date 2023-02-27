import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:inmobosco/config/locator.dart';
import 'package:inmobosco/models/inmuebles.dart';
import 'package:inmobosco/repositories/inmbueble_repository.dart';
import 'package:inmobosco/services/localstorage_service.dart';

@singleton
class InmuebleService {
  late InmuebleRepository _inmuebleRepository;
  late LocalStorageService _localStorageService;

  InmuebleService() {
    _inmuebleRepository = getIt<InmuebleRepository>();

    GetIt.I
        .getAsync<LocalStorageService>()
        .then((value) => _localStorageService = value);
  }


  Future<InmuebleResponse> getAllInmuebles(page) async{
    String? token = _localStorageService.getFromDisk("user_token");
    InmuebleResponse response = await _inmuebleRepository.fetchInmuebles(page,token!);

    return response;
  }
}
