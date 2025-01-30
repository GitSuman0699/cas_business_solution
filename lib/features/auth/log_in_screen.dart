import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    "Log In",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  _buildTextField(
                    hintText: "Email Address",
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
                  SpacerHelper.verticalSpaceSmall(),
                  _buildTextField(
                    hintText: "Password",
                    isPassword: true,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validators: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(
                            errorText: 'Password is required'),
                      ],
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SpacerHelper.verticalSpaceMedium(),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.forgotPasswordRoute);
                      },
                      child: Text(
                        "Forgot password?",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  _buildSignInButton(context),
                  SpacerHelper.verticalSpaceLarge(),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.registrationRoute);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white70,
                            ),
                        children: [
                          TextSpan(
                            text: "Create an account",
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

  Widget _buildSignInButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Get.offNamedUntil(AppRoutes.rootRoute, (route) => false);
        },
        child: const Text(
          "Sign In",
        ),
      ),
    );
  }
}
