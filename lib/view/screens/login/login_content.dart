import 'package:flutter/material.dart';
import 'package:services_repo/blocs/login/login_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/register/register_view.dart';
import 'package:services_repo/view/tools.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LoginBloc>(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
      children: [
        Center(
          child: TextWidget(
            text: "Welcome to",
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        Center(
          child: TextWidget(
            text: "MAPLE",
            fontWeight: FontWeight.w900,
            fontSize: 25.sp,
          ),
        ),
        Image.asset(AppAssets.logoNew, height: 20.h),
        const VerticalSpacing(5),
        TextWidget(
          text: "Email",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        EmailWithoutIcon(controller: bloc.emailController),
        const VerticalSpacing(2),
        TextWidget(
          text: "Password",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        PasswordWithShowButton(controller: bloc.passwordController, bloc: bloc),
        const VerticalSpacing(5),
        ActionButton(
          onPressed: () {
            // navigateTo(context, const BottomNavigationBarView());
            bloc.add(LoginStartProcessEvent());
          },
          text: "Login",
          fontWight: FontWeight.bold,
        ),
        const VerticalSpacing(2),
        ActionButtonWithIcon(
          icon: Image.asset(
            AppAssets.googleIcon,
            height: 3.h,
          ),
          onPressed: () {},
          text: "Google",
          textColor: AppColors.primaryColor,
          backgroundColor: Colors.white,
          borderColor: AppColors.primaryColor,
          withBorder: true,
        ),
        const VerticalSpacing(2),
        Row(
          children: [
            CustomTextButtons(
              onPressed: () {
                navigateTo(context, const RegisterView());
              },
              text: "Register",
              textColor: AppColors.primaryColor,
            ),
            const Spacer(),
            CustomTextButtons(
              onPressed: () {},
              text: "Forgot Password",
              textColor: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}
