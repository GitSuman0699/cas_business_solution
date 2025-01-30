import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountConfirmationScreen extends StatelessWidget {
  const AccountConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.assetsImagesCasLogo,
                    height: 250,
                    width: 250,
                  ),
                  const Spacer(),
                  Text(
                    "Welcome Jenifer!",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    "Account successfully created.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: Image.asset(
                      Assets.assetsImagesAccountConfirmationIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Spacer(),
                  _buildConfirmButton(context),
                  SpacerHelper.verticalSpaceLarge(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildConfirmButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamedUntil(AppRoutes.rootRoute, (route) => false);
        },
        child: const Text(
          "Continue",
        ),
      ),
    );
  }
}
