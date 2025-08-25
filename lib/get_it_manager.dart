import 'package:get_it/get_it.dart';
import 'package:nex_live_chat/screens/login/cubit.dart';

import 'common/commons.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<AppService>(AppService());
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit());
}
