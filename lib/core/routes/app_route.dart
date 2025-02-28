import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/logic/add_new_post_cubit/add_new_post_cubit.dart';
import '../../features/home/logic/get_all_posts_cubit/get_all_posts_cubit.dart';
import '../../features/home/ui/ui/screens/add_post_screen.dart';
import '../../features/home/ui/ui/screens/home_screen.dart';
import '../di/injection_container.dart';
import '../utils/underplid.dart';
import 'basi_route.dart';

class AppRoute {
  static const String homeScreen = "HomeLayout";
  static const String addPostScreen = "addPostScreen";

  static Route<void> routes(RouteSettings routeSettings) {
    final args = routeSettings.arguments;
    switch (routeSettings.name) {
      case homeScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => getIt<GetAllPostsCubit>()..getPosts(),
                  child: HomeScreen(),
                ));
      case addPostScreen:
        return MaterialPageRoute(
            builder: (context) =>
                BlocProvider(
                  create: (context) => getIt<AddNewPostCubit>(),
                  child: AddPostScreen(),
                ));
    // case addPostScreen:
    //   return MaterialPageRoute(
    //       builder: (context) => MultiBlocProvider(providers: [
    //             BlocProvider(
    //               create: (context) =>
    //                   getIt<GetPostTopicCubit>()..getAllTopics(),
    //             ),
    //             BlocProvider(
    //               create: (context) => getIt<AddNewPostOrCommentCubit>(),
    //             ),
    //           ], child: const AddPostScreen()));
    // case loginScreen:
    //   return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //             create: (context) => getIt<LoginCubit>(),
    //             child: LoginScreen(),
    //           ));
    // case signupScreen:
    //   return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //             create: (context) => getIt<SignUpCubit>(),
    //             child: SignupScreen(),
    //           ));
    // // case signupScreen:
    // //   return MaterialPageRoute(
    // //       builder: (context) => BlocProvider(
    // //         create: (context) => getIt<SignUpCubit>(),
    // //         child: const SignupScreen(),
    // //       ));
    // //
    // case forgotPassword:
    //   return MaterialPageRoute(
    //       builder: (context) => BlocProvider(
    //             create: (context) => getIt<ForgotPasswordCubit>(),
    //             child: ForgotPassword(),
    //           ));

      default:
        return BaseRoute(page: const PageUnderBuildScreen());
    }
  }
}
