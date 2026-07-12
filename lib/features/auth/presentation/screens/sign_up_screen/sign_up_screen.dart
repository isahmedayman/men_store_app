import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/auth/presentation/screens/sign_up_screen/widgets/sign_up_button.dart';
import 'package:men_store_app/features/auth/presentation/screens/sign_up_screen/widgets/sign_up_form.dart';
import 'package:men_store_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:men_store_app/features/auth/presentation/widgets/auth_header.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            child: Column(
              children: [
                const AuthHeader(
                  title: 'Let’s create your account.',
                  subtitle: 'Let’s create your account.',
                ),
                const HeightSpace(height: 24),
                SignUpForm(
                  userNameController: _userNameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                ),
                const HeightSpace(height: 42),
                const SignUpButton(),
                const HeightSpace(height: 120),
                AuthFooter(
                  questionText: 'Already have an account?',
                  actionText: 'Log In',
                  onPressed: () {
                    context.go(AppRoutes.logInScreen);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
