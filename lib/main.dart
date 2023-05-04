import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/services/data_services.dart';

import 'cubit/app_cubit_logics.dart';
import 'cubit/app_cubits.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: true,
      home: BlocProvider<AppCubits>(
        create: (context) {
          return AppCubits(
            data: DataServices(),
          );
        },
        child: const AppCubitLogics(),
      ),
      // routes: {
      //   '/': (context) => const DetailPage(),
      //   '/main_screen': (context) => const WelcomePage(),
      // },
      // initialRoute: '/',
    ),
  );
}
