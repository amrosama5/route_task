import 'package:injectable/injectable.dart';
import 'package:route_task/core/api/api_manager.dart';
import 'package:route_task/core/api/end_points.dart';
import 'package:route_task/feautres/products_screen/data/data_sources/productsDS.dart';
import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';

@Injectable(as: ProductsDs )
class ProductsDsImpl implements ProductsDs{
  ApiManager apiManager;

  ProductsDsImpl(this.apiManager);

  @override
  Future<ProductModel> getProducts() async{
    var response = await apiManager.getData(EndPoints.getProducts);

    ProductModel productModel = ProductModel.fromJson(response.data);
    return productModel;
  }

}