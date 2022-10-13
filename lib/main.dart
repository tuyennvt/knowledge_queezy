import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:knowledge_queezy/src/config/routes.dart';
import 'package:knowledge_queezy/src/config/strings.dart';
import 'package:knowledge_queezy/src/config/theme.dart';
import 'package:knowledge_queezy/src/data/local/shared_prefs.dart';
import 'package:knowledge_queezy/src/modules/main/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: kBackgroundColor,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(
    ProviderScope(
      overrides: [sharedPreferencesProvider.overrideWithValue(sharedPreferences)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      routes: routes,
      initialRoute: MainPage.routeName,
      theme: ThemeData(
        appBarTheme: appBarTheme,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: PrimaryFont.fontFamily,
              bodyColor: kTextColor,
              displayColor: kTextColor,
            ),
        fontFamily: PrimaryFont.fontFamily,
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: kPrimaryColor,
              background: kBackgroundColor,
            ),
        snackBarTheme: SnackBarThemeData(
          contentTextStyle: PrimaryFont.medium(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        elevatedButtonTheme: elevatedButtonThemeData,
      ),
    );
  }
}
