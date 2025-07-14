import 'metadata_dto.dart';
import 'products_dto.dart';

class ProductsResponseDto {
  int? results;
  Metadata? metadata;
  List<ProductsDto>? productsDto;

  ProductsResponseDto({this.results, this.metadata, this.productsDto});

  ProductsResponseDto.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      productsDto = <ProductsDto>[];
      json['data'].forEach((v) {
        productsDto!.add(ProductsDto.fromJson(v));
      });
    }
  }
}
