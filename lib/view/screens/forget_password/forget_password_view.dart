import 'package:flutter/material.dart';
import 'package:services_repo/blocs/forget_password/forget_password_bloc.dart';
import 'package:services_repo/view/tools.dart';





class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordBloc(),
      child: BlocConsumer<ForgetPasswordBloc, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSendVerificationLinkSuccessState) {
            showToast(text: "Chick Your Email", state: ToastState.SUCCESS);
          } else if (state is ForgetPasswordSendVerificationLinkFailState) {
            showToast(
                text:
                    "Something wrong , check if you enter correct email ,or your connection",
                state: ToastState.ERROR);
          }
        },
        builder: (context, state) {
          print('the state in forget password is ${state}');
          var bloc = context.read<ForgetPasswordBloc>();
          return Scaffold(
            appBar: AppBar(
              title: TextWidget(
                text: "Forget Password",
                fontSize: 14.sp,
              ),
            ),
            body: ListView(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              children: [
                Center(
                    child: TextWidget(
                  text: "Write your email to send rest link",
                  fontWeight: FontWeight.bold,
                  fontSize: 13.sp,
                )),
                const VerticalSpacing(2),
                EmailWithoutIcon(
                  controller: bloc.controller,
                  isEnabledWithBorder: false,
                  isErrorWithBorder: false,
                  isFocusedErrorWithBorder: false,
                  isFocusedWithBorder: false,
                ),
                const VerticalSpacing(2),
                state is! ForgetPasswordSendVerificationLinkLoadingState
                    ? ActionButton(
                        text: "Continue",
                        backgroundColor: Colors.cyan,
                        onPressed: () {
                          bloc.add(ForgetPasswordStartProcess());
                        })
                    : const Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
