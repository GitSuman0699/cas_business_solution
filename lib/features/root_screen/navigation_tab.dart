import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:cas_business_solutions/utils/widgets/dialog_boxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slide_to_act/slide_to_act.dart';

class NavigationTab extends StatefulWidget {
  final PageController pageController;
  const NavigationTab({super.key, required this.pageController});

  @override
  State<NavigationTab> createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  final controller = NavigationController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: ValueListenableBuilder<bool>(
              valueListenable: controller.routeCompletedNotifier,
              builder: (context, isRouteCompleted, _) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isRouteCompleted,
                      replacement: const MapWidget(),
                      child: const RouteCompleteWidget(),
                    ),
                    SpacerHelper.verticalSpaceSmall(),
                    Visibility(
                      visible: isRouteCompleted,
                      replacement: const ActiveDeliveryCard(),
                      child: RouteCompleteImageUploadWidget(
                        pageController: widget.pageController,
                      ),
                    ),
                    SpacerHelper.verticalSpaceSmall(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class RouteCompleteImageUploadWidget extends StatelessWidget {
  final PageController pageController;
  const RouteCompleteImageUploadWidget({
    super.key,
    required this.pageController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: TColors.primaryLighter,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Arrive in",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  Text(
                    "00:10:30",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  )
                ],
              ),
            ),
            SpacerHelper.verticalSpaceSmall(),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              decoration: BoxDecoration(
                color: TColors.primary.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  label: Text(
                    "Upload Image",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.secondaryYellow,
                        ),
                  ),
                  icon: const Icon(Icons.image_sharp,
                      color: TColors.secondaryYellow),
                ),
              ),
            ),
            SpacerHelper.verticalSpaceSmall(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  pageController.animateToPage(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                  NavigationController().routeCompletedNotifier.value = false;
                },
                child: const Text("Complete"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RouteCompleteWidget extends StatelessWidget {
  const RouteCompleteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SpacerHelper.verticalSpaceExtraLarge(),
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              Assets.assetsImagesAccountConfirmationIcon,
              fit: BoxFit.cover,
            ),
          ),
          SpacerHelper.verticalSpaceExtraLarge(),
          Text(
            "Route Completed",
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: TColors.textWhite,
                  fontWeight: FontWeight.w900,
                ),
          ),
          SpacerHelper.verticalSpaceExtraLarge(),
          SpacerHelper.verticalSpaceExtraLarge(),
          SpacerHelper.verticalSpaceExtraLarge(),
        ],
      ),
    );
  }
}

class NavigationController {
  static final NavigationController _instance =
      NavigationController._internal();
  factory NavigationController() => _instance;
  NavigationController._internal();

  final expandStateNotifier = ValueNotifier<bool>(false);
  final routeCompletedNotifier = ValueNotifier<bool>(false);
}

