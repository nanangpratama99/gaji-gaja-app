import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tugas_ubah/tugas6/models/category_model.dart';
import 'package:go_router/go_router.dart';

import '../cubits/cubit/login_cubit.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.categories;
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
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return ListTile(
            title: Text(category.name),
            onTap: () {
              return context.go(
                context.namedLocation(
                  'product_list',
                  params: <String, String>{'category': category.name},
                  queryParams: <String, String>{'sort': 'desc', 'filter': '0'},
                ),
              );
            },
          );
        },
      ),
    );
  }
}
