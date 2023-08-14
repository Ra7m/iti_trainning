// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../model/usermodel.dart';
import '../service/user_service.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial()) {
    getMyUsers();
  }
  
  List<UserModel> users = [];
  getMyUsers() async {
    try {
      emit(TodoLoading());
      users = await UserService().getUsers();
      emit(TodoSuccess());
    } catch (e) {
      emit(TodoError());
    }
  }
}
