import 'package:dio/dio.dart';
import 'user_session.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://dummyjson.com',
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<bool> login(String username, String password) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
          'expiresInMins': 30,
        },
      );

      if (response.statusCode == 200) {
        UserSession().saveUser(response.data);
        return true;
      }

      return false;

    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw Exception('Username atau password salah!');
      }
      throw Exception('Gagal terhubung ke server. Cek koneksi internet kamu!');
    }
  }
}