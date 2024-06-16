
import 'package:dio/dio.dart';
import 'package:fake_store/feature/auth/data/userModel.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repo.g.dart';
@RestApi(baseUrl: 'https://fakestoreapi.com/')
abstract class UserRepo {
  factory UserRepo(Dio dio, {String baseUrl}) = _UserRepo;

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