class MapWidget extends StatefulWidget {
  const MapWidget({super.key});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final controller = NavigationController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: controller.expandStateNotifier,
      builder: (context, isExpanded, _) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          height: isExpanded
              ? MediaQuery.of(context).size.height * 0.13
              : MediaQuery.of(context).size.height * 0.52,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              Assets.assetsImagesNavigationMap,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class ActiveDeliveryCard extends StatelessWidget {
  const ActiveDeliveryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NavigationController();

    return ValueListenableBuilder<bool>(
      valueListenable: controller.expandStateNotifier,
      builder: (context, isExpanded, _) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: TColors.primaryLighter,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 8.0,
                width: 40,
                decoration: BoxDecoration(
                  color: TColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
              SpacerHelper.verticalSpaceMedium(),
              GestureDetector(
                onTap: () {
                  controller.expandStateNotifier.value =
                      !controller.expandStateNotifier.value;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: TColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Delivery XLL",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                    color: TColors.textWhite,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            Text(
                              "Bay #: 15",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                    color: TColors.textWhite.withOpacity(0.5),
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  Assets.assetsImagesHomeIncomingIcon,
                                  width: 40,
                                  height: 40,
                                ),
                                SpacerHelper.horizontalSpaceMedium(),
                                SvgPicture.asset(
                                  Assets.assetsImagesHomeCallIcon,
                                  width: 40,
                                  height: 40,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Image.asset(
                        Assets.assetsImagesHomeRedTruck,
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  controller.expandStateNotifier.value =
                      !controller.expandStateNotifier.value;
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: TColors.primary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LocationRow("09243 Chemnitz", "Pickup Point",
                          controller.expandStateNotifier.value),
                      SpacerHelper.verticalSpaceSmall(),
                      SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                      Visibility(
                        visible: isExpanded,
                        child: SpacerHelper.verticalSpaceSmall(),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: LocationRow("Location Name", "Stop",
                            controller.expandStateNotifier.value),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: SpacerHelper.verticalSpaceSmall(),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: SpacerHelper.verticalSpaceSmall(),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: LocationRow("Location Name", "Stop",
                            controller.expandStateNotifier.value),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: SpacerHelper.verticalSpaceSmall(),
                      ),
                      Visibility(
                        visible: isExpanded,
                        child: SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                      ),
                      SpacerHelper.verticalSpaceSmall(),
                      LocationRow("09243 Frankfurt", "Destination",
                          controller.expandStateNotifier.value),
                    ],
                  ),
                ),
              ),
              SpacerHelper.verticalSpaceSmall(),
              Visibility(
                visible: isExpanded,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: TColors.primary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Arrive in",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.w900,
                                ),
                      ),
                      Text(
                        "00:10:30",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.w900,
                                ),
                      )
                    ],
                  ),
                ),
              ),
              SpacerHelper.verticalSpaceSmall(),
              Row(
                children: [
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      width: 200,
                      child: SlideAction(
                        elevation: 0,
                        height: 55,
                        sliderButtonIcon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: TColors.secondaryYellow,
                          size: 20,
                        ),
                        borderRadius: 8,
                        sliderRotate: false,
                        sliderButtonIconPadding: 8,
                        innerColor: TColors.primaryLighter,
                        outerColor: TColors.primary,
                        text: "            Slide to Complete Route",
                        textStyle:
                            Theme.of(context).textTheme.bodySmall!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: TColors.secondaryYellow,
                                ),
                        onSubmit: () async {
                          controller.routeCompletedNotifier.value = true;
                        },
                      ),
                    ),
                  ),
                  SpacerHelper.horizontalSpaceSmall(),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        DialogBoxes.instance.showAddRecipientDialog(
                          context: context,
                        );
                      },
                      child: Container(
                        width: 55,
                        height: 55,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: TColors.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SvgPicture.asset(
                            Assets.assetsImagesNavigationAddLocationIcon),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class LocationRow extends StatefulWidget {
  final String location;
  final String type;
  final bool isExpanded;

  const LocationRow(this.location, this.type, this.isExpanded, {super.key});

  @override
  State<LocationRow> createState() => _LocationRowState();
}

class _LocationRowState extends State<LocationRow> {
  final controller = NavigationController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            widget.type == "Pickup Point"
                ? SvgPicture.asset(Assets.assetsImagesHomeInitialPointIcon)
                : widget.type == "Stop"
                    ? SvgPicture.asset(Assets.assetsImagesNavigationPauseIcon)
                    : SvgPicture.asset(Assets.assetsImagesHomeLocationPinIcon),
            SpacerHelper.horizontalSpaceSmall(),
            Text(
              widget.location,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: TColors.textWhite,
                  ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.type,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: TColors.textWhite.withOpacity(0.5),
                  ),
            ),
            SpacerHelper.horizontalSpaceSmall(),
            ValueListenableBuilder<bool>(
              valueListenable: controller.expandStateNotifier,
              builder: (context, isExpanded, _) {
                return Visibility(
                  visible: isExpanded,
                  child:
                      SvgPicture.asset(Assets.assetsImagesNavigationThreeDots),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
