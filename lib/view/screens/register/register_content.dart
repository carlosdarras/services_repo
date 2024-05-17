import 'package:flutter/material.dart';
import 'package:services_repo/blocs/register/register_bloc.dart';
import 'package:services_repo/view/common_widgets/navigations_types.dart';
import 'package:services_repo/view/tools.dart';

class RegisterContent extends StatelessWidget {
  const RegisterContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<RegisterBloc>(context);
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h),
      physics: const BouncingScrollPhysics(),
      children: [
        TextWidget(
          text: "Register Now",
          fontSize: 22.sp,
          fontWeight: FontWeight.w900,
        ),
        const TextWidget(text: "Register now to get all services"),
        const VerticalSpacing(2),
        CircleAvatar(
          radius: 35.sp,
          backgroundColor: AppColors.myGrey,
          child: Image.asset(
            AppAssets.camIcon,
            height: 7.h,
          ),
        ),
        Center(
          child: TextWidget(
            text: "Click to Upload Image",
            fontSize: 10.sp,
            textColor: Colors.grey,
          ),
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Name",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        NamesFiled(
          controller: bloc.nameController,
          focusedBorderRadius: 30,
          enabledBorderRadius: 30,
          hintText: "Username",
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Email",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        EmailWithoutIcon(
          controller: bloc.emailController,
          focusedBorderRadius: 30,
          enabledBorderRadius: 30,
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Phone Number",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        NumbersField(
          controller: bloc.phoneNumberController,
          focusedBorderRadius: 30,
          enabledBorderRadius: 30,
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Postel Code",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        NumbersField(
          controller: bloc.postelCodeController,
          focusedBorderRadius: 30,
          enabledBorderRadius: 30,
          hintText: "Enter code",
        ),
        const VerticalSpacing(2),
        TextWidget(
          text: "Password",
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
        const VerticalSpacing(1),
        PasswordWithShowButton(
          controller: bloc.passwordCodeController,
          bloc: bloc,
          focusedBorderRadius: 30,
          enabledBorderRadius: 30,
        ),
        const VerticalSpacing(2),
        ActionButton(
          onPressed: () {
            bloc.add(RegisterEmailAndPasswordEvent());
          },
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextWidget(text: "Already Have Account?"),
            CustomTextButtons(
              onPressed: () {
                navigateBack(context);
              },
              text: "Login",
            ),
          ],
        ),
      ],
    );
  }
}
