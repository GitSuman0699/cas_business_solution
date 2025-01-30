import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:get/get.dart';

class VerifyAccountScreen extends StatefulWidget {
  const VerifyAccountScreen({super.key});

  @override
  State<VerifyAccountScreen> createState() => _VerifyAccountScreenState();
}

class _VerifyAccountScreenState extends State<VerifyAccountScreen> {
  bool isLinkExpired = false;
  int timeLeft = 30;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timeLeft > 0) {
          timeLeft--;
        } else {
          isLinkExpired = true;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpacerHelper.verticalSpaceExtraLarge(),
              Image.asset(
                Assets.assetsImagesCasLogo,
                height: 250,
                width: 250,
              ),
              const Spacer(),
              Text(
                isLinkExpired ? "Link Expired" : "Verify Account",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: TColors.textWhite,
                      fontWeight: FontWeight.w900,
                    ),
              ),
              SpacerHelper.verticalSpaceMedium(),

              // Message text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    if (!isLinkExpired) ...[
                      TextSpan(
                        text: 'We send a\n',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      TextSpan(
                        text: 'verification link to your email\n',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      TextSpan(
                        text: 'forgotmypassword@gmail.com',
                        style:
                            Theme.of(context).textTheme.bodyMedium?.copyWith(),
                      ),
                    ] else ...[
                      TextSpan(
                        text: 'Request a new link to\n',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                      TextSpan(
                        text: 'verify your account',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey[600],
                            ),
                      ),
                    ],
                  ],
                ),
              ),

              const Spacer(flex: 2),

              // Confirm/Request Button
              Padding(
                padding: const EdgeInsets.only(bottom: 32.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (isLinkExpired) {
                        // Handle requesting new link
                        setState(() {
                          isLinkExpired = false;
                          timeLeft = 30;
                        });
                        startTimer();
                      } else {
                        Get.toNamed(AppRoutes.accountConfirmationRoute);
                      }
                    },
                    child: Text(
                      isLinkExpired ? 'Request new link' : 'Confirm',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
