import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.titleStyle,
    this.subtitleStyle,
  });

  final String title;
  final String subtitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              titleStyle ?? AppTextStyles.bodyTitle.copyWith(fontSize: 26.sp),
        ),
        const HeightSpace(height: 12),
        Text(subtitle, style: subtitleStyle ?? AppTextStyles.bodyText),
      ],
    );
  }
}
