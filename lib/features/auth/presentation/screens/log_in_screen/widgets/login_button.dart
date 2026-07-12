import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/primary_button_widget.dart';
import 'package:men_store_app/features/auth/presentation/manager/log_in_cubit.dart';
import 'package:men_store_app/features/auth/presentation/manager/log_in_state.dart';

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInCubit, LogInState>(
      listenWhen: (previous, current) =>
          current is LogInSuccess || current is LogInError,
      listener: (context, state) {
        if (state is LogInSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        }

        if (state is LogInError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        return PrimaryButtonWidget(
          buttonColor: AppColors.primaryColor,
          buttonTextColor: AppColors.whiteColor,
          buttonWidth: 325.w,
          buttonHeight: 50.h,
          buttonRadius: 10.r,
          buttonBorderColor: AppColors.primaryColor,
          buttonText: state is LogInLoading ? 'Loading...' : 'Sign In',
          onPressed: state is LogInLoading
              ? null
              : () {
                  context.read<LogInCubit>().emitLoginStates(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                },
        );
      },
    );
  }
}
