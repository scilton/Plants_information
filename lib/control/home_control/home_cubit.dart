import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  InternetConnectionChecker connection = InternetConnectionChecker();
  int filterSelectedIndex = 0;
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


}
