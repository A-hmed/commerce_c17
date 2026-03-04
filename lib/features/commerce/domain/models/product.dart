class Product {
  final String? id;
  final String? title;
  final String? description;
  final double? price;
  final double? priceAfterDiscount;
  final String? imageCover;
  final List<String>? images;
  final String? categoryId;
  final String? brandId;
  final double? ratingsAverage;
  final int? ratingsQuantity;
  final int? quantity;
  final List<String>? availableColors;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.priceAfterDiscount,
    this.imageCover,
    this.images,
    this.categoryId,
    this.brandId,
    this.ratingsAverage,
    this.ratingsQuantity,
    this.quantity,
    this.availableColors,
  });
}
