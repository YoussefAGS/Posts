import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:postapp/core/app/bloc_observer.dart';
import 'package:postapp/core/common/shared_pref_helper.dart';
import 'package:postapp/core/di/injection_container.dart';
import 'package:postapp/post_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefHelper().instantiatePreferences();
  await setupGetIt();

  Bloc.observer = AppBlocObserver();

  WidgetsBinding.instance.addObserver(AppLifecycleObserver());


  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    runApp(const PostApp());
  });
}

