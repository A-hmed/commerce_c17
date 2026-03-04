import '../metadata.dart';
import 'remote_product.dart';

class ProductsResponse {
  ProductsResponse({this.results, this.metadata, this.products});

  ProductsResponse.fromJson(dynamic json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(RemoteProduct.fromJson(v));
      });
    }
  }

  num? results;
  Metadata? metadata;
  List<RemoteProduct>? products;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['results'] = results;
    if (metadata != null) {
      map['metadata'] = metadata?.toJson();
    }
    if (products != null) {
      map['data'] = products?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
