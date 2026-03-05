import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:route_e_commerce_v2/features/network/models/request/login_request.dart';
import 'package:route_e_commerce_v2/features/network/models/request/register_request.dart';
import 'package:route_e_commerce_v2/features/network/models/response/auth_response.dart';
import 'package:route_e_commerce_v2/features/network/models/response/category/categories_response.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/products_response.dart';

part 'api_client.g.dart';


@singleton
@RestApi()
abstract class ApiClient {

  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @POST("/api/v1/auth/signin")
  Future<HttpResponse<AuthResponse>> login(@Body() LoginRequest loginRequest);

  @POST("/api/v1/auth/signup")
  Future<HttpResponse<AuthResponse>> register(@Body() RegisterRequest registerRequest);


  @GET("/api/v1/categories")
  Future<HttpResponse<CategoriesResponse>> getCategories();

  @GET("/api/v1/categories/{categoryId}/subcategories")
  Future<HttpResponse<CategoriesResponse>> getSubCategories(@Path() String categoryId);

  @GET("/api/v1/products")
  Future<HttpResponse<ProductsResponse>> getProducts();
}
