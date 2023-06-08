import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/cubit/login_cubit.dart';

class NgelemAjg extends StatefulWidget {
  const NgelemAjg({super.key});

  @override
  State<NgelemAjg> createState() => _NgelemAjgState();
}

class _NgelemAjgState extends State<NgelemAjg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Color(0),
        actions: [
          IconButton(
            onPressed: () {
              context.read<LoginCubit>().logout();
            },
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Placeholder(),
    );
  }
}
