// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/network/api_client/api_client.dart' as _i652;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i895.Connectivity>(() => getItModule.createConnectivity());
    gh.singleton<_i361.Dio>(() => getItModule.createDio());
    gh.singleton<_i652.ApiClient>(() => _i652.ApiClient(gh<_i361.Dio>()));
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
