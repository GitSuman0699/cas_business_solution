import 'package:cas_business_solutions/features/root_screen/home_tab.dart';
import 'package:cas_business_solutions/features/root_screen/navigation_tab.dart';
import 'package:cas_business_solutions/features/root_screen/notification_tab.dart';
import 'package:cas_business_solutions/features/root_screen/profile_tab.dart';
import 'package:cas_business_solutions/features/root_screen/route_tab.dart';
import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => RootScreenState._();
}

class RootScreenState extends State<RootScreen> {
  RootScreenState._();
  static final RootScreenState instance = RootScreenState._();
  final notificationTapped = ValueNotifier<bool>(false);
  final pageController = PageController(initialPage: 0);
  final currentPageIndex = ValueNotifier<int>(0);
  late final ValueNotifier<List<Widget>> widgetList;

  @override
  void initState() {
    super.initState();
    widgetList = ValueNotifier<List<Widget>>([
      HomeTab(pageController: pageController),
      NavigationTab(pageController: pageController),
      const RouteTab(),
      const ProfileTab(),
    ]);
    pageController.addListener(() {
      if (pageController.page != null) {
        currentPageIndex.value = pageController.page!.round();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
        leading: const SizedBox.shrink(),
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: () {
            notificationTapped.value = !notificationTapped.value;
            final newList = List<Widget>.from(widgetList.value);
            switch (currentPageIndex.value) {
              case 0:
                newList[0] = notificationTapped.value
                    ? const NotificationTab()
                    : HomeTab(pageController: pageController);
                break;
              case 1:
                newList[1] = notificationTapped.value
                    ? const NotificationTab()
                    : NavigationTab(pageController: pageController);
                break;
              case 2:
                newList[2] = notificationTapped.value
                    ? const NotificationTab()
                    : const RouteTab();
                break;
              case 3:
                newList[3] = notificationTapped.value
                    ? const NotificationTab()
                    : const ProfileTab();
                break;
              default:
                break;
            }
            widgetList.value = newList;
          },
          child: ValueListenableBuilder<bool>(
            valueListenable: notificationTapped,
            builder: (context, notificationTapped, _) {
              return SvgPicture.asset(
                notificationTapped
                    ? Assets.assetsImagesNotificationCloseIcon
                    : Assets.assetsImagesNotificationIcon,
              );
            },
          ),
        ),
        actions: [
          Container(
            height: 35,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Center(
              child: Text(
                'SOS',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: TColors.textWhite,
                      fontWeight: FontWeight.w900,
                    ),
              ),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: TColors.primary,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: ValueListenableBuilder<int>(
            valueListenable: currentPageIndex,
            builder: (context, currentPage, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (notificationTapped.value && currentPage != 0) {
                        notificationTapped.value = false;
                        widgetList.value = [
                          HomeTab(pageController: pageController),
                          NavigationTab(pageController: pageController),
                          const RouteTab(),
                          const ProfileTab(),
                        ];
                      }
                      pageController.animateToPage(
                        0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: SvgPicture.asset(
                      currentPage == 0
                          ? Assets.assetsImagesBottomNavHomeActiveIcon
                          : Assets.assetsImagesBottomNavHomeInactiveIcon,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (notificationTapped.value && currentPage != 1) {
                        notificationTapped.value = false;
                        widgetList.value = [
                          HomeTab(pageController: pageController),
                          NavigationTab(pageController: pageController),
                          const RouteTab(),
                          const ProfileTab(),
                        ];
                      }
                      pageController.animateToPage(
                        1,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: SvgPicture.asset(
                      currentPage == 1
                          ? Assets.assetsImagesBottomNavNavigationActiveIcon
                          : Assets.assetsImagesBottomNavNavigationInactiveIcon,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (notificationTapped.value && currentPage != 2) {
                        notificationTapped.value = false;
                        widgetList.value = [
                          HomeTab(pageController: pageController),
                          NavigationTab(pageController: pageController),
                          const RouteTab(),
                          const ProfileTab(),
                        ];
                      }
                      pageController.animateToPage(
                        2,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: SvgPicture.asset(
                      currentPage == 2
                          ? Assets.assetsImagesBottomNavRouteActiveIcon
                          : Assets.assetsImagesBottomNavRouteInactiveIcon,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (notificationTapped.value && currentPage != 3) {
                        notificationTapped.value = false;
                        widgetList.value = [
                          HomeTab(pageController: pageController),
                          NavigationTab(pageController: pageController),
                          const RouteTab(),
                          const ProfileTab(),
                        ];
                      }
                      pageController.animateToPage(
                        3,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: SvgPicture.asset(
                      currentPage == 3
                          ? Assets.assetsImagesBottomNavProfileActiveIcon
                          : Assets.assetsImagesBottomNavProfileInactiveIcon,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
      body: ValueListenableBuilder<List<Widget>>(
        valueListenable: widgetList,
        builder: (context, widgets, _) {
          return PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: widgets,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    currentPageIndex.dispose();
    widgetList.dispose();
    super.dispose();
  }

  void updateWidget(int index, Widget newWidget) {
    final newList = List<Widget>.from(widgetList.value);
    newList[index] = newWidget;
    widgetList.value = newList;
  }
}
