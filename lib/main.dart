import 'package:enently/core/theme/app_theme/theme.dart';
import 'package:enently/features/auth/register_screen.dart';
import 'package:enently/firebase_options.dart';
import 'package:enently/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: RegisterScreen(),
          theme: AppTheme.light,
           localizationsDelegates:  AppLocalizations.localizationsDelegates,
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // English
            Locale('es'), // Spanish
          ],locale: Locale('en'),
        );
      },
    );
  }
}
