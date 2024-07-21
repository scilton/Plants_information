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
    if (filterSelectedIndex != index) {
      page = 1;
      plants.clear();
      filterSelectedIndex = index;
      if (index == 0) {
        getAllPlants();
      } else {
        getZonePlants();
      }
      emit(HomeFilterChanged());
    }
  }

  /// Get all plants
  Future<void> getAllPlants() async {
    emit(GetPlantLoading());
    // get data from api
    try {
    await  DioHelper.get(url: EndPoints.allPlants, query: {
        'token': AppConstants.accessToken,
        'page': page,
      }).then((value) {
        plantsModel = PlantsModel.fromJson(value.data);
        plants.addAll(plantsModel!.plants!);
        emit(GetPlantSuccess());
      });
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(GetPlantError(e.toString()));
    }
  }

  /// Get zone plants
  Future<void> getZonePlants() async {
    emit(GetPlantLoading());
    try {
    await  DioHelper.get(
          url: EndPoints.zonePlants(filterList[filterSelectedIndex]['id']!),
          query: {
            'token': AppConstants.accessToken,
            'page': page,
          }).then((value) {
        plantsModel = PlantsModel.fromJson(value.data);
        plants.addAll(plantsModel!.plants!);
        emit(GetPlantSuccess());
      });
    } on DioException catch (e) {
      debugPrint(e.toString());
      emit(GetPlantError(e.toString()));
    }
  }

  /// Load more plants
  bool loadMore = true;

  Future<void> loadMorePlants() async {
    loadMore = true;
    page++;
    try {
      if (filterSelectedIndex == 0) {
        await getAllPlants();
        emit(LoadMoreSuccess());
      } else {
        await getZonePlants().then((value) {
          emit(LoadMoreSuccess());
        });
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      loadMore = false;
    }
  }
}
