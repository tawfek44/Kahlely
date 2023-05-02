import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/app_routes/app_routes.dart';
import 'package:khalely/bloc/hadith_cubit/hadith_tellers_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_text.dart';

import '../../app_routes/app_routes_names.dart';
import '../../shared_wigets/app_circular_indicator.dart';

class HadithTellerNamesScreen extends StatefulWidget {
  const HadithTellerNamesScreen({Key? key}) : super(key: key);

  @override
  State<HadithTellerNamesScreen> createState() =>
      _HadithTellerNamesScreenState();
}

class _HadithTellerNamesScreenState extends State<HadithTellerNamesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HadithTellerNamesCubit>().getHadithTellerNames();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> hadithTellersNames = [
      'الإمام أبو داوود',
      'الإمام أحمد إبن حنبل',
      'الإمام البخارى',
      'الإمام الدارمى',
      'الإمام أبو ماجه',
      'الإمام مالك',
      'الإمام مسلم',
      'الإمام النسائي',
      'الإمام الترمزى'
    ];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: getAppBar(title: 'الأئمة', isLeading: true),
        body: BlocBuilder<HadithTellerNamesCubit, HadithTellersState>(
          builder: (context, state) {
            if (state is LoadingHadithTellerNames) {
              return const Center(child: AppCircularProgressIndicator());
            } else if (state is LoadedHadithTellerNames) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: ListView.separated(
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      NamedNavigatorImpl()
                          .push(Routes.HadithScreenRoute, arguments: {
                        'slug': state.hadithTellerNames[index].hadithTellerSlug,
                        'name': hadithTellersNames[index]
                      });
                    },
                    child: Row(
                      children: [
                        AppText(
                          text: hadithTellersNames[index],
                          fontSize: 20.sp,
                        )
                      ],
                    ),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.hadithTellerNames.length,
                ),
              );
            } else {
              return Center(
                child: AppText(
                  text:
                      'نأسف لحدوث هذا الخطأ يرجى التأكد من جودة الإنترنت والمحاولة مرة أخرى',
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ));
  }
}
