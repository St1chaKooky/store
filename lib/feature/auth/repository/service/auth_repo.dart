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
  Future<int> signUp(
    @Body() UserModel user
  );
  @PUT('/users/{id}')
  Future<UserModel> upadateUser(
    @Path('id') String id,
    @Body() UserModel user
  );
  @DELETE('/users/{id}')
  Future<void> deleteUser(
    @Path('id') String id,
  );
  @GET('/users/{id}')
  Future<UserModel> getUser(
    @Path('id') String id,
  );
}