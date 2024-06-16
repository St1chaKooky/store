import 'package:dio/dio.dart';
import 'package:fake_store/feature/auth/data/loginModel.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_repo.g.dart';


@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class AuthRepo {
  factory AuthRepo(Dio dio, {String baseUrl}) = _AuthRepo;
  @POST('/auth/login')
  Future<String> signIn(
    @Body() LoginModel user
  );

  @POST('/users')
  Future<Map<String, dynamic>> signUp(
    @Body() UserModel user
  );
}