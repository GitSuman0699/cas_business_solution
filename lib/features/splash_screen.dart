import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              Assets
                  .assetsImagesSplashTruck, // Ensure you have this image in your assets folder
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.4),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                Assets.assetsImagesCasLogo,
                height: 250,
                width: 250,
              ),
              const Spacer(),
              Image.asset(
                Assets.assetsImagesSplashText,
                height: 250,
                width: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.loginRoute);
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Start Driving',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight:
                                FontWeight.w600, // Matches the bold text
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.chevron_right,
                                color: Colors.white, size: 20),
                            Icon(Icons.chevron_right,
                                color: Colors.white70, size: 20),
                            Icon(Icons.chevron_right,
                                color: Colors.white54, size: 20),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
