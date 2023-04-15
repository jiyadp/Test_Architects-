import 'dart:developer';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_application_2/domain/core/failures/main_failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import '../../domain/downloads/i_downlods_repo.dart';
import '../../domain/downloads/models/downloads.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'downloads_event.dart';
part 'downloads_state.dart';

part 'downloads_bloc.freezed.dart';

@injectable
class DownloadsBloc extends Bloc<DownloadsEvent, DownloadsState> {
  final IDownlodsRespo _downloadsRepo;

  DownloadsBloc(this._downloadsRepo) : super(DownloadsState.initial()) {
    on<_GetDownloadsImages>((event, emit) async {
      emit(state.copyWith(
          isLoading: true, downloadsFailursofSuccessOption: none()));
      final Either<MainFailures, List<Downloads>> downloadsOption =
          await _downloadsRepo.getDownloadsImages();
          print('data.....');
       log(downloadsOption.toString());
                print('data  1.....');

      emit(downloadsOption.fold(
          (failer) => state.copyWith(
              isLoading: false,
              downloadsFailursofSuccessOption: some(Left(failer))),
          (success) => state.copyWith(
              isLoading: false,
              downloadsFailursofSuccessOption: Some(Right(success)))));
    });
  }
}
