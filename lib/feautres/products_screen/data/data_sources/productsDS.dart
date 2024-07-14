import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';

abstract class ProductsDs {
  Future<ProductModel> getProducts();
}