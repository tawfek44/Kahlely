import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khalely/styles/colors.dart';

class AppScrollBar extends StatefulWidget {
  final BoxScrollView Function(ScrollController controller) builder;
  const AppScrollBar({Key? key, required this.builder}) : super(key: key);

  @override
  State<AppScrollBar> createState() => _AppScrollBarState();
}

class _AppScrollBarState extends State<AppScrollBar> {
  late ScrollController scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: DraggableScrollbar(
        controller: scrollController,
        backgroundColor: AppColors.primaryColor,
        padding: EdgeInsets.only(right: 5.w),
        scrollbarTimeToFade: const Duration(seconds: 1),
        scrollThumbBuilder: scrollThumbBuilder,
        heightScrollThumb: 200.h,
        child: widget.builder(scrollController),
      ),
    );
  }

  Widget scrollThumbBuilder(
          Color backgroundColor,
          Animation<double> thumbAnimation,
          Animation<double> labelAnimation,
          double height,
          {Text? labelText,
          BoxConstraints? labelConstraints}) =>
      FadeTransition(
        opacity: thumbAnimation,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            gradient: LinearGradient(
                colors: [AppColors.primaryColor, AppColors.secondlyColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          height: height,
          width: 8.w,
        ),
      );
}
