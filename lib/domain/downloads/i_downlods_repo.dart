import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/domain/core/failures/main_failures.dart';
import 'package:flutter_application_2/domain/downloads/models/downloads.dart';

abstract class IDownlodsRespo{
  Future<Either<MainFailures,List<Downloads>>> getDownloadsImages();
}