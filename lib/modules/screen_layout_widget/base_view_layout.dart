import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orion_safeguard/constants/app_colors.dart';
import 'package:orion_safeguard/constants/app_text_styles.dart';
import 'package:orion_safeguard/modules/profile/pages/profile_screen.dart';
import 'package:orion_safeguard/ui/widgets/on_click.dart';

import '../../config/routes/nav_router.dart';
import '../../generated/assets.dart';
import '../../utils/heights_and_widths.dart';
import '../dashboard/pages/notification_screen.dart';

class BaseViewLayout extends StatefulWidget {
  const BaseViewLayout(
      {super.key,
      required this.pageTitle,
      required this.child,
      this.isHome = false});

  final String pageTitle;
  final Widget child;
  final bool? isHome;

  @override
  State<BaseViewLayout> createState() => _BaseViewLayoutState();
}

class _BaseViewLayoutState extends State<BaseViewLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                        24.0,
                      ),
                      bottomRight: Radius.circular(
                        24.0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: -40,
                  left: -90,
                  child: SvgPicture.asset(Assets.svgLoop),
                ),
                Positioned(
                  bottom: -70,
                  right: -90,
                  child: SvgPicture.asset(Assets.svgLoop),
                ),
                Positioned(
                  bottom: 15,
                  left: 10,
                  right: 10,
                  child: widget.isHome == false
                      ? AppBar(
                          leading: OnClick(
                            onTap: () {
                              NavRouter.push(
                                context,
                                const ProfileScreen(),
                              );
                            },
                            child: CircleAvatar(
                              radius: 25.0,
                              child: Image.asset(
                                Assets.pngProfilePic,
                              ),
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          iconTheme: const IconThemeData(color: Colors.white),
                          titleTextStyle: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          title: Text(
                            widget.pageTitle,
                          ),
                          actions: [
                            IconButton(
                              onPressed: () {
                                NavRouter.push(
                                    context, const NotificationScreen());
                              },
                              icon: const Icon(
                                Icons.notifications_none_outlined,
                                color: AppColors.white,
                              ),
                            )
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  OnClick(
                                    onTap: () {
                                      NavRouter.push(
                                        context,
                                        const ProfileScreen(),
                                      );
                                    },
                                    child: CircleAvatar(
                                      radius: 27.0,
                                      child: Image.asset(
                                        Assets.pngProfilePic,
                                      ),
                                    ),
                                  ),
                                  w3,
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Welcome back",
                                        style: AppTextStyles.robotoBold(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "John Doe",
                                        style: AppTextStyles.robotoBold(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  NavRouter.push(
                                      context, const NotificationScreen());
                                },
                                icon: const Icon(
                                  Icons.notifications_none_outlined,
                                  color: AppColors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: widget.child,
          )
        ],
      ),
    );
  }
}
