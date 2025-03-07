class ProductModel {
  String? productId;
  String? productCode;
  String? productTitle;
  String? productDescription;
  List<ProductImage?>? productImages;
  String? productPrice;
  String? productQuota;
  String? productIsHot;
  String? productCategory;
  String? productDateCreated;
  bool? isBookMarked;

  ProductModel(
      {this.productId,
      this.productCode,
      this.productTitle,
      this.productDescription,
      this.productImages,
      this.productPrice,
      this.productQuota,
      this.productIsHot,
      this.productCategory,
      this.productDateCreated,
      this.isBookMarked});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productCode = json['product_code'];
    productTitle = json['product_title'];
    productDescription = json['product_subtitle'];
    if (json['product_images'] != null) {
      productImages = <ProductImage>[];
      json['product_images'].forEach((v) {
        productImages!.add(ProductImage.fromJson(v));
      });
    }
    // productImages =
    //     json['product_images'].toString().split(' ~ ').cast<String>();
    productPrice = json['product_price'];
    productQuota = json['product_quota'];
    productIsHot = json['product_isHot'];
    productCategory = json['product_category'];
    productDateCreated = json['product_dateCreated'];
    isBookMarked = bool.tryParse(json['is_bookmarked'].toString()) ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_code'] = productCode;
    data['product_title'] = productTitle;
    data['product_subtitle'] = productDescription;
    data['product_price'] = productPrice;
    data['product_quota'] = productQuota;
    data['product_isHot'] = productIsHot;
    data['product_category'] = productCategory;
    data['product_dateCreated'] = productDateCreated;
    return data;
  }
}

class ProductApiModel {
  List<ProductModel?>? products;
  bool? success;
  String? message;

  ProductApiModel({this.products, this.success, this.message});

  ProductApiModel.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add(ProductModel.fromJson(v));
      });
    }
    success = json['success'];
    message = json['message'];
  }
}

class ProductImage {
  String? id;
  String? refId;
  String? path;
  String? dateCreated;

  ProductImage({this.id, this.refId, this.path, this.dateCreated});

  ProductImage.fromJson(Map<String, dynamic> json) {
    id = json['file_id'];
    refId = json['file_refId'];
    path = json['file_path'];
    dateCreated = json['file_dateCreated'];
  }
}
