import 'package:droosy_app/core/bloc/font/font_bloc.dart';
import 'package:droosy_app/core/bloc/font/font_state.dart';
import 'package:droosy_app/core/routing/app_routes.dart';
import 'package:droosy_app/core/routing/route_pages.dart';
import 'package:droosy_app/core/services/storage_service.dart';
import 'package:droosy_app/core/themes/app_theme.dart';
import 'package:droosy_app/features/auth/logic/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FontBloc>(create: (context) => FontBloc()),
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
      ],
      child: BlocBuilder<FontBloc, FontState>(
        builder: (context, fontState) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Droosy App',
            theme: AppTheme.getLightTheme(fontState),
            themeMode: ThemeMode.light,
            initialRoute: AppRoutes.splash,
            onGenerateRoute: AppRoutes.onGenerateRoute,
            getPages: AppPages.pages,
          );
        },
      ),
    );
  }
}
