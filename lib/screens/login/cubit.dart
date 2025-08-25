import 'package:equatable/equatable.dart';
import 'package:nex_live_chat/common/commons.dart';
import 'package:nex_live_chat/service/app_storage.dart';

part 'state.dart';

class LoginCubit extends CubitCustom<LoginState> {
  LoginCubit() : super(LoginState());

  final emailCtrl = TextEditingController();

  final passwordCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final formKeyPhone = GlobalKey<FormState>();
  late bool firstCheck = false;

  int countLoginFail = 0;

  Future onLogin(String email, String password) async {
    final String getId = await UtilsOther.getUniqueDeviceId();

    final Map<String, dynamic> params = {"email": email, "password": password, 'device_id': getId};
  }

  void onRecheckValidation() {
    if (firstCheck == true) formKey.currentState!.validate();
  }

  void clearLockLogin() {
    countLoginFail = 0;
    AppStorage.remove(AppConstants.keyTimeLoginFail);
    emit(state.copyWith(timeLockLoginFail: 0));
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

enum TypeSocialLogin { google, apple, loginWithMail, loginWithPhone }
