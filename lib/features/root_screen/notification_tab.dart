import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationTab extends StatelessWidget {
  const NotificationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Column(
          children: [
            Expanded(
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: -1.0, end: 0.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset:
                        Offset(0, MediaQuery.of(context).size.height * value),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: TColors.primaryLighter,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListView(
                        children: const [
                          NotificationItem(number: 15),
                          NotificationItem(number: 8),
                          NotificationItem(number: 3),
                          NotificationItem(number: 12),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final int number;

  const NotificationItem({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: TColors.primary,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bay Assigned  $number',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: TColors.textWhite,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                SpacerHelper.horizontalSpaceSmall(),
                SvgPicture.asset(Assets.assetsImagesNotificationClipboardIcon)
              ],
            ),
            SpacerHelper.verticalSpaceExtraSmall(),
            Text(
              'Ensure clearance for oversized cargo and confirm with shipping department for load details.',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: TColors.textWhite.withOpacity(0.5),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
