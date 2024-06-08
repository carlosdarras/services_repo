import 'package:flutter/material.dart';
import 'package:services_repo/blocs/login/login_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/screens/forget_password/forget_password_view.dart';
import 'package:services_repo/view/screens/register/register_view.dart';
import 'package:services_repo/view/tools.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<LoginBloc>(context);
    var blocListener = context.watch<LoginBloc>();
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
        BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return PasswordWithShowButton(
              controller: bloc.passwordController,
              bloc: bloc,
              suffixPressed: () {
                bloc.add(LoginShowPassword());
              },
            );
          },
        ),
        const VerticalSpacing(5),
        blocListener.state is LoginStartProcessLoadingState
            ? const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              )
            : ActionButton(
                onPressed: () {
                  // navigateTo(context, const BottomNavigationBarView());
                  bloc.add(LoginStartProcessEvent());
                },
                text: "Login",
                fontWight: FontWeight.bold,
              ),
        // const VerticalSpacing(2),
        // ActionButtonWithIcon(
        //   icon: Image.asset(
        //     AppAssets.googleIcon,
        //     height: 3.h,
        //   ),
        //   onPressed: () {
        //     bloc.add(LoginUsingGoogle());
        //   },
        //   text: "Google",
        //   textColor: AppColors.primaryColor,
        //   backgroundColor: Colors.white,
        //   borderColor: AppColors.primaryColor,
        //   withBorder: true,
        // ),
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
              onPressed: () {
                navigateTo(context, ForgetPasswordView());
              },
              text: "Forgot Password",
              textColor: Colors.grey,
            ),
          ],
        )
      ],
    );
  }
}
