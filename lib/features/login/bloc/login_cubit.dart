// ignore_for_file: depend_on_referenced_packages

import 'package:agok_app/features/login/model/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  // ignore: missing_return, body_might_complete_normally_nullable
  Future<User?> login(
      {required String username, required String password}) async {
    try {
      if (username.isEmpty || password.isEmpty) {
        throw 'Geçersiz Kullanıcı Adı veya Şifre';
      }
      emit(LoginLoading());
      final dio = Dio();
      final response = await dio.post(
        'https://monkfish-app-3qxrp.ondigitalocean.app/login',
        data: {"username": username, "password": password},
      );

      if (response.statusCode == 200) {
        emit(LoginLoaded(User.fromJson(response.data)));
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw response.statusCode!;
      }
    } on DioError catch (e) {
      emit(LoginError(e.response!.statusCode.toString()));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }
}
