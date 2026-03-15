import 'package:route_e_commerce_v2/features/commerce/data/mappers/product_mapper.dart';
import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/favorite/domain/entities/wishlist_entity.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/remote_product.dart';

class WishlistResponseDto {
  String? status;
  int? count;
  List<RemoteProduct>? data;

  WishlistResponseDto({this.status, this.count, this.data});

  WishlistResponseDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    count = json['count'];
    if (json['data'] != null) {
      data = <RemoteProduct>[];
      json['data'].forEach((v) {
        data!.add(RemoteProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['count'] = count;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Wishlist toEntity() => Wishlist(
    count: count,
    products: data?.map((product) => product.toProduct()).toList(),
  );
}
