import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/widgets/pages/detail_page.dart';
import '../widgets/navigation_pages/main_page.dart';
import '../widgets/pages/welcome_page.dart';
import 'app_cubit_states.dart';
import 'app_cubits.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state) {
          if (state is DetailState) {
            return const DetailPage();
          }
          if (state is WelcomeState) {
            return const WelcomePage();
          }
          if (state is LoadedState) {
            return const MainPage();
          }
          if (state is HomeState) {
            return const WelcomePage();
          }
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container(color: Colors.yellow);
          }
        },
      ),
    );
  }
}
