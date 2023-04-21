import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:khalely/data/repositories/hadith_teller_repository.dart';

import '../../data/models/azkar_model/azkar_model.dart';
import '../../data/models/hadith_tellers_model/hadith_tellers_model.dart';
import '../../data/repositories/azkarRepository.dart';

part 'hadith_tellers_state.dart';
part 'hadith_tellers_cubit.freezed.dart';

@injectable
class HadithTellerNamesCubit extends Cubit<HadithTellersState> {
  HadithTellerNamesCubit(this._hadithTellerRepository)
      : super(const HadithTellersState.initial());

  final HadithTellerRepository _hadithTellerRepository;

  Future<void> getHadithTellerNames() async {
    try {
      emit(const HadithTellersState.loading());
      final hadithTellerNames = await _hadithTellerRepository.getHadithTellerNames();
      emit(HadithTellersState.loaded(hadithTellerNames));
    } catch (e) {
      emit(HadithTellersState.error(e));
    }
  }


}
