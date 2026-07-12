import 'package:flutter/material.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';

class CartSummary extends StatelessWidget {
  const CartSummary({
    super.key,
    required this.subtotal,
    required this.vat,
    required this.shippingFee,
    required this.total,
  });

  final String subtotal;
  final String vat;
  final String shippingFee;
  final String total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SummaryRow(title: 'Sub-total', value: subtotal),
        const HeightSpace(height: 16),
        _SummaryRow(title: 'VAT (%)', value: vat),
        const HeightSpace(height: 16),
        _SummaryRow(title: 'Shipping fee', value: shippingFee),
        const HeightSpace(height: 16),
        Divider(color: AppColors.greyColor.withValues(alpha: .3)),
        const HeightSpace(height: 16),
        _SummaryRow(title: 'Total', value: total, isTotal: true),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.title,
    required this.value,
    this.isTotal = false,
  });

  final String title;
  final String value;
  final bool isTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: isTotal
              ? AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w700)
              : AppTextStyles.bodyText.copyWith(color: AppColors.greyColor),
        ),
        const Spacer(),
        Text(
          value,
          style: AppTextStyles.bodyText.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}
