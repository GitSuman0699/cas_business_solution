import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

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
                    "Forgot password?",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    "No worries, we will send reset instructions.",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  _buildTextField(
                    hintText: "email@example.com",
                    isPassword: false,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validators: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: 'Email is required'),
                        FormBuilderValidators.email(
                            errorText: 'Enter a valid email address'),
                      ],
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
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

  Widget _buildTextField({
    required String hintText,
    required List<TextInputFormatter>? inputFormatters,
    required String? Function(String?)? validators,
    required TextInputType? keyboardType,
    required bool isPassword,
  }) {
    return TextFormField(
      obscureText: isPassword,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        suffixIcon: isPassword
            ? const Icon(Icons.remove_red_eye, color: Colors.white54)
            : null,
      ),
      validator: validators,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
    );
  }

  Widget _buildResetPasswordButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.passwordResetOtpRoute);
        },
        child: const Text(
          "Reset password",
        ),
      ),
    );
  }
}
