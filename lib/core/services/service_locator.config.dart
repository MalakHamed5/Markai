// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:ecommerse/core/api/api_consumer.dart' as _i915;
import 'package:ecommerse/core/api/dio_consumer.dart' as _i1059;
import 'package:ecommerse/core/cache/cache_helper.dart' as _i454;
import 'package:ecommerse/core/services/secure_token_store.dart' as _i753;
import 'package:ecommerse/core/services/service_locator.dart' as _i428;
import 'package:ecommerse/core/theme/cubit/theme_cubit.dart' as _i888;
import 'package:ecommerse/features/auth/data/datasources/auth_local_datasources.dart'
    as _i749;
import 'package:ecommerse/features/auth/data/datasources/auth_remote_datasources.dart'
    as _i856;
import 'package:ecommerse/features/auth/data/repositories/auth_repo.dart'
    as _i619;
import 'package:ecommerse/features/auth/presentation/bloc/auth/auth_bloc.dart'
    as _i60;
import 'package:ecommerse/features/favorites/data/datasource/favorite_data_source.dart'
    as _i502;
import 'package:ecommerse/features/favorites/data/repository/favorite_repo.dart'
    as _i920;
import 'package:ecommerse/features/favorites/presentation/favorite/favorite_bloc.dart'
    as _i624;
import 'package:ecommerse/features/home/data/data_source/product_data_source.dart'
    as _i404;
import 'package:ecommerse/features/home/data/repositories/product_repository.dart'
    as _i673;
import 'package:ecommerse/features/home/presentation/bloc/brand/brand_bloc.dart'
    as _i135;
import 'package:ecommerse/features/home/presentation/bloc/catagory/catagory_bloc.dart'
    as _i124;
import 'package:ecommerse/features/home/presentation/bloc/product/product_bloc.dart'
    as _i676;
import 'package:ecommerse/features/home/presentation/bloc/product_details/product_details_bloc.dart'
    as _i462;
import 'package:ecommerse/features/profile/data/datasource/profile_remote_data_source.dart'
    as _i429;
import 'package:ecommerse/features/profile/data/repositories/profile_repo.dart'
    as _i432;
import 'package:ecommerse/features/profile/presentation/profile/profile_bloc.dart'
    as _i858;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appServices = _$AppServices();
    gh.factory<_i888.ThemeCubit>(() => _i888.ThemeCubit());
    gh.lazySingleton<_i361.Dio>(() => appServices.dio);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => appServices.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i558.FlutterSecureStorage>(
        () => appServices.flutterSecureStorage);
    gh.lazySingleton<_i915.ApiConsumer>(
        () => _i1059.DioConsumer(dio: gh<_i361.Dio>()));
    gh.lazySingleton<_i749.AuthLocalDataSource>(
        () => _i749.AuthLocalDataSourceImpl());
    gh.lazySingleton<_i753.SecureTokenStore>(() =>
        _i753.SecureTokenStore(storage: gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i454.CacheHelper>(
        () => _i454.CacheHelper(sharedPref: gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i429.ProfileRemoteDataSource>(
        () => _i429.ProfileRemoteDataSourceImpl(api: gh<_i915.ApiConsumer>()));
    gh.lazySingleton<_i404.ProductDataSource>(
        () => _i404.ProductDataSourceImpl(api: gh<_i915.ApiConsumer>()));
    gh.lazySingleton<_i673.ProdcutRepository>(() => _i673.ProductRepositoryImpl(
        productDataSource: gh<_i404.ProductDataSource>()));
    gh.lazySingleton<_i502.FavoriteDataSource>(() =>
        _i502.FavoriteDataSourceImpl(apiConsumer: gh<_i915.ApiConsumer>()));
    gh.lazySingleton<_i920.FavoriteRepo>(() => _i920.FavoriteRepoImpl(
        favoriteDataSource: gh<_i502.FavoriteDataSource>()));
    gh.lazySingleton<_i856.AuthRemoteDataSource>(
        () => _i856.AuthRemoteDataSourceImpl(api: gh<_i915.ApiConsumer>()));
    gh.lazySingleton<_i619.AuthRepo>(() => _i619.AuthRepoImpl(
          remote: gh<_i856.AuthRemoteDataSource>(),
          local: gh<_i749.AuthLocalDataSource>(),
        ));
    gh.factory<_i624.FavoriteBloc>(
        () => _i624.FavoriteBloc(repo: gh<_i920.FavoriteRepo>()));
    gh.lazySingleton<_i432.ProfileRepo>(() =>
        _i432.ProfileRepoImpl(remote: gh<_i429.ProfileRemoteDataSource>()));
    gh.factory<_i676.ProductCubit>(
        () => _i676.ProductCubit(repo: gh<_i673.ProdcutRepository>()));
    gh.factory<_i462.ProductDetailsCubit>(
        () => _i462.ProductDetailsCubit(repo: gh<_i673.ProdcutRepository>()));
    gh.factory<_i124.CatagoryBloc>(() =>
        _i124.CatagoryBloc(prodcutRepository: gh<_i673.ProdcutRepository>()));
    gh.factory<_i135.BrandBloc>(() =>
        _i135.BrandBloc(productRepository: gh<_i673.ProdcutRepository>()));
    gh.factory<_i60.AuthBloc>(() => _i60.AuthBloc(repo: gh<_i619.AuthRepo>()));
    gh.factory<_i858.ProfileBloc>(
        () => _i858.ProfileBloc(profileRepo: gh<_i432.ProfileRepo>()));
    return this;
  }
}

class _$AppServices extends _i428.AppServices {}
