import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/app_routes/app_routes.dart';
import 'package:khalely/app_routes/app_routes_names.dart';
import 'package:khalely/bloc/quran_surah_names_cubit/quran_surah_names_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_circular_indicator.dart';
import 'package:khalely/shared_wigets/app_scroll_bar.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';
import 'package:quran/quran.dart' as quran;
import 'package:quran/quran.dart';

class SurahTranslationNamesScreen extends StatefulWidget {
  const SurahTranslationNamesScreen({Key? key}) : super(key: key);

  @override
  State<SurahTranslationNamesScreen> createState() =>
      _SurahTranslationNamesScreenState();
}

class _SurahTranslationNamesScreenState
    extends State<SurahTranslationNamesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<QuranSurahNamesCubit>().getQuranSurahNames();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: 'تفسير القرآن الكريم', isLeading: true),
      body: BlocBuilder<QuranSurahNamesCubit, QuranSurahNamesState>(
        builder: (context, state) {
          if (state is LoadingQuranSurahNames) {
            return const Center(
              child: AppCircularProgressIndicator(),
            );
          } else if (state is LoadedQuranSurahNames) {
            return AppScrollBar(
              builder: (controller) => ListView.separated(
                controller: controller,
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      NamedNavigatorImpl().push(
                          Routes.SurahTranslationScreenRoute,
                          arguments: state.quranSurahNamesModel
                              .quranSurahNamesData[index].number);
                    },
                    child: getSurahNameItem(
                        surahNumber: state.quranSurahNamesModel
                            .quranSurahNamesData[index].number,
                        surahName: quran.getSurahNameArabic(state
                            .quranSurahNamesModel
                            .quranSurahNamesData[index]
                            .number),
                        surahEnglishName: state.quranSurahNamesModel
                            .quranSurahNamesData[index].surahEnglishName,
                        surahNumberOfAyahs: state.quranSurahNamesModel
                            .quranSurahNamesData[index].numberOfAyahs,
                        surahRevelationType: state.quranSurahNamesModel
                            .quranSurahNamesData[index].revelationType),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount:
                    state.quranSurahNamesModel.quranSurahNamesData.length,
              ),
            );
          } else {
            return getErrorWidget();
          }
        },
      ),
    );
  }

  Widget getSurahNameItem({
    required int surahNumber,
    required String surahName,
    required String surahEnglishName,
    required String surahRevelationType,
    required int surahNumberOfAyahs,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          children: [
            AppText(
              text: getVerseEndSymbol(surahNumber),
              fontSize: 20.sp,
            ),
            SizedBox(
              width: 4.w,
            ),
            AppText(
              text: surahName,
              color: AppColors.primaryColor,
              fontSize: 20.sp,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                AppText(
                  text: surahEnglishName,
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
                AppText(
                  text: '$surahRevelationType - $surahNumberOfAyahs verses',
                  color: AppColors.darkGrey,
                  fontSize: 12.sp,
                )
              ],
            )
          ],
        ),
      );
}
