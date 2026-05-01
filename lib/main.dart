import 'package:enently/core/model/event_model.dart';
import 'package:enently/features/home/tabs/add_event.dart';
import 'package:enently/features/home/tabs/deatails_screen.dart';
import 'package:enently/shared.dart';

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
        ChangeNotifierProvider(create: (_) => UserProvider()..loadUser()),
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
            AppRoutes.createEvent: (context) => AddEvent(),
            AppRoutes.deatailsScreen: (context) {
              EventModel eventModel =
                  ModalRoute.of(context)!.settings.arguments as EventModel;
              return DeatailsScreen(eventModel: eventModel);
            },
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
