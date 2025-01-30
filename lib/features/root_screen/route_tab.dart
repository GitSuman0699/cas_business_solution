import 'package:cas_business_solutions/features/root_screen/navigation_tab.dart';
import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RouteTab extends StatefulWidget {
  const RouteTab({super.key});

  @override
  RouteTabState createState() => RouteTabState();
}

class RouteTabState extends State<RouteTab>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final controller = RouteController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.deliveryCardTapped.value = false;
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.deliveryCardTapped,
        builder: (context, isTapped, _) {
          if (isTapped) {
            return const RouteCardTappedWidget();
          } else {
            return RouteWidget(tabController: _tabController);
          }
        },
      ),
    );
  }
}

class RouteWidget extends StatelessWidget {
  const RouteWidget({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
      margin: const EdgeInsets.fromLTRB(8, 16, 8, 0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: TColors.primaryLighter,
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.black26,
              prefixIcon: IconButton(
                onPressed: null,
                icon: SizedBox(
                  child: SvgPicture.asset(
                    Assets.assetsImagesRouteSearchIcon,
                  ),
                ),
                iconSize: 18,
              ),
              hintText: "Search",
              hintStyle: const TextStyle(color: Colors.white54),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 16,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
          ),
          SpacerHelper.verticalSpaceExtraSmall(),
          TabBar(
            controller: _tabController,
            indicatorColor: TColors.secondaryYellow,
            labelColor: TColors.secondaryYellow,
            dividerColor: Colors.transparent,
            unselectedLabelColor: Colors.white54,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              Tab(text: "Past"),
              Tab(text: "Upcoming"),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                DeliveryList(isPast: true),
                DeliveryList(isPast: false),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RouteCardTappedWidget extends StatelessWidget {
  const RouteCardTappedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              decoration: BoxDecoration(
                color: TColors.primaryLighter,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
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
                                "James Luther",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: TColors.textWhite,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 0.5,
                                    ),
                              ),
                              Text(
                                "Iveco PowerStar 420",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: TColors.textWhite.withOpacity(0.5),
                                      letterSpacing: 0.5,
                                    ),
                              ),
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
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Warehouse Details",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color: TColors.textWhite,
                                    fontWeight: FontWeight.w900,
                                  ),
                            ),
                            SpacerHelper.verticalSpaceExtraSmall(),
                            Row(
                              children: [
                                Text(
                                  "Brian Timothy",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color:
                                            TColors.textWhite.withOpacity(0.5),
                                      ),
                                ),
                                SpacerHelper.horizontalSpaceExtraLarge(),
                                SpacerHelper.horizontalSpaceExtraLarge(),
                                Text(
                                  "+9829098430",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                        color:
                                            TColors.textWhite.withOpacity(0.5),
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SpacerHelper.verticalSpaceSmall(),
            Image.asset(
              Assets.assetsImagesRouteMapImage,
              width: double.infinity,
            ),
            SpacerHelper.verticalSpaceSmall(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
              decoration: BoxDecoration(
                color: TColors.primaryLighter.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: TColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LocationRow(
                            "09243 Chemnitz", "Pickup Point", true),
                        SpacerHelper.verticalSpaceSmall(),
                        SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                        SpacerHelper.verticalSpaceSmall(),
                        const LocationRow("Location Name", "Stop", true),
                        SpacerHelper.verticalSpaceSmall(),
                        SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                        SpacerHelper.verticalSpaceSmall(),
                        const LocationRow("Location Name", "Stop", true),
                        SpacerHelper.verticalSpaceSmall(),
                        SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                        SpacerHelper.verticalSpaceSmall(),
                        const LocationRow("Location Name", "Stop", true),
                        SpacerHelper.verticalSpaceSmall(),
                        SvgPicture.asset(Assets.assetsImagesHomeDotIcon),
                        SpacerHelper.verticalSpaceSmall(),
                        const LocationRow(
                            "09243 Frankfurt", "Destination", true),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Deadline",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.textWhite,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                        Text(
                          "10.02.2025",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: TColors.textWhite,
                                    fontWeight: FontWeight.w900,
                                  ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Start Trip"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DeliveryList extends StatelessWidget {
  final bool isPast;

  const DeliveryList({super.key, required this.isPast});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 8),
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            RouteController().deliveryCardTapped.value = true;
          },
          child: Card(
            margin: const EdgeInsets.only(top: 8),
            color: TColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Name",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.5,
                                ),
                      ),
                      Text(
                        isPast ? "Complete" : "Upcoming",
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: TColors.textWhite.withOpacity(0.5),
                              letterSpacing: 0.5,
                            ),
                      ),
                      SpacerHelper.verticalSpaceExtraSmall(),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "09243 Chemnitz",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
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
                                    .bodyMedium!
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
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class RouteController {
  static final RouteController _instance = RouteController._internal();
  factory RouteController() => _instance;
  RouteController._internal();

  final deliveryCardTapped = ValueNotifier<bool>(false);
}
