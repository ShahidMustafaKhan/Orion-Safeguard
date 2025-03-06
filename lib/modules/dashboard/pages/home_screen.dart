import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/dashboard/cubits/dashboard_cubit.dart';
import 'package:orion_safeguard/modules/dashboard/widgets/announcement_widget.dart';
import 'package:orion_safeguard/modules/shift_details/pages/ongoing_shift_details_page.dart';
import 'package:orion_safeguard/utils/helper_widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../config/routes/nav_router.dart';
import '../../../constants/app_colors.dart';
import '../../../generated/assets.dart';
import '../../../utils/heights_and_widths.dart';
import '../../screen_layout_widget/base_view_layout.dart';
import '../../screen_layout_widget/custom_see_all_row.dart';
import '../../screen_layout_widget/previous_shift_widget.dart';
import '../../screen_layout_widget/shift_name_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.primaryColor,
            child: SvgPicture.asset(
              Assets.svgCalendarTick,
              color: AppColors.white,
            ),
            onPressed: () {}),
        body: BaseViewLayout(
          pageTitle: 'Welcome back',
          isHome: true,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 15.sp),
            child: Column(
              children: [
                h1,
                const AnnouncementWidget(),
                h2,
                Container(
                    // height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.sp, vertical: 13.sp),
                      child: Column(
                        children: [
                          CustomSeeAllRowWidget(
                            text: 'On Going Shift',
                            firstTextSize: 16.0,
                            secondText: 'Pending',
                            secondTextSize: 12.0,
                            textColor: AppColors.primaryColor,
                            fun: () {
                              NavRouter.push(
                                  context, const OngoingShiftDetailsPage());
                            },
                          ),
                          customDivider(
                            vPadding: 4.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Shift name',
                                      style: AppTextStyles.robotoMedium(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      'Location of the Shift',
                                      style: AppTextStyles.robotoRegular(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    h2,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                          Assets.svgCalender,
                                          height: 16.0,
                                          width: 16.0,
                                        ),
                                        w1,
                                        Text('Nov 8, 18:00 PM',
                                            style: AppTextStyles.robotoRegular(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'Timer',
                                      style: AppTextStyles.robotoMedium(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                    Text(
                                      '2 Hours 33 Min',
                                      textAlign: TextAlign.center,
                                      style: AppTextStyles.robotoMedium(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.black,
                                      ),
                                    ),
                                    Text(
                                      'Remaining',
                                      style: AppTextStyles.robotoMedium(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.grey.shade500,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    )),
                h1,
                CustomSeeAllRowWidget(
                  secondText: 'See all',
                  text: 'Up Coming Shifts',
                  firstTextSize: 16.0,
                  secondTextSize: 12.0,
                  fun: () {
                    context.read<DashboardCubit>().changeNavSelection(1);
                  },
                ),
                h1,
                SizedBox(
                  height: 130,
                  child: ListView.separated(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return UpComingShiftWidget(
                          shiftName: 'Shift name',
                          location: 'Location',
                          date: 'Nov 9, 18:00 PM',
                          onDetailView: () {
                            NavRouter.push(
                                context, const OngoingShiftDetailsPage());
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return w2P5;
                      },
                      itemCount: 12),
                ),
                h1,
                CustomSeeAllRowWidget(
                  firstTextSize: 16.0,
                  secondTextSize: 12.0,
                  secondText: 'See all',
                  text: 'Previous shifts',
                  fun: () {
                    // NavRouter.pushAndRemoveUntil(context,  AllProductsScreen());
                  },
                ),
                h1,
                Container(
                    height: 300,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: SingleChildScrollView(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const PreviousShiftWidget(
                            shiftName: 'Shift name',
                            location: 'Location of the Shift',
                            date: 'Nov 8, 18:00 - 01:00',
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return customDivider(
                            vPadding: 0.0,
                            hPadding: 10.0,
                          );
                        },
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
