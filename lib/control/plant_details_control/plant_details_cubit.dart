import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plant_details_state.dart';

class PlantDetailsCubit extends Cubit<PlantDetailsState> {
  PlantDetailsCubit() : super(PlantDetailsInitial());
}
