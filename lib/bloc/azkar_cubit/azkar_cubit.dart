import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/azkar_model/azkar_model.dart';
import '../../data/repositories/azkarRepository.dart';

part 'azkar_state.dart';
part 'azkar_cubit.freezed.dart';

@injectable
class AzkarCubit extends Cubit<AzkarState> {
  AzkarCubit(this._azkarRepository) : super(const AzkarState.initial());

  final AzkarRepository _azkarRepository;

  Future<void> getAzkar({required int id}) async {
    try {
      emit(const AzkarState.loading());
      final azkar = await _azkarRepository.getAzkar(id: id);
      emit(AzkarState.loaded(azkar));
    } catch (e) {
      emit(AzkarState.error(e));
    }
  }

  Future<void> getSleepAzkar({required int id}) async {
    try {
      emit(const AzkarState.loadingSleepAzkar());
      final azkar = await _azkarRepository.getSleepAzkar(id: id);
      print(azkar);
      emit(AzkarState.loadedSleepAzkar(azkar));
    } catch (e) {
      print('eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee$e');
      emit(AzkarState.errorSleepAzkar(e));
    }
  }
}
