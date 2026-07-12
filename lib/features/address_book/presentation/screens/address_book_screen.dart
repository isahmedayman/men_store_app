import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/theme/app_text_styles.dart';
import 'package:men_store_app/core/widgets/app_bar_widget.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/address_book/presentation/widgets/address_item_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:men_store_app/features/address_book/presentation/manager/address_cubit.dart';
import 'package:men_store_app/features/address_book/presentation/manager/address_state.dart';

class AddressBookScreen extends StatelessWidget {
  const AddressBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarWidget(text: 'Address', isAccountScreen: true),
      body: Padding(
        padding: EdgeInsets.all(24.r),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Saved Addresses',
                style: AppTextStyles.bodyTitle.copyWith(fontSize: 16.sp),
              ),
            ),
            const HeightSpace(height: 14),
            Expanded(
              child: BlocBuilder<AddressCubit, AddressState>(
                builder: (context, state) {
                  if (state.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state.hasError) {
                    return Center(child: Text(state.errorMessage));
                  }

                  if (state.isEmpty) {
                    return const Center(child: Text('No addresses found'));
                  }

                  return ListView.separated(
                    itemCount: state.addresses.length,
                    separatorBuilder: (_, __) => const HeightSpace(height: 12),
                    itemBuilder: (context, index) {
                      final address = state.addresses[index];

                      return AddressItemCard(
                        name: address.name,
                        description: address.description,
                        isDefault: index == 0,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
