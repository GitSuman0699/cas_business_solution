import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:cas_business_solutions/utils/widgets/filled_rounded_pin_put.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PasswordResetOtpScreen extends StatefulWidget {
  const PasswordResetOtpScreen({super.key});

  @override
  State<PasswordResetOtpScreen> createState() => _PasswordResetOtpScreenState();
}

class _PasswordResetOtpScreenState extends State<PasswordResetOtpScreen> {
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
                    "Password reset",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    "We send a code to \n forgotmypassword@gmail.com",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  const FilledRoundedPinPut(),
                  const Spacer(),
                  _buildResetPasswordButton(context),
                  SpacerHelper.verticalSpaceLarge(),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Back to:  ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                        children: [
                          TextSpan(
                            text: "Log In",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: TColors.secondaryYellow,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.changePasswordRoute);
        },
        child: const Text(
          "Reset password",
        ),
      ),
    );
  }
}
