import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maplerad_assessment/app/ui/resource/ui.dart';
import 'package:maplerad_assessment/core/utils/sized_context.dart';


class AppButton extends StatelessWidget {
  const AppButton({
    required this.text,
    this.icon,
    this.onPressed,
    this.backgroundColor,
    this.buttonTextStyle,
    this.width,
    this.height,
    this.borderRadius,
    this.isLoading = false,
    this.padding,
    this.borderSide = BorderSide.none,
    super.key,
  });

  final String text;
  final Color? backgroundColor;
  final TextStyle? buttonTextStyle;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Widget? icon;
  final bool isLoading;
  final BorderSide borderSide;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = AppTextStyles.semiBold14.copyWith(
      color: Colors.white,
      overflow: TextOverflow.ellipsis
    );
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed,
        icon: icon ?? const SizedBox.shrink(),
        label: isLoading
            ? const CupertinoActivityIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                maxLines: 1,
                style: buttonTextStyle ?? defaultTextStyle,
              ),
        style: ElevatedButton.styleFrom(
            padding: padding,
            // fixedSize: Size(width ?? 250, height ?? 50),
            // maximumSize: Size(width ?? context.width * .4, height ?? 40),
            // minimumSize: Size(context.width * .3, 40),
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: borderSide,
              borderRadius: BorderRadius.circular(
                borderRadius ?? 200,
              ), // Set border radius here
            ),
            backgroundColor: backgroundColor ??
                AppColors.blue, // Change the color for Google button
            disabledBackgroundColor:
                (backgroundColor ?? AppColors.blue).withOpacity(0.5)),
      ),
    );
  }
}
