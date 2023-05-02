import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/bloc/hadith_info_cubit/hadith_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/data/repositories/hadith_repository.dart';
import 'package:khalely/di/injection.dart';
import 'package:khalely/shared_wigets/app_text.dart';

import '../../data/models/hadith_model/hadith_model.dart';
import '../../shared_wigets/app_circular_indicator.dart';

class HadithScreen extends StatefulWidget {
  HadithScreen({Key? key, required this.hadithTellerData}) : super(key: key);
  var hadithTellerData;

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  bool isFirstLoad = true;
  bool hasNextPage = false;
  bool isLoadingMoreRunning = false;
  List<HadithDataModel> hadithData = [];
  final scrollController = ScrollController();
  int numberOfPages = 0;
  int page = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListener);
    firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          getAppBar(title: widget.hadithTellerData['name'], isLeading: true),
      body: BlocBuilder<HadithCubit, HadithState>(
        builder: (context, state) {
          if (state is LoadingHadith) {
            return const Center(child: AppCircularProgressIndicator());
          } else if (state is LoadedHadith) {
            numberOfPages = state.hadithDataInfo.pagination.totalPages;
            hadithData.addAll(state.hadithDataInfo.hadithInfo);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Scrollbar(
                child: ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) => Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: AppText(
                        text: hadithData[index].hadithText,
                        maxLines: 1000,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                  itemCount: hadithData.length,
                ),
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
      ),
    );
  }

  void loadMore() {
    if (page <= numberOfPages) {
      if (page < numberOfPages) {
        setState(() {
          page = page + 1;
          getIt<HadithRepository>()
              .getHadithInfo(
                  name: widget.hadithTellerData['slug'], page: page, limit: 20)
              .then((value) {
            hadithData.addAll(value.hadithInfo);
          });
        });
      }
    }
  }

  void firstLoad() {
    context.read<HadithCubit>().getHadithInfo(
        name: widget.hadithTellerData['slug'], page: page, limit: 20);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      loadMore();
    }
  }
}
