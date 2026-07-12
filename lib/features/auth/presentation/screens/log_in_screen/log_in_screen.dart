import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:men_store_app/core/routing/app_routes.dart';
import 'package:men_store_app/core/theme/app_colors.dart';
import 'package:men_store_app/core/widgets/space_widget.dart';
import 'package:men_store_app/features/auth/presentation/screens/log_in_screen/widgets/login_button.dart';
import 'package:men_store_app/features/auth/presentation/screens/log_in_screen/widgets/login_form.dart';
import 'package:men_store_app/features/auth/presentation/widgets/auth_footer.dart';
import 'package:men_store_app/features/auth/presentation/widgets/auth_header.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthHeader(
                  title: 'Login to your account',
                  subtitle: 'It’s great to see you again.',
                ),
                const HeightSpace(height: 24),
                LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const HeightSpace(height: 60),
                LogInButton(
                  emailController: _emailController,
                  passwordController: _passwordController,
                ),
                const HeightSpace(height: 300),
                AuthFooter(
                  questionText: 'Don’t have an account?',
                  actionText: 'Join',
                  onPressed: () => context.push(AppRoutes.signUpScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
