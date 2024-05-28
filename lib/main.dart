import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manican/core/generated/codegen_loader.g.dart';
import 'package:manican/routing/appRouter.dart';
import 'package:manican/core/theme/app_theme.dart';
import 'package:manican/di/appInitializer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manican/features/posts/presentation/bloc/add_delete_update_post/add_delete_update_post_bloc.dart';
import 'package:manican/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:manican/features/posts/presentation/pages/posts_page.dart';
import 'package:manican/di/injectionContainer.dart' as di;
void main() async {
  AppInitializer.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: [arabicLocale, englishLocale],
      path: 'assets/i18n',
      fallbackLocale: englishLocale,
      startLocale: englishLocale,
      saveLocale: false,
      useOnlyLangCode: true,
      assetLoader: const CodegenLoader(),
      child: Builder(builder: (context) {
        return ScreenUtilInit(
          designSize: const Size(360, 690),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (
            BuildContext context,
            Widget? child,
          ) =>
           MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.sl<PostsBloc>()..add(GetAllPostsEvent())),
          BlocProvider(create: (_) => di.sl<AddDeleteUpdatePostBloc>()),
        ],
       
              child: MaterialApp.router(
              title: 'title',
              theme: appTheme,
              locale: context.locale,
              builder: (context, child) => PostsPage(),
              supportedLocales: context.supportedLocales,
              localizationsDelegates: context.localizationDelegates,
              routerConfig: AppRouter.getRouter,
              debugShowCheckedModeBanner: false,
                        ),
            ),
        );
      }),
    );
  }

  Locale get englishLocale => const Locale('en');

  Locale get arabicLocale => const Locale('ar');
  }
