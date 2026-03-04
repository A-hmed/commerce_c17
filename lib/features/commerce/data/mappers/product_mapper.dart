import 'package:route_e_commerce_v2/features/commerce/domain/models/product.dart';
import 'package:route_e_commerce_v2/features/network/models/response/products/remote_product.dart';

extension RemoteProductMapper on RemoteProduct {
  Product toProduct() {
    return Product(
      id: id,
      title: title,
      ///Missing data from api
      availableColors: [],
      brandId: brand?.id,
      categoryId: category?.id,
      description: description,
      imageCover: imageCover,
      images: images,
      price: price?.toDouble(),
      priceAfterDiscount: priceAfterDiscount?.toDouble(),
      quantity: quantity?.toInt(),
      ratingsAverage: ratingsAverage?.toDouble(),
      ratingsQuantity: ratingsQuantity?.toInt(),
    );
  }
}
