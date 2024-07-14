import 'package:dartz/dartz.dart';
import 'package:route_task/core/errors/failuers.dart';
import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';

abstract class ProductsRepo {
  Future<Either<Failures,ProductModel>> getProducts();
}