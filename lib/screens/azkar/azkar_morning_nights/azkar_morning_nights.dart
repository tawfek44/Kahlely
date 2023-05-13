import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:khalely/bloc/azkar_cubit/azkar_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_circular_indicator.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';

import '../../../data/models/azkar_model/azkar_model.dart';

class AzkarMorningAndNight extends StatefulWidget {
  const AzkarMorningAndNight({Key? key}) : super(key: key);

  @override
  State<AzkarMorningAndNight> createState() => _AzkarMorningAndNightState();
}

class _AzkarMorningAndNightState extends State<AzkarMorningAndNight> {
  @override
  void initState() {
    super.initState();
    context.read<AzkarCubit>().getAzkar(id: 27);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'أذكار الصباح والمساء', isLeading: true),
      body: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is LoadingAzkar) {
            return getLoadingWidget();
          } else if (state is LoadedAzkar) {
            return getAzkarScreen(state: state);
          } else {
            return getErrorWidget();
          }
        },
      ),
    );
  }

  Widget getLoadingWidget() => const Center(
        child: AppCircularProgressIndicator(),
      );

  Widget getAzkarScreen({required state}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: getAzkarListView(state: state),
      );

  Widget getAzkarListView({required state}) => ListView.builder(
        itemCount: state.azkarModel.morningAndNightAzkar.length,
        itemBuilder: (context, index) {
          return getAzkarItem(
              azkar: state.azkarModel.morningAndNightAzkar, index: index);
        },
      );
  Widget getAzkarItem(
      {required List<MorningAndNightAzkar> azkar, required int index}) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, right: 18.w, bottom: 10.h, left: 10.w),
        child: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getAzkarText(azkarText: azkar[index].azkarText),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    AppText(
                      text: 'عدد مرات التكرار: ',
                      color: AppColors.primaryColor,
                      fontSize: 16.sp,
                    ),
                    getAzkarRepeatCountText(
                        azkarCountText: azkar[index].repeatCount.toString()),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getAzkarText({required String azkarText}) => AppText(
        text: azkarText,
        maxLines: 100,
        fontSize: 18.sp,
      );

  Widget getAzkarRepeatCountText({required String azkarCountText}) => AppText(
        text: azkarCountText,
        color: AppColors.primaryColor,
      );
}
