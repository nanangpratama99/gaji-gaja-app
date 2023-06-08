import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_ubah/tugas6/config/app_router.dart';
// import 'package:flutter_go_router/config/app_router.dart';
import 'package:tugas_ubah/tugas6/cubits/cubit/login_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Tugas Go Router',
          // theme: ThemeData(brightness: Brightness.dark),
          routerConfig: AppRouter(context.read<LoginCubit>()).router,
        );
      }),
    );
  }
}
