import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:route_e_commerce_v2/core/utils/resource.dart';
import 'package:route_e_commerce_v2/features/cart/domain/repositories/cart_repository.dart';
import 'package:route_e_commerce_v2/features/cart/presentation/screen/cart_cubit/cart_state.dart';

@singleton
class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;

  CartCubit(this._cartRepository) : super(CartState.initial());


  bool isProductInCart(String productId) {
    if(state.cart == null) return false;

    return state.cart!.products[productId] != null;
  }

  addToCart(String productId) async {
    emit(state.copyWith(cartResource: Resource.loading()));

    var result = await _cartRepository.addProductToCart(productId);
    if (result.isSuccess) {
      emit(
        state.copyWith(
          cart: result.getData(),
          cartResource: Resource.success(result.getData()),
        ),
      );
    } else {
      emit(state.copyWith(cartResource: Resource.error(result.error.message)));
    }
  }

  loadCart() async {
    emit(state.copyWith(cartResource: Resource.loading()));
    var result = await _cartRepository.getCart();
    if (result.isSuccess) {
      emit(
        state.copyWith(
          cart: result.getData(),
          cartResource: Resource.success(result.getData()),
        ),
      );
    } else {
      emit(state.copyWith(cartResource: Resource.error(result.error.message)));
    }
  }

  removeFromCart(String productId) async {
    emit(state.copyWith(cartResource: Resource.loading()));
    var result = await _cartRepository.removeProductFromCart(productId);
    if (result.isSuccess) {
      emit(
        state.copyWith(
          cart: result.getData(),
          cartResource: Resource.success(result.getData()),
        ),
      );
    } else {
      emit(state.copyWith(cartResource: Resource.error(result.error.message)));
    }
  }

  updateCartQuantity(String productId, int quantity) async {
    emit(state.copyWith(cartResource: Resource.loading()));
    var result = await _cartRepository.updateQuantityInCart(productId, quantity);
    if (result.isSuccess) {
      emit(
        state.copyWith(
          cart: result.getData(),
          cartResource: Resource.success(result.getData()),
        ),
      );
    } else {
      emit(state.copyWith(cartResource: Resource.error(result.error.message)));
    }
  }
}
