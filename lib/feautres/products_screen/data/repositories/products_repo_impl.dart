import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/errors/failuers.dart';
import 'package:route_task/feautres/products_screen/data/data_sources/productsDS.dart';
import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';
import 'package:route_task/feautres/products_screen/domain/repositories/products_repo.dart';


@Injectable(as: ProductsRepo)
class ProductsRepoImpl implements ProductsRepo{
  ProductsDs productsDs;


  ProductsRepoImpl(this.productsDs);

  @override
  Future<Either<Failures, ProductModel>> getProducts() async{
    try {
      var result = await productsDs.getProducts();
      return Right(result);
    } catch (e) {
      return Left(RemoteFailure(e.toString()));
    }
  }

}