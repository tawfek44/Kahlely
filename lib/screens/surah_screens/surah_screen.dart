import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_snack_bar.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';
import 'package:quran/quran.dart' as quran;

class SurahScreen extends StatefulWidget {
  SurahScreen({
    Key? key,
    required this.surahNumber,
  }) : super(key: key);
  var surahNumber;

  @override
  State<SurahScreen> createState() => _SurahScreenState();
}

class _SurahScreenState extends State<SurahScreen> {
  AudioPlayer myAudioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(
          title: quran.getSurahNameArabic(widget.surahNumber), isLeading: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.separated(
          itemBuilder: (context, index) {
            var verseNumber = index + 1;
            return getSurahItem(verseNumber: verseNumber);
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: quran.getVerseCount(widget.surahNumber),
        ),
      ),
    );
  }

  Widget getSurahItem({required int verseNumber}) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getAyah(ayahNumber: verseNumber),
          SizedBox(
            height: 5.h,
          ),
          getAyahEnglishTranslation(ayahNumber: verseNumber),
          SizedBox(
            height: 5.h,
          ),
          getAudioIcon(ayahNumber: verseNumber),
        ],
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

  Widget getAyahEnglishTranslation({required int ayahNumber}) => AppText(
        text: quran.getVerseTranslation(widget.surahNumber, ayahNumber),
        maxLines: 100,
        textAlign: TextAlign.end,
        color: AppColors.primaryColor,
        fontSize: 17.sp,
      );
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
}
