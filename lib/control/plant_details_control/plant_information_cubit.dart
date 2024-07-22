import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

part 'plant_information_state.dart';

class PlantInformationCubit extends Cubit<PlantInformationState> {
  PlantInformationCubit() : super(PlantInformationInitial());

  void goToLink(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
    }
  }
}
