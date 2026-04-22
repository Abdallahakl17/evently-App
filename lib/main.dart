import 'package:enently/core/assets/routes_const.dart';
import 'package:enently/core/provider/auth/login_provider.dart';
import 'package:enently/core/provider/config/provider.theme.dart';
import 'package:enently/core/provider/config/provider_lang.dart';
import 'package:enently/core/provider/home/home_provider.dart';
import 'package:enently/core/provider/home/tab_items_provider.dart';
import 'package:enently/core/services/firebase_sevices/store_service.dart';
import 'package:enently/core/shared/shared_pref_manger.dart';
import 'package:enently/core/theme/app_theme/app_dark_theme.dart';
import 'package:enently/core/theme/app_theme/app_ligth_theme.dart';
 import 'package:enently/features/auth/confirm_reset_password.dart';
import 'package:enently/features/auth/login_screen.dart';
import 'package:enently/features/auth/register_screen.dart';
import 'package:enently/features/auth/resest_password.dart';
import 'package:enently/features/home/home.dart';
import 'package:enently/firebase_options.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefsHelper.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await StoreService.loadCurrentUser();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => LangProvider()),
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => TabItemsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],

      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    final langProvider = context.watch<LangProvider>();
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.homeScreen,
          routes: {
            AppRoutes.login: (context) => LoginScreen(),
            AppRoutes.register: (context) => RegisterScreen(),
            AppRoutes.homeScreen: (context) => HomeScreen(),
            AppRoutes.resetpassword: (context) => const ResestPassword(),
            AppRoutes.confirmresetpassword: (context) =>
                const ConfirmResetPassword(),
            // AppRoutes.createEvent: (context) => const CreateEventScreen(),
          },
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeProvider.currentTheme,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: [Locale('en'), Locale('ar'), Locale('es')],
          locale: Locale(langProvider.currentLang),
        );
      },
    );
  }
}
