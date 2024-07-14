import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:route_task/core/enums/enums.dart';
import 'package:route_task/core/errors/failuers.dart';
import 'package:route_task/feautres/products_screen/data/models/ProductsModel.dart';
import '../../domain/use_cases/get_products_usecase.dart';

part 'products_event.dart';
part 'products_state.dart';
part 'products_bloc.freezed.dart';

@injectable
class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetProductsUseCase getProductsUseCase;


  ProductsBloc({required this.getProductsUseCase}) : super(const ProductsState()) {
    on<getProductsEvennt>((event, emit) async{
      emit(state.copyWith(getProductsStatus: RequestStatus.loading));
      var result = await getProductsUseCase();
      result.fold((l) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.failure, productsFailures: l));
      }, (r) {
        emit(state.copyWith(
            getProductsStatus: RequestStatus.success, productsModel: r));
      });
    });
  }
}
