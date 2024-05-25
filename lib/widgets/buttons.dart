import 'package:atma_kitchen/core/colors.dart';
import 'package:atma_kitchen/core/constants.dart';
import 'package:flutter/material.dart';

FilledButton primaryFilledButton({
  required BuildContext context,
  onPressed,
  required String text,
  bool isLoading = false,
}) {
  return FilledButton(
    style: FilledButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize:
            const Size(double.infinity, HeightConstants.BUTTON_HEIGHT)),
    onPressed: () async {
      isLoading = true;
      onPressed();
      isLoading = false;
    },
    child: isLoading
        ? CircularProgressIndicator(color: AppColors.white)
        : Text(text),
  );
}

OutlinedButton whiteOutlinedButton({
  required BuildContext context,
  onPressed,
  required String text,
  bool isLoading = false,
}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
        backgroundColor: Colors.grey[300],
        foregroundColor: AppColors.black,
        minimumSize:
            const Size(double.infinity, HeightConstants.BUTTON_HEIGHT)),
    onPressed: () async {
      isLoading = true;
      onPressed();
      isLoading = false;
    },
    child: isLoading
        ? CircularProgressIndicator(color: AppColors.white)
        : Text(text),
  );
}

OutlinedButton primaryOutlinedButton({
  required BuildContext context,
  onPressed,
  required String text,
  bool isLoading = false,
}) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.kPrimary,
        foregroundColor: Colors.grey[300],
        side: BorderSide(color: AppColors.white),
        minimumSize:
            const Size(double.infinity, HeightConstants.BUTTON_HEIGHT)),
    onPressed: () async {
      isLoading = true;
      onPressed();
      isLoading = false;
    },
    child: isLoading
        ? CircularProgressIndicator(color: AppColors.white)
        : Text(text),
  );
}

FilledButton primarySmallButton({
  required BuildContext context,
  onPressed,
  required String text,
  bool isLoading = false,
}) {
  return FilledButton(
    style: FilledButton.styleFrom(
        padding:
            EdgeInsets.symmetric(horizontal: PaddingConstants.PADDING_LARGE),
        backgroundColor: AppColors.kPrimary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(RadiusConstants.RADIUS_XS)),
        minimumSize: const Size(0, HeightConstants.SMALL_BUTTON_HEIGHT)),
    onPressed: () async {
      isLoading = true;
      onPressed();
      isLoading = false;
    },
    child: isLoading
        ? CircularProgressIndicator(color: AppColors.white)
        : Text(text, style: const TextStyle(fontSize: TextConstants.TEXT_XS)),
  );
}
