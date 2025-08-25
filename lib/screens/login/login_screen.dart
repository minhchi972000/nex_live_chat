import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nex_live_chat/common/commons.dart';
import 'package:nex_live_chat/common/widget/button_countdown.dart';
import 'package:nex_live_chat/common/widget/extensions/nex_button.dart';
import 'package:nex_live_chat/common/widget/extensions/text_style_extension.dart';
import 'package:nex_live_chat/common/widget/next_input.dart';
import 'package:nex_live_chat/routers/app_routes.dart';
import 'package:nex_live_chat/routers/nex_navigate.dart';
import 'package:nex_live_chat/routers/nex_scaffold.dart';
import 'package:nex_live_chat/screens/login/cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late final cubit = context.read<LoginCubit>();
    return NexScaffold(
      showAppBar: true,
      elevation: 1,
      title: "Đăng nhập",
      child: Form(
        key: cubit.formKey,
        child: ListView(
          children: [
            80.verticalSpace,

            const SvgPictureImageCustom(svgPath: 'logo_nexdashboard', width: 130),

            50.verticalSpace,
            Text('Email', style: textTheme.bodyMedium),
            15.verticalSpace,
            NexInput(
              svgIconLeft: 'ic_email_outline',
              hintText: 'Nhập email',
              reCheckCall: cubit.onRecheckValidation,
              textEditingController: cubit.emailCtrl,
              validator: (input) => AppFormValidator.validateEmail(input, fieldName: 'email'),
            ),

            15.verticalSpace,

            Text('Mật khẩu', style: textTheme.bodyMedium),
            15.verticalSpace,
            NexInput(
              svgIconLeft: 'ic_lock_password',
              hintText: 'Nhập mật khẩu',
              reCheckCall: cubit.onRecheckValidation,
              obscureText: true,
              textEditingController: cubit.passwordCtrl,
              validator: (input) => AppFormValidator.validateEmpty(input, fieldName: 'Mật khẩu'),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Quên mật khẩu?",
                style: textTheme.bodyMedium?.text9196A1.size(12),
              ).textIconButton(onPressed: () => NexNavigate.pushNamed(AppRoutes.forgotPassword)),
            ),
            BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return ButtonCountdown(
                  dateTime: null,
                  minute: 5,
                  title: 'Đăng nhập',
                  onTap: () {
                    if (!cubit.formKey.currentState!.validate()) {
                      cubit.firstCheck = true;
                      return;
                    }
                    cubit.onLogin(cubit.emailCtrl.text, cubit.passwordCtrl.text);
                  },
                  onEnd: cubit.clearLockLogin,
                );
              },
            ).fullWidth,
            30.verticalSpace,
          ],
        ),
      ).paddingSymmetric(horizontal: 10),
    );
  }
}
