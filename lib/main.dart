import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter1_a_l/features/app/manger/color_manger.dart';
import 'features/app/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/http_certificate_maneger.dart';
import 'features/app/home/home_page.dart';
import 'features/app/routes/on_generate_route.dart';
import 'features/image_generation/presentation/cubit/image_generation_cubit.dart';
import 'features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global =  MyHttpOverrides();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TextCompletionCubit>(
          create: (_) => di.sl<TextCompletionCubit>(),
        ),
        BlocProvider<ImageGenerationCubit>(
          create: (_) => di.sl<ImageGenerationCubit>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ChatGPT',
        onGenerateRoute: OnGenerateRoute.route,
        theme: ThemeData(
          brightness: Brightness.light,
          appBarTheme: const AppBarTheme(
            backgroundColor: Mycolor.mgrey,
            centerTitle: true,
            elevation: 0,
          ),
        ),
        initialRoute: '/',
        routes: {
          "/": (context) {
            return const SplashScreen(
              child: HomePage(),
            );
          }
        },
      ),
    );
  }
}
