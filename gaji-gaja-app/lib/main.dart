import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_ubah/app/cubits/cubit/login_cubit.dart';

import 'app/router/app_router.dart';
import 'app/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Builder(builder: (context) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tugas Go Router',
          // theme: ThemeData(brightness: Brightness.dark),
          home: SplashScreen(
            splashDuration: 3000, // Durasi splash screen (ms)
            navigateAfterSplash: MaterialApp.router(
              // Konfigurasi MaterialApp setelah splash screen
              debugShowCheckedModeBanner: false,
              title: 'Tugas Go Router',
              routerConfig: AppRouter(context.read<LoginCubit>()).router,
            ),
          ),
        );
      }),
    );
  }
}
