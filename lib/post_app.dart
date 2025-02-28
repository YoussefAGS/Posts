import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:postapp/core/di/injection_container.dart';
import 'package:postapp/core/utils/show_toast.dart';

import 'core/routes/app_route.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class PostApp extends StatelessWidget {
  const PostApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 810),
      minTextAdapt: true,
      child: MaterialApp(
        navigatorKey: getIt<GlobalKey<NavigatorState>>(),
        title: 'PostApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        ),
        onGenerateRoute: AppRoute.routes,
        initialRoute: AppRoute.homeScreen,
        // home: MainScreen(initialPage: 0),
      ),
    );
  }
}

class AppLifecycleObserver extends WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.inactive) {
      ShowToast.cancelActiveToast(); // Cancel active toast when the app is not active
    }
  }
}