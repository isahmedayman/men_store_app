import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class PrimaryInputFieldWidget extends StatefulWidget {
  static const double _defaultWidth = 331;
  static const double _defaultHeight = 56;
  static const double _defaultBorderWidth = 1.0;
  static const double _defaultBorderRadius = 12.0;

  final double? width;
  final double? height;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;
  final void Function(String?)? onFieldSubmitted;
  final void Function()? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final Color? fillColor;
  final Color? borderColor;
  final Color? disabledBorderColor;

  final double? borderWidth;
  final double? borderRadius;

  final String? hintText;
  final Color? hintTextColor;
  final double? hintTextFontSize;
  final FontWeight? hintTextFontWeight;

  final String? labelText;
  final Color? labelTextColor;
  final double? labelTextFontSize;
  final FontWeight? labelTextFontWeight;

  final TextStyle? textStyle;
  final TextStyle? errorStyle;

  final bool isPassword;
  final bool isSearchField;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  const PrimaryInputFieldWidget({
    super.key,
    this.width,
    this.height,
    this.controller,
    this.focusNode,
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.none,
    this.fillColor,
    this.borderColor,
    this.disabledBorderColor,
    this.borderWidth,
    this.borderRadius,
    this.hintText,
    this.hintTextColor,
    this.hintTextFontSize,
    this.hintTextFontWeight,
    this.labelText,
    this.labelTextColor,
    this.labelTextFontWeight,
    this.labelTextFontSize,
    this.textStyle,
    this.errorStyle,
    this.isPassword = false,
    this.isSearchField = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.inputFormatters,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  State<PrimaryInputFieldWidget> createState() =>
      _PrimaryInputFieldWidgetState();
}

class _PrimaryInputFieldWidgetState extends State<PrimaryInputFieldWidget> {
  late bool _obscureText;

  double get _borderWidth =>
      widget.borderWidth ?? PrimaryInputFieldWidget._defaultBorderWidth;

  double get _borderRadius =>
      widget.borderRadius ?? PrimaryInputFieldWidget._defaultBorderRadius;

  void _textListener() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;

    widget.controller?.addListener(_textListener);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_textListener);
    super.dispose();
  }

  Widget _buildPasswordIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(12.r),
        child: Icon(
          _obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder({
    required Color color,
    double? radiusOverride,
    double? widthOverride,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radiusOverride ?? _borderRadius),
      borderSide: BorderSide(
        color: color,
        width: (widthOverride ?? _borderWidth).w,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? PrimaryInputFieldWidget._defaultWidth.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.labelText != null) ...[
            Text(
              widget.labelText!,
              style: AppTextStyles.textFormFieldLabel.copyWith(
                color: widget.labelTextColor,
                fontSize: widget.labelTextFontSize?.sp,
                fontWeight: widget.labelTextFontWeight,
              ),
            ),
            const HeightSpace(height: 8),
          ],
          SizedBox(
            height: widget.height ?? PrimaryInputFieldWidget._defaultHeight.h,
            child: TextFormField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              validator: widget.validator,
              onChanged: widget.onChanged,
              onFieldSubmitted: widget.onFieldSubmitted,
              onTap: widget.onTap,
              keyboardType: widget.keyboardType,
              textInputAction: widget.textInputAction,
              textCapitalization: widget.textCapitalization,
              enabled: widget.enabled,
              readOnly: widget.readOnly,
              autofocus: widget.autofocus,
              maxLines: widget.isPassword ? 1 : widget.maxLines ?? 1,
              minLines: widget.minLines,
              maxLength: widget.maxLength,
              inputFormatters: widget.inputFormatters,
              style: widget.textStyle,
              cursorColor: Theme.of(context).primaryColor,
              cursorRadius: Radius.circular(_borderRadius),
              obscureText: _obscureText,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 18.h,
                  horizontal: 18.w,
                ),
                fillColor: widget.fillColor ?? const Color(0xFFF7F8F9),
                filled: true,
                errorStyle: widget.errorStyle,
                counterText: '',
                hintText: widget.hintText,
                hintStyle: AppTextStyles.textFormFieldHintText.copyWith(
                  color: widget.hintTextColor,
                  fontSize: widget.hintTextFontSize?.sp,
                  fontWeight: widget.hintTextFontWeight,
                ),
                prefixIcon: widget.isSearchField
                    ? Padding(
                        padding: EdgeInsets.all(12.r),
                        child:
                            widget.prefixIcon ??
                            const Icon(
                              Icons.search,
                              color: AppColors.greyColor,
                            ),
                      )
                    : widget.prefixIcon,
                suffixIcon: widget.isPassword
                    ? _buildPasswordIcon()
                    : widget.isSearchField &&
                          (widget.controller?.text.isNotEmpty ?? false)
                    ? IconButton(
                        onPressed: () {
                          widget.controller?.clear();
                          widget.onChanged?.call('');
                        },
                        icon: const Icon(Icons.cancel_rounded),
                      )
                    : widget.suffixIcon,
                border: _buildBorder(
                  color: widget.borderColor ?? Colors.transparent,
                ),
                enabledBorder: _buildBorder(
                  color: widget.borderColor ?? Colors.transparent,
                ),
                disabledBorder: _buildBorder(
                  color:
                      widget.disabledBorderColor ??
                      AppColors.greyColor.withValues(alpha: 0.4),
                ),
                focusedBorder: _buildBorder(
                  color: AppColors.primaryColor,
                  radiusOverride: _borderRadius + 10.r,
                ),
                errorBorder: _buildBorder(color: Colors.red),
                focusedErrorBorder: _buildBorder(
                  color: Colors.red,
                  radiusOverride: _borderRadius + 10.r,
                  widthOverride: _borderWidth + 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
