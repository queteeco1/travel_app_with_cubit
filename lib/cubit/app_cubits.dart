import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/services/data_services.dart';
import '../models/data_model.dart';
import 'app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late dynamic places;
  // late final places
  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      emit(LoadedState(places));
    } catch (e) {
      Text('$e');
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }

  goBack() {
    emit(HomeState());
  }
}

// class AppBloc extends Cubit<AppStates> {
//   AppBloc() : super(InitialStat()){
//     emit(MainState());
//   }
//
//
// }

// abstract class AppStates extends Equatable {
//
// }
// class InitialStat extends AppStates {
//   @override
//
//   List<Object?> get props => [];
//
// }
//
//
// class MainState extends AppStates {
//   @override
//   List<Object?> get props => [];
// }
//
//
// class AppP extends StatefulWidget {
//   const AppP({Key? key}) : super(key: key);
//
//   @override
//   State<AppP> createState() => _AppPState();
// }
//
// class _AppPState extends State<AppP> {
//   @override
//   Widget build(BuildContext context) {
//     return  BlocBuilder<AppBloc, AppStates>(builder: (context,state) {
//       if(state is InitialStat) {
//
//       }
//     });
//   }
// }
