import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:nex_live_chat/common/widget/nex_progress.dart';
import 'package:nex_live_chat/get_it_manager.dart';
import 'package:nex_live_chat/routers/app_gorouter.dart';
import 'package:nex_live_chat/screens/login/cubit.dart';

class App extends StatefulWidget {
  const App({super.key});

  static final GlobalKey<NavigatorState> appNavigateKey = GlobalKey();
  static late StatefulNavigationShell mainnavigationShell;
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    NexProgress.dismiss();
    setupGetIt();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<LoginCubit>(create: (context) => getIt<LoginCubit>())],
      child: MaterialApp.router(
        title: "Nex live chat",
        debugShowCheckedModeBanner: false,

        routerConfig: AppRouter.router,

        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },

        // onGenerateRoute: AppPages.generateRoute,
      ),
    );
  }
}
