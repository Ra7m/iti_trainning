import 'package:dio/dio.dart';
import 'package:train1/views/model/usermodel.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/todos";
 Future< List<UserModel> >getUsers() async {
    List<UserModel> userlist = [];
    final dio = Dio();
    final response = await dio.get(url);
    var data = response.data;
    // ignore: non_constant_identifier_names
    data.forEach((Element) {
      UserModel user = UserModel.fromJson(Element);
      userlist.add(user);
    });
    return userlist;
  }
}
