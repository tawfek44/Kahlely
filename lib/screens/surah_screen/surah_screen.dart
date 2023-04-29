import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:just_audio/just_audio.dart';
import 'package:khalely/constants.dart';
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
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                    text: quran.getVerse(widget.surahNumber, verseNumber,
                        verseEndSymbol: true)),
                SizedBox(
                  height: 5.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 15.w,
                      backgroundColor: AppColors.primaryColor,
                      child: IconButton(
                        onPressed: () {
                          String url = quran.getAudioURLByVerse(
                              widget.surahNumber, verseNumber);
                          myAudioPlayer.stop();
                          myAudioPlayer
                              .setAudioSource(AudioSource.uri(Uri.parse(url)));
                          myAudioPlayer.play();
                        },
                        icon: Icon(
                          CupertinoIcons.play_arrow_solid,
                          color: Colors.white,
                          size: 15.w,
                        ),
                      ),
                    )
                  ],
                )
              ],
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: quran.getVerseCount(widget.surahNumber),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    myAudioPlayer.dispose();
  }
}
