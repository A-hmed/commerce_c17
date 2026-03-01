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

import '../../features/auth/data/repositories/auth_repo/auth_repo_impl.dart'
    as _i771;
import '../../features/auth/data/repositories/auth_repo/data_sources/auth_remote_data_source.dart'
    as _i747;
import '../../features/auth/data/repositories/auth_repo/data_sources/auth_remote_data_source_impl.dart'
    as _i539;
import '../../features/auth/domain/repositories/auth_repo.dart' as _i723;
import '../../features/auth/domain/usecase/login_usecase.dart' as _i911;
import '../../features/auth/domain/usecase/regsiter_usecase.dart' as _i602;
import '../../features/auth/ui/screens/login/cubit/login_cubit.dart' as _i413;
import '../../features/network/api_client/api_client.dart' as _i652;
import '../utils/shared_prefs_utils.dart' as _i652;
import 'get_it_module.dart' as _i1015;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.factory<_i652.SharedPrefsUtils>(() => _i652.SharedPrefsUtils());
    gh.singleton<_i895.Connectivity>(() => getItModule.createConnectivity());
    gh.singleton<_i361.Dio>(() => getItModule.createDio());
    gh.singleton<_i652.ApiClient>(() => _i652.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i747.AuthRemoteDataSource>(
      () => _i539.AuthRemoteDataSourceImpl(
        gh<_i652.ApiClient>(),
        gh<_i652.SharedPrefsUtils>(),
      ),
    );
    gh.factory<_i723.AuthRepo>(
      () => _i771.AuthRepoImpl(
        gh<_i747.AuthRemoteDataSource>(),
        gh<_i895.Connectivity>(),
      ),
    );
    gh.factory<_i911.LoginUsecase>(
      () => _i911.LoginUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i602.RegisterUsecase>(
      () => _i602.RegisterUsecase(gh<_i723.AuthRepo>()),
    );
    gh.factory<_i413.LoginCubit>(
      () => _i413.LoginCubit(gh<_i911.LoginUsecase>()),
    );
    return this;
  }
}

class _$GetItModule extends _i1015.GetItModule {}
