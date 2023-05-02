import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:khalely/data/models/hadith_model/hadith_model.dart';
import 'package:khalely/data/repositories/hadith_repository.dart';
part 'hadith_state.dart';
part 'hadith_cubit.freezed.dart';

@injectable
class HadithCubit extends Cubit<HadithState> {
  HadithCubit(this._hadithRepository) : super(const HadithState.initial());

  final HadithRepository _hadithRepository;

  Future<void> getHadithInfo(
      {required String name,
      required int page,
      required int limit,
      bool loadMore = false}) async {
    try {
      emit(const HadithState.loading());
      final hadithTellerNames = await _hadithRepository.getHadithInfo(
          name: name, page: page, limit: limit);
      emit(HadithState.loaded(hadithTellerNames));
    } catch (e) {
      emit(HadithState.error(e));
    }
  }
}
