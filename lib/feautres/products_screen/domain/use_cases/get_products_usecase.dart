import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/failuers.dart';
import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';
import 'package:route_task/feautres/products_screen/domain/repositories/products_repo.dart';

@injectable
class GetProductsUseCase{
  ProductsRepo productsRepo;

  GetProductsUseCase(this.productsRepo);


  Future<Either<Failures, ProductModel>> call() => productsRepo.getProducts();
}