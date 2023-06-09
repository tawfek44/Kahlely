import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:khalely/bloc/prayer_timinigs_cubit/prayer_timinigs_cubit.dart';
import 'package:khalely/constants.dart';
import 'package:khalely/shared_wigets/app_text.dart';
import 'package:khalely/styles/colors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/services.dart';
import '../../shared_wigets/app_circular_indicator.dart';
import '../../shared_wigets/app_snack_bar.dart';

class PrayerTimingsScreen extends StatefulWidget {
  PrayerTimingsScreen({Key? key}) : super(key: key);
  String? country, city;

  @override
  State<PrayerTimingsScreen> createState() => _PrayerTimingsScreenState();
}

class _PrayerTimingsScreenState extends State<PrayerTimingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: getAppBar(title: 'مواقيت الصلاة', isLeading: true),
      body: BlocBuilder<PrayerTimingsCubit, PrayerTimingsState>(
        builder: (context, state) {
          if (state is LoadedPrayerTimings) {
            var stateObject =
                state.playerTimingsModel.playerTimingsDataModel.timings;
            List<String> prayerTimingsFromAPI = [
              stateObject.fajr,
              stateObject.dhuhr,
              stateObject.asr,
              stateObject.maghrib,
              stateObject.isha
            ];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(
                  color: AppColors.lightGrey,
                ),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      getPrayerTimingsIcons(icon: prayerTimingsIcons[index]),
                      SizedBox(
                        width: 10.w,
                      ),
                      getPrayerTimingsDataInfo(
                          prayerTimingsName: prayerTimingsNames[index],
                          prayerTimingsFromAPI: prayerTimingsFromAPI[index]),
                    ],
                  );
                },
              ),
            );
          } else if (state is LoadingPrayerTimings) {
            return const Center(child: AppCircularProgressIndicator());
          } else {
            return getErrorWidget();
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getAddress();
    context.read<PrayerTimingsCubit>().getPrayerTimings(
          date: DateTime.now().toString(),
          city: widget.city ?? 'cairo',
          country: widget.country ?? 'EG',
        );
  }

  Widget getPrayerTimingsIcons({required String icon}) => SizedBox(
        width: 40.w,
        child: Image.asset('assets/$icon'),
      );
  Widget getPrayerTimingsDataInfo(
          {required String prayerTimingsName,
          required String prayerTimingsFromAPI}) =>
      Column(
        children: [
          AppText(
            text: prayerTimingsName,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 5.h,
          ),
          AppText(
            text: prayerTimingsFromAPI,
            fontSize: 15.sp,
          ),
        ],
      );

  Future<Position> getCurrentLocation(context) async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('خدمات الموقع غير مفعًلة');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        SnackBar snackBar = AppSnackBar(
          text: 'خدمات الموقع تم رفضها',
          isSuccess: false,
        ) as SnackBar;
        return ScaffoldMessenger.of(context).showSnackBar(snackBar) as Position;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'خدمات الموقع تم رفضها نهائيا ونحن لا نستطيع طلبها مرة أخرى');
    }

    return await Geolocator.getCurrentPosition();
  }

  void getAddress() async {
    getCurrentLocation(context).then((position) {
      getAddressFromLatLng(position);
    });
  }

  Future<void> getAddressFromLatLng(Position position) async {
    placemarkFromCoordinates(position.latitude, position.longitude)
        .then((value) {
      setState(() {
        widget.country = value[0].country;
        widget.city = value[0].administrativeArea;
      });
    });
  }

  Future<bool> checkLocationServiceEnabled() {
    var isLocationServiceEnabled =
        Permission.locationWhenInUse.serviceStatus.isEnabled;
    return isLocationServiceEnabled;
  }
}
