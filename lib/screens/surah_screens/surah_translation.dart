import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:khalely/bloc/surah_translation_cubit/surah_translation_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_snack_bar.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';

import '../../shared_wigets/app_circular_indicator.dart';

class SurahTranslationScreen extends StatefulWidget {
  SurahTranslationScreen({
    Key? key,
    required this.surahNumber,
  }) : super(key: key);
  var surahNumber;

  @override
  State<SurahTranslationScreen> createState() => _SurahTranslationScreenState();
}

class _SurahTranslationScreenState extends State<SurahTranslationScreen> {
  AudioPlayer myAudioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: quran.getSurahNameArabic(widget.surahNumber), isLeading: true),
      body: BlocBuilder<SurahTranslationCubit, SurahTranslationState>(
        builder: (context, state) {
          if (state is LoadingSurahTranslation) {
            return const Center(
              child: AppCircularProgressIndicator(),
            );
          } else if (state is LoadedSurahTranslation) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView.separated(
                itemBuilder: (context, index) {
                  var verseNumber = index + 1;
                  return getSurahItem(
                      verseNumber: verseNumber, state: state, index: index);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: quran.getVerseCount(widget.surahNumber),
              ),
            );
          } else {
            return Center(
              child: AppText(
                  text:
                      'نأسف لحدوث هذا الخطأ يرجى التأكد من جودة الإنترنت والمحاولة مرة أخرى'),
            );
          }
        },
      ),
    );
  }

  Widget getSurahItem(
          {required int verseNumber, required var state, required int index}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getAyah(ayahNumber: verseNumber),
          SizedBox(
            height: 5.h,
          ),
          getAyahTranslation(
              ayahTranslation: state.surahTranslationModel
                  .surahTranslationDataModel[index].ayaTranslationInArabic),
          SizedBox(
            height: 5.h,
          ),
          getAudioIcon(ayahNumber: verseNumber)
        ],
      );
  Widget getAyahTranslation({required ayahTranslation}) => AppText(
        text: ayahTranslation,
        maxLines: 100,
        color: AppColors.primaryColor,
        fontSize: 17.sp,
      );
  Widget getAudioIcon({required int ayahNumber}) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CircleAvatar(
            radius: 15.w,
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              onPressed: () {
                playAudio(ayahNumber: ayahNumber);
              },
              icon: Icon(
                CupertinoIcons.play_arrow_solid,
                color: Colors.white,
                size: 15.w,
              ),
            ),
          )
        ],
      );
  void playAudio({required int ayahNumber}) {
    String url = quran.getAudioURLByVerse(widget.surahNumber, ayahNumber);
    myAudioPlayer.stop();
    myAudioPlayer.setAudioSource(AudioSource.uri(Uri.parse(url)));
    myAudioPlayer.play();
  }

  Widget getAyah({required int ayahNumber}) => AppText(
        text: quran.getVerse(widget.surahNumber, ayahNumber,
            verseEndSymbol: true),
        maxLines: 100,
        fontSize: 20.sp,
      );
  @override
  void dispose() {
    super.dispose();
    myAudioPlayer.dispose();
  }

  @override
  void initState() {
    super.initState();
    context
        .read<SurahTranslationCubit>()
        .getSurahTranslation(surahID: widget.surahNumber);
  }
}
