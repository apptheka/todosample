import 'package:dio/dio.dart';
import 'package:todolist/data/responses/responses.dart';
import 'package:retrofit/http.dart';
import '../../app/constant.dart';

part 'app_api.g.dart';
// flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("")
  Future<BaseResponse> login(
      @Field("email") String email, @Field("pwd") String pwd);
}
