import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_application_2/domain/core/api_end_points.dart';
import 'package:flutter_application_2/domain/core/failures/main_failures.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/domain/downloads/i_downlods_repo.dart';
import 'package:flutter_application_2/domain/downloads/models/downloads.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IDownlodsRespo)
class DownloadsRepository implements IDownlodsRespo {
  @override
  Future<Either<MainFailures, List<Downloads>>> getDownloadsImages() async {
    // ignore: todo
    // TODO: implement getDownloadsImages

    try {
      final Response response =
          await Dio(BaseOptions()).get(ApiEndPoints.download);
      // log(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<Downloads> downloadsList = [];
         print('responce',);
        for (final raw in response.data) {
          downloadsList.add(Downloads.fromJson(raw as Map<String, dynamic>));
        }
        print(downloadsList);
        return Right(downloadsList);
      } else {
        return const Left(MainFailures.serverFailures());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailures.cliendFailures());
    }
  }
}
