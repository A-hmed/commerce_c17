import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/api_result.dart';
import 'package:route_e_commerce_v2/core/utils/app_errors.dart';
import 'package:route_e_commerce_v2/core/utils/extensions/connectivity_extension.dart';
import 'package:route_e_commerce_v2/features/cart/data/mapper/cart_mapper.dart';
import 'package:route_e_commerce_v2/features/cart/data/repositories/cart_repository/data_sources/cart_remote_data_source.dart';
import 'package:route_e_commerce_v2/features/cart/domain/entities/new_cart.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repositories/cart_repository.dart';

@Injectable(as: CartRepository)
class CartRepositoryImpl extends CartRepository {
  final CartMapper _mapper;
  final CartRemoteDataSource _cartRemoteDataSource;
  final Connectivity _connectivity;

  CartRepositoryImpl(
    this._mapper,
    this._connectivity,
    this._cartRemoteDataSource,
  );

  @override
  Future<ApiResult<NewCart>> addProductToCart(String productId) async {
    if (await _connectivity.isConnected()) {
      var result = await _cartRemoteDataSource.addProductToCart(productId);
      if (result.isSuccess && result.getData() != null) {
        return SuccessApiResult(_mapper.toCart(result.getData()!));
      } else {
        return ErrorApiResult(result.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<NewCart>> getCart() async {
    if (await _connectivity.isConnected()) {
      var result = await _cartRemoteDataSource.getCart();
      if (result.isSuccess && result.getData() != null) {
        return SuccessApiResult(_mapper.toCart(result.getData()!));
      } else {
        return ErrorApiResult(result.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<NewCart>> removeProductFromCart(String productId) async {
    if (await _connectivity.isConnected()) {
      var result = await _cartRemoteDataSource.removeProductFromCart(productId);
      if (result.isSuccess && result.getData() != null) {
        return SuccessApiResult(_mapper.toCart(result.getData()!));
      } else {
        return ErrorApiResult(result.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }

  @override
  Future<ApiResult<NewCart>> updateQuantityInCart(
    String productId,
    int quantity,
  ) async {
    if (await _connectivity.isConnected()) {
      var result = await _cartRemoteDataSource.updateQuantityInCart(
        productId,
        quantity,
      );
      if (result.isSuccess && result.getData() != null) {
        return SuccessApiResult(_mapper.toCart(result.getData()!));
      } else {
        return ErrorApiResult(result.error);
      }
    } else {
      return ErrorApiResult(NetworkError());
    }
  }
}
