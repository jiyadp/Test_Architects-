// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter_application_2/application/downloads/downloads_bloc.dart'
    as _i5;
import 'package:flutter_application_2/domain/downloads/i_downlods_repo.dart'
    as _i3;
import 'package:flutter_application_2/infrastructure/downloads/downloads_repository.dart'
    as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.IDownlodsRespo>(() => _i4.DownloadsRepository());
  gh.factory<_i5.DownloadsBloc>(
      () => _i5.DownloadsBloc(gh<_i3.IDownlodsRespo>()));
  return getIt;
}
