import 'package:cas_business_solutions/features/root_screen/profile_tab.dart';
import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileTab extends StatefulWidget {
  const EditProfileTab({super.key});

  @override
  State<EditProfileTab> createState() => _EditProfileTabState();
}

class _EditProfileTabState extends State<EditProfileTab> {
  final profileController = ProfileController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: Padding(
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
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: TColors.primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: SvgPicture.asset(
                            Assets.assetsImagesRegistrationUploadIcon,
                            height: 20,
                            width: 20,
                            colorFilter: const ColorFilter.mode(
                              TColors.scaffoldBackground,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      ),
                      SpacerHelper.verticalSpaceLarge(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Name",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: TColors.scaffoldBackground),
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          _buildTextField(context, "First Name"),
                          _buildTextField(context, "Last Name"),
                        ],
                      ),
                      SpacerHelper.verticalSpaceSmall(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Info",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: TColors.scaffoldBackground),
                          ),
                          SpacerHelper.verticalSpaceSmall(),
                          _buildTextField(context, "email@example.com",
                              inputType: TextInputType.emailAddress),
                          _buildTextField(context, "Phone Number",
                              inputType: TextInputType.phone),
                        ],
                      ),
                      SpacerHelper.verticalSpaceSmall(),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            profileController.profileEditTapped.value = false;
                          },
                          child: Text("Save Changes",
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      {bool isPassword = false, TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: TextFormField(
        obscureText: isPassword,
        keyboardType: inputType,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        decoration: InputDecoration(
          hintText: label,
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
          filled: true,
          fillColor: TColors.primary,
        ),
      ),
    );
  }
}
