import 'package:enently/core/assets/routes_const.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/config/provider_lang.dart';
import 'package:enently/core/theme/app_theme/theme.dart';
import 'package:enently/features/auth/login_screen.dart';
import 'package:enently/features/auth/register_screen.dart';
import 'package:enently/features/home/home_screen.dart';
import 'package:enently/firebase_options.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LangProvider()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LangProvider>(context);
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.register,
          routes: {
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => RegisterScreen(),
            AppRoutes.homeScreen: (context) => const HomeScreen(),
            // AppRoutes.createEvent: (context) => const CreateEventScreen(),
          },
          theme: AppTheme.light,
          themeMode: themeProvider.currentTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: [Locale('en'), Locale('ar'), Locale('es')],
          locale: Locale(langProvider.currentLang),
        );
      },
    );
  }
}
