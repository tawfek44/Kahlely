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

class SleepAzkarScreen extends StatefulWidget {
  const SleepAzkarScreen({Key? key}) : super(key: key);

  @override
  State<SleepAzkarScreen> createState() => _SleepAzkar();
}

class _SleepAzkar extends State<SleepAzkarScreen> {
  AudioPlayer myAudioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    context.read<AzkarCubit>().getSleepAzkar(id: 28);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(title: 'أذكار النوم', isLeading: true),
      body: BlocBuilder<AzkarCubit, AzkarState>(
        builder: (context, state) {
          if (state is LoadingSleepAzkar) {
            return const Center(
              child: AppCircularProgressIndicator(),
            );
          } else if (state is LoadedSleepAzkar) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: ListView.builder(
                itemCount: state.azkarModel.sleepAzkar.length,
                itemBuilder: (context, index) {
                  return getAzkarItem(
                      azkar: state.azkarModel.sleepAzkar, index: index);
                },
              ),
            );
          } else {
            return Center(
              child: AppText(
                text: 'نأسف لا نستطيع خدمتك أخى العزيز  حاول مرة أخرى',
              ),
            );
          }
        },
      ),
    );
  }

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
      );

  Widget getAzkarRepeatCountText({required String azkarCountText}) => AppText(
        text: azkarCountText,
        color: AppColors.primaryColor,
      );

  Widget getAudioPlayerStopWidget() => CircleAvatar(
        radius: 18.w,
        backgroundColor: AppColors.errorColor,
        child: Center(
          child: IconButton(
            iconSize: 18.w,
            onPressed: () {
              myAudioPlayer.stop();
            },
            icon: const Center(
              child: Icon(
                CupertinoIcons.speaker_slash,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
  Widget getAudioPlayerPlayWidget({required String azkarAudioUrl}) =>
      CircleAvatar(
        radius: 18.w,
        backgroundColor: AppColors.primaryColor,
        child: Center(
          child: IconButton(
            iconSize: 18.w,
            onPressed: () {
              String url = azkarAudioUrl;
              print(url);
              myAudioPlayer.stop();
              myAudioPlayer.setAudioSource(AudioSource.uri(Uri.parse(url)));
              myAudioPlayer.play();
            },
            icon: const Center(
              child: Icon(
                CupertinoIcons.speaker_2,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    myAudioPlayer.dispose();
  }
}
