import 'package:route_task/models/products_model/product_model.dart';

class Products {
  List<Product>? product;
  int? total;
  int? skip;
  int? limit;

  Products({this.product, this.total, this.skip, this.limit});

  Products.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      product = <Product>[];
      json['products'].forEach((v) {
        product!.add(Product.fromJson(v));
      });
    }
    total = json['total'];
    skip = json['skip'];
    limit = json['limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['products'] = product!.map((v) => v.toJson()).toList();
    data['total'] = total;
    data['skip'] = skip;
    data['limit'] = limit;
    return data;
  }
}
