import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/core/models/user_model.dart';
import 'package:men_store_app/core/network/api_endpoints.dart';
import 'package:men_store_app/core/network/dio_client.dart';
import 'package:men_store_app/core/network/network_exceptions.dart';
import 'package:men_store_app/features/auth/models/login_request_model.dart';
import 'package:men_store_app/features/auth/presentation/manager/log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  // بيستخدم نفس الـ Dio المشترك في التطبيق كله (baseUrl + timeouts + logging)
  // بدل ما يعمل Dio() جديدة بإعدادات مختلفة
  final Dio _dio = DioClient().dio;

  LogInCubit() : super(const LogInInitial());

  Future<void> emitLoginStates({
    required String email,
    required String password,
  }) async {
    emit(const LogInLoading());

    try {
      final response = await _dio.post(
        ApiEndpoints.login,
        data: LoginRequestModel(email: email, password: password).toJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final userModel = UserModel.fromJson(
          response.data as Map<String, dynamic>,
        );
        emit(LogInSuccess(userModel));
      } else {
        emit(const LogInError('Login failed. Please check your credentials.'));
      }
    } on DioException catch (error) {
      // بيقرأ رسالة السيرفر لو موجودة، وإلا بيرجع لرسالة عامة موحّدة
      // مع باقي المشروع (resolveDioError) بدل رسالة منفصلة هنا
      final serverMessage = error.response?.data is Map
          ? (error.response?.data as Map)['message']?.toString()
          : null;
      emit(LogInError(serverMessage ?? resolveDioError(error)));
    } catch (error) {
      emit(LogInError(error.toString()));
    }
  }
}
