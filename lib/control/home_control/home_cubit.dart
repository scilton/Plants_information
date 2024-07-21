import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:plants_informations/core/api/dio_helper.dart';
import 'package:plants_informations/core/utils/app_constants.dart';
import 'package:plants_informations/core/utils/end_points.dart';

import '../../model/plants_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  InternetConnectionChecker connection = InternetConnectionChecker();
  int filterSelectedIndex = 0;
  PlantsModel? plantsModel;
  List<Plant> plants = [];
  int page = 1;
  List<Map<String, String>> filterList = [
    {'name': 'All', 'id': 'all'},
    {'name': 'Palestine', 'id': 'pal'},
    {'name': 'Sudan', 'id': 'sud'},
    {'name': 'Myanmar', 'id': 'mya'},
    {'name': 'Transcaucasus', 'id': 'tcs'},
    {'name': 'Uzbekistan', 'id': 'uzb'},
  ];

  changeFilter(int index) {
    filterSelectedIndex = index;
    emit(HomeFilterChanged());
  }

  /// Get all plants

  void getAllPlants() {
    emit(GetPlantLoading());
    // get data from api
    try {
      DioHelper.get(url: EndPoints.allPlants, query: {
        'token': AppConstants.accessToken,
        'page': page,
      }).then((value) {
        plantsModel = PlantsModel.fromJson(value.data);
        plants = plantsModel!.plants!;
        emit(GetPlantSuccess());
      });
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(GetPlantError(e.toString()));
    }
  }

  void getZonePlants() {
    emit(GetZonePlantLoading());
    // get data from api
    try {
      DioHelper.get(
          url: EndPoints.zonePlants(filterList[filterSelectedIndex]['id']!),
          query: {
            'token': AppConstants.accessToken,
            'page': page,
          }).then((value) {
        plantsModel = PlantsModel.fromJson(value.data);
        plants = plantsModel!.plants!;
        emit(GetZonePlantSuccess());
      });
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(GetZonePlantError(e.toString()));
    }
  }
}
