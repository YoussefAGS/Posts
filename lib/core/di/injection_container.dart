

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:postapp/features/home/data/data/data_source/api_home_services.dart';
import 'package:postapp/features/home/data/data/data_source/home_data_source.dart';
import 'package:postapp/features/home/logic/add_new_post_cubit/add_new_post_cubit.dart';
import 'package:postapp/features/home/logic/get_all_posts_cubit/get_all_posts_cubit.dart';

import '../../features/home/data/repo/home_repo/home_repo.dart';
import '../app/app_cubit/app_cubit.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final dio =  DioFactory.getDio();
  // final dioWithoutToken =  DioFactory.getDioWithToken();

  final navigationkey =  GlobalKey<NavigatorState>();
  getIt.registerLazySingleton(() => dio);
  getIt.registerFactory(AppCubit.new);

  getIt.registerLazySingleton<GlobalKey<NavigatorState>>(() => navigationkey);


  // home Posts
  getIt.registerLazySingleton<HomeDataSource>(() => ApiHomeServices(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  getIt.registerFactory<GetAllPostsCubit>(() => GetAllPostsCubit(getIt()));
  getIt.registerFactory<AddNewPostCubit>(() => AddNewPostCubit(getIt()));










  // // projectsOverview
  // getIt.registerLazySingleton<ProjectDataSource>(() => ApiProjectOverviewServices(dio));
  // getIt.registerLazySingleton<ProjectOverviewRepo>(() => ProjectOverviewRepo(projectDataSource: getIt()));
  // getIt.registerFactory<AllProjectCubit>(() => AllProjectCubit(getIt()));
  // getIt.registerFactory<ProjectDetailsCubit>(() => ProjectDetailsCubit(getIt()));





  // // chat
  // getIt.registerLazySingleton<ChatDataSource>(() => ApiChatServices(dio));
  // getIt.registerLazySingleton<ChatRepo>(() => ChatRepo(chatDataSource:getIt()));
  // getIt.registerFactory<ProjectChatCubit>(() => ProjectChatCubit(getIt()));
  //  getIt.registerFactory<TeamChatCubit>(() => TeamChatCubit(getIt()));
  // getIt.registerFactory<SocketCubit>(() => SocketCubit());




  // // profile
  // getIt.registerLazySingleton<ProfileDataSource>(() => ApiProfileService(dio));
  // getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
  // getIt.registerFactory<ClientCubit>(() => ClientCubit(getIt(), getIt()));
  // getIt.registerFactory<LangAndBussinseCubit>(() => LangAndBussinseCubit(getIt()));




  // //home
  // getIt.registerLazySingleton<HomeDataSource>(() => ApiHomeService(dio));
  // getIt.registerLazySingleton<HomeRepository>(() => HomeRepository(getIt()));
  // getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt()));
  //



}