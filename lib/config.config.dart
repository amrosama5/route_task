// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/api/api_manager.dart' as _i3;
import 'feautres/products_screen/data/data_sources/products_ds_impl.dart'
    as _i5;
import 'feautres/products_screen/data/data_sources/productsDS.dart' as _i4;
import 'feautres/products_screen/data/repositories/products_repo_impl.dart'
    as _i7;
import 'feautres/products_screen/domain/repositories/products_repo.dart' as _i6;
import 'feautres/products_screen/domain/use_cases/get_products_usecase.dart'
    as _i8;
import 'feautres/products_screen/presentation/bloc/products_bloc.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.ProductsDs>(() => _i5.ProductsDsImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.ProductsRepo>(
        () => _i7.ProductsRepoImpl(gh<_i4.ProductsDs>()));
    gh.factory<_i8.GetProductsUseCase>(
        () => _i8.GetProductsUseCase(gh<_i6.ProductsRepo>()));
    gh.factory<_i9.ProductsBloc>(() =>
        _i9.ProductsBloc(getProductsUseCase: gh<_i8.GetProductsUseCase>()));
    return this;
  }
}
