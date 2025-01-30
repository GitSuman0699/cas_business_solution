import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeTab extends StatelessWidget {
  final PageController pageController;
  const HomeTab({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TripCountWidget(),
                SpacerHelper.verticalSpaceSmall(),
                ActiveDeliveryCard(pageController: pageController),
                SpacerHelper.verticalSpaceSmall(),
                UpcomingTripsCard(pageController: pageController),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TripCountWidget extends StatelessWidget {
  const TripCountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: TColors.primaryLighter,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Upcoming trips: "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("12",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
        SpacerHelper.horizontalSpaceSmall(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: TColors.primaryLighter,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Completed trips: "),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("24",
                        style: Theme.of(context).textTheme.headlineMedium),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ActiveDeliveryCard extends StatelessWidget {
  final PageController pageController;
  const ActiveDeliveryCard({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: TColors.primaryLighter,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Active Delivery",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: TColors.textWhite,
                    ),
              ),
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut);
                },
                child: Row(
                  children: [
                    Text(
                      "Track ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: TColors.secondaryYellow,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: TColors.secondaryYellow,
                      size: 14,
                    )
                  ],
                ),
              )
            ],
          ),
          SpacerHelper.verticalSpaceMedium(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: TColors.textWhite,
                              fontWeight: FontWeight.w900,
                            ),
                      ),
                      Text(
                        "Bay #: 15",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
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
          SpacerHelper.verticalSpaceSmall(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: TColors.primary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const LocationRow("09243 Chemnitz", "Pickup Point"),
                SpacerHelper.verticalSpaceSmall(),
                SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                SpacerHelper.verticalSpaceSmall(),
                const LocationRow("09243 Frankfurt", "Destination"),
              ],
            ),
          ),
          SpacerHelper.verticalSpaceSmall(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: TColors.primary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Arrive in",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: TColors.textWhite,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Text(
                  "00:10:30",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: TColors.textWhite,
                        fontWeight: FontWeight.w900,
                      ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LocationRow extends StatelessWidget {
  final String location;
  final String type;

  const LocationRow(this.location, this.type, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            type == "Pickup Point"
                ? SvgPicture.asset(Assets.assetsImagesHomeInitialPointIcon)
                : SvgPicture.asset(Assets.assetsImagesHomeLocationPinIcon),
            const SizedBox(width: 8),
            Text(
              location,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: TColors.textWhite,
                  ),
            ),
          ],
        ),
        Text(
          type,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: TColors.textWhite.withOpacity(0.5),
              ),
        )
      ],
    );
  }
}

class UpcomingTripsCard extends StatelessWidget {
  final PageController pageController;
  const UpcomingTripsCard({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF064055),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              pageController.jumpToPage(2);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Upcoming Trips",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.textWhite,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      "See more ",
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: TColors.secondaryYellow,
                          ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: TColors.secondaryYellow,
                      size: 14,
                    )
                  ],
                )
              ],
            ),
          ),
          SpacerHelper.verticalSpaceMedium(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: TColors.primary,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Delivery S",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 0.5),
                        ),
                        SpacerHelper.verticalSpaceExtraSmall(),
                        Text(
                          "34589454633565",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: TColors.textWhite.withOpacity(0.5),
                                  ),
                        ),
                      ],
                    ),
                    Image.asset(
                      Assets.assetsImagesHomeWhiteTruck,
                      width: 120,
                      height: 120,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "09243 Chemnitz",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: TColors.textWhite,
                                  ),
                            ),
                            Text(
                              "Pickup Point",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: TColors.textWhite.withOpacity(0.5),
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.horizontalSpaceMedium(),
                        SvgPicture.asset(
                          Assets.assetsImagesRoutePickupIcon,
                          height: 25,
                          width: 25,
                        )
                      ],
                    ),
                    SpacerHelper.verticalSpaceExtraSmall(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "09243 Frankfurt",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: TColors.textWhite,
                                  ),
                            ),
                            Text(
                              "Destination",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    color: TColors.textWhite.withOpacity(0.5),
                                  ),
                            ),
                          ],
                        ),
                        SpacerHelper.horizontalSpaceMedium(),
                        SvgPicture.asset(
                          Assets.assetsImagesRouteDestinationIcon,
                          height: 25,
                          width: 25,
                        )
                      ],
                    )
                  ],
                ),
                SpacerHelper.verticalSpaceSmall(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
