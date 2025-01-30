import 'dart:ui';
import 'package:cas_business_solutions/utils/constants/colors.dart';
import 'package:cas_business_solutions/utils/constants/spacer_helper.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

class DialogBoxes {
  DialogBoxes._();
  static final _dialogBoxes = DialogBoxes._();
  static DialogBoxes get instance => _dialogBoxes;

  void showAddRecipientDialog({
    required BuildContext context,
  }) {
    Get.dialog(
      Material(
        color: Colors.transparent,
        child: Stack(
          children: [
            // Blurred background effect
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
                child: Container(
                  color: Colors.black.withOpacity(0.0),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SpacerHelper.verticalSpaceExtraSmall(),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 24.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      color: TColors.primaryLighter,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 32,
                          ),
                          decoration: BoxDecoration(
                            color: TColors.primary.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              label: Text(
                                "Upload Image",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: TColors.secondaryYellow,
                                    ),
                              ),
                              icon: const Icon(Icons.image_sharp,
                                  color: TColors.secondaryYellow),
                            ),
                          ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        Material(
                          color: TColors.primaryLighter,
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              fillColor: TColors.primary,
                              filled: true,
                              hintText: "Category",
                              alignLabelWithHint: true,
                              contentPadding: const EdgeInsets.only(
                                left: 16,
                                right: 8,
                                bottom: 16,
                              ),
                              hintStyle: TextStyle(
                                color: TColors.textWhite.withOpacity(0.6),
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                              ),
                              hintTextDirection: TextDirection.ltr,
                            ),
                            isExpanded: true,
                            alignment: AlignmentDirectional.center,
                            dropdownColor: TColors.primary,
                            icon: const Icon(
                              Icons.arrow_drop_down,
                              color: TColors.textWhite,
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: "option1",
                                child: Text("Restroom"),
                              ),
                              DropdownMenuItem(
                                value: "option2",
                                child: Text("Height Barrier"),
                              ),
                              DropdownMenuItem(
                                value: "option3",
                                child: Text("Food Stop"),
                              ),
                            ],
                            onChanged: (value) {
                              // Handle value change
                            },
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Please select an option'),
                            ]),
                          ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        Material(
                          color: TColors.primaryLighter,
                          child: TextFormField(
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              hintText: "Title",
                              hintStyle: TextStyle(
                                color: TColors.textWhite.withOpacity(0.6),
                              ),
                              fillColor: TColors.primary,
                              filled: true,
                            ),
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Name is required'),
                              FormBuilderValidators.minLength(2,
                                  errorText: 'Minimum 2 characters required'),
                              FormBuilderValidators.match(
                                  RegExp(r'^[a-zA-Z\s]+$'),
                                  errorText: 'Only letters and spaces allowed'),
                            ]),
                          ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        Material(
                          color: TColors.primaryLighter,
                          child: TextFormField(
                            maxLines: 5,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  color: TColors.textWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                            // controller: controller.recipientPhone,
                            onTapOutside: (event) {
                              FocusScope.of(context).unfocus();
                            },
                            decoration: InputDecoration(
                              fillColor: TColors.primary,
                              filled: true,
                              hintText: "Notes..",
                              hintStyle: TextStyle(
                                color: TColors.textWhite.withOpacity(0.6),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(
                                  errorText: 'Notes is required'),
                              FormBuilderValidators.minLength(10,
                                  errorText: 'Minimum 10 characters required'),
                            ]),
                          ),
                        ),
                        SpacerHelper.verticalSpaceLarge(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              Get.back();
                            },
                            child: Text(
                              "Complete",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: TColors.textWhite.withOpacity(0.6),
                                    fontWeight: FontWeight.w700,
                                    decoration: TextDecoration.none,
                                  ),
                            ),
                          ),
                        ),
                        SpacerHelper.verticalSpaceSmall(),
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "Cancel",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: TColors.textWhite.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }
}
