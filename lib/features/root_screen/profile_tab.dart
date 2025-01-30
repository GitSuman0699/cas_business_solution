import 'package:cas_business_solutions/features/root_screen/edit_profile_tab.dart';
import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final profileController = ProfileController();

  @override
  void dispose() {
    profileController.profileEditTapped.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: ValueListenableBuilder(
        valueListenable: profileController.profileEditTapped,
        builder: (context, profileEditTapped, child) {
          if (profileEditTapped) {
            return const EditProfileTab();
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                children: [
                  const Spacer(),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: TColors.primaryLighter,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              top: 0,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  profileController.profileEditTapped.value =
                                      true;
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: const BoxDecoration(
                                    color: TColors.primary,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25),
                                    ),
                                  ),
                                  child: SvgPicture.asset(
                                    Assets.assetsImagesProfileEditIcon,
                                    height: 18,
                                    width: 18,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 45,
                                    backgroundImage: AssetImage(
                                        Assets.assetsImagesProfileImage),
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'Brian Timophy',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          color: TColors.textWhite,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.5,
                                        ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'BrianTimophy@gmail.com',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                          color: TColors.textWhite
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.normal,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SpacerHelper.verticalSpaceLarge(),
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 20),
                        decoration: BoxDecoration(
                          color: TColors.primaryLighter,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const ProfileOption(
                                assetName:
                                    Assets.assetsImagesProfilePasswordIcon,
                                text: 'Password'),
                            SpacerHelper.verticalSpaceSmall(),
                            const ProfileOption(
                                assetName: Assets.assetsImagesProfileFaqIcon,
                                text: 'FAQ'),
                            SpacerHelper.verticalSpaceSmall(),
                            const ProfileOption(
                                assetName:
                                    Assets.assetsImagesProfileSupportIcon,
                                text: 'Support'),
                            SpacerHelper.verticalSpaceSmall(),
                            const ProfileOption(
                                assetName:
                                    Assets.assetsImagesProfileDeleteAccountIcon,
                                text: 'Delete Account'),
                            SpacerHelper.verticalSpaceSmall(),
                            ProfileOption(
                              assetName: Assets.assetsImagesProfileLogoutIcon,
                              text: 'Log Out',
                              onTap: () {
                                Get.offAllNamed(AppRoutes.loginRoute);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String assetName;
  final String text;
  final Function()? onTap;

  const ProfileOption({
    super.key,
    required this.assetName,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: TColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: SvgPicture.asset(assetName),
        title: Text(
          text,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: TColors.textWhite,
                fontWeight: FontWeight.w600,
              ),
        ),
        trailing: const Icon(Icons.arrow_forward_ios,
            color: Colors.white54, size: 14),
        onTap: onTap,
      ),
    );
  }
}

class ProfileController {
  static final ProfileController _instance = ProfileController._internal();
  factory ProfileController() => _instance;
  ProfileController._internal();

  final profileEditTapped = ValueNotifier<bool>(false);
}
