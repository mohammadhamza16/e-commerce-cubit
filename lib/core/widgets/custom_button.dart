import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../styles/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double? borderRadius;
  final double elevation;
  final bool isLoading;
  final double? width;
  final Widget? icon;
  final bool? isGreadiant;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color = AppColor.primary,
    this.textColor = AppColor.background,
    this.borderRadius,
    this.elevation = 4.0,
    this.isLoading = false,
    this.width,
    this.icon,
    this.isGreadiant = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        width: width ?? double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.r),
        decoration: BoxDecoration(
          gradient:
              isGreadiant == true
                  ? LinearGradient(
                    colors: [
                      color,
                      AppColor.secondary.withValues(alpha: 0.85),
                      AppColor.primary.withValues(alpha: 0.7),
                    ],
                    stops: const [0.0, 0.7, 1.0],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    transform: const GradientRotation(0.12),
                  )
                  : null,
          color: isGreadiant == true ? null : color,
          borderRadius: BorderRadius.circular(borderRadius ?? 16.r),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow,
              blurRadius: elevation,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child:
              isLoading
                  ? SizedBox(
                    width: 24.w,
                    height: 24.h,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        AppColor.background,
                      ),
                      strokeWidth: 2.5.sp,
                    ),
                  )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[icon!, SizedBox(width: 8.w)],
                      Text(
                        text,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                          letterSpacing: 1.1.w,
                          shadows: [
                            Shadow(
                              color: AppColor.shadow,
                              blurRadius: 2,
                              offset: Offset(1, 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }
}
