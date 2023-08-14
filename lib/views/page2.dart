import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train1/views/cubit/todo_cubit.dart';
// ignore: unused_import
import 'package:train1/views/service/user_service.dart';

// ignore: unused_import
import 'model/usermodel.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocConsumer<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodoError) {
            return const Center(
              child: Text("error"),
            );
          }
          return ListView.builder(
        itemCount: context.watch<TodoCubit>().users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                      context.watch<TodoCubit>().users[index].title ?? "--"),
            trailing: const Icon(Icons.person),
            leading: Text("${index + 1}"),
          );
        });


        },
        listener: (context, state) {},
      ),
    );
  }
}



