import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool termsAccepted = false;
  bool ageConfirmed = false;
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColors.primary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  Assets.assetsImagesCasLogo,
                  height: 250,
                  width: 250,
                ),
                Text(
                  "Complete Profile",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: TColors.scaffoldBackground,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Let's get you started...",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: TColors.scaffoldBackground,
                      ),
                ),
                SpacerHelper.verticalSpaceLarge(),
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: TColors.primaryLighter,
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
                const SizedBox(height: 10),
                const Text(
                  "File Type: Jpg Png\nMax size 10mb",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12, color: TColors.textWhite),
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
                SpacerHelper.verticalSpaceExtraSmall(),
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
                    _buildTextField(context, "Email",
                        inputType: TextInputType.emailAddress),
                    _buildTextField(context, "Phone Number",
                        inputType: TextInputType.phone),
                  ],
                ),
                SpacerHelper.verticalSpaceExtraSmall(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Date of Birth",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: TColors.scaffoldBackground)),
                    SpacerHelper.verticalSpaceSmall(),
                    _buildDateField(context),
                  ],
                ),
                SpacerHelper.verticalSpaceExtraSmall(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Password",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: TColors.scaffoldBackground)),
                    SpacerHelper.verticalSpaceSmall(),
                    _buildTextField(context, "Password", isPassword: true),
                    _buildTextField(context, "Confirm Password",
                        isPassword: true),
                  ],
                ),
                SpacerHelper.verticalSpaceMedium(),
                _CheckboxWithText(
                  text: "I have read the ",
                  link1: "Terms and Conditions",
                  text2: " and ",
                  link2: "Privacy Policy",
                  onChanged: (value) {
                    setState(() => termsAccepted = value ?? false);
                  },
                ),
                _CheckboxWithText(
                  text: "I affirm I am 18 years old or older",
                  onChanged: (value) {
                    setState(() => ageConfirmed = value ?? false);
                  },
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (termsAccepted && ageConfirmed)
                        ? () {
                            Get.toNamed(AppRoutes.verifyAccountRoute);
                          }
                        : null,
                    child: const Text(
                      "Continue",
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Already have an account? ",
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
                    )),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label,
      {bool isPassword = false, TextInputType inputType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
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
        ),
      ),
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        readOnly: true,
        controller: TextEditingController(
          text: selectedDate?.toString().split(' ')[0] ?? '',
        ),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
        decoration: InputDecoration(
          hintText: "Date of Birth",
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white70,
              ),
          filled: true,
          fillColor: TColors.primaryLighter,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: SvgPicture.asset(
              Assets.assetsImagesRegistrationCalenderIcon,
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(
                TColors.textWhite,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: selectedDate ?? DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            confirmText: "Done",
            cancelText: "Cancel",
            builder: (context, child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: TColors.primary,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (picked != null && picked != selectedDate) {
            setState(() {
              selectedDate = picked;
            });
          }
        },
      ),
    );
  }
}

class _CheckboxWithText extends StatefulWidget {
  final String text;
  final String? link1;
  final String? text2;
  final String? link2;
  final Function(bool?) onChanged;

  const _CheckboxWithText({
    required this.text,
    required this.onChanged,
    this.link1,
    this.text2,
    this.link2,
  });

  @override
  State<_CheckboxWithText> createState() => _CheckboxWithTextState();
}

class _CheckboxWithTextState extends State<_CheckboxWithText> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() => isChecked = value ?? false);
            widget.onChanged(value);
          },
          activeColor: TColors.secondaryYellow,
        ),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() => isChecked = !isChecked);
              widget.onChanged(isChecked);
            },
            child: RichText(
              text: TextSpan(
                text: widget.text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                    ),
                children: [
                  if (widget.link1 != null)
                    TextSpan(
                      text: widget.link1,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: TColors.secondaryYellow,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  if (widget.text2 != null)
                    TextSpan(
                      text: widget.text2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  if (widget.link2 != null)
                    TextSpan(
                      text: widget.link2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: TColors.secondaryYellow,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
