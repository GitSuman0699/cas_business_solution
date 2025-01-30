import 'package:cas_business_solutions/generated/assets.dart';
import 'package:cas_business_solutions/routes/app_routes.dart';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/sizes.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
                    "New Password",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: TColors.textWhite,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraSmall(),
                  Text(
                    "Must be at least 8 characters with \n 3 special signs!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SpacerHelper.verticalSpaceExtraLarge(),
                  _buildTextField(
                    hintText: "Password",
                    isPassword: true,
                    controller: passwordController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Password is required'),
                      FormBuilderValidators.minLength(8,
                          errorText: 'Password must be at least 8 characters'),
                      (value) {
                        if (value == null) return null;
                        final specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                        final matches = specialChars.allMatches(value);
                        if (matches.length < 3) {
                          return 'Password must contain at least 3 special characters';
                        }
                        return null;
                      },
                    ]),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SpacerHelper.verticalSpaceSmall(),
                  _buildTextField(
                    hintText: "Confirm Password",
                    isPassword: true,
                    controller: confirmPasswordController,
                    inputFormatters: [
                      FilteringTextInputFormatter.deny(RegExp(r'\s')),
                    ],
                    validators: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Password is required'),
                      FormBuilderValidators.minLength(8,
                          errorText: 'Password must be at least 8 characters'),
                      (value) {
                        if (value == null) return null;
                        final specialChars = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
                        final matches = specialChars.allMatches(value);
                        if (matches.length < 3) {
                          return 'Password must contain at least 3 special characters';
                        }
                        return null;
                      },
                      (value) {
                        if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ]),
                    keyboardType: TextInputType.visiblePassword,
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
    TextEditingController? controller,
  }) {
    return TextFormField(
      controller: controller,
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
          "Log In",
        ),
      ),
    );
  }
}
