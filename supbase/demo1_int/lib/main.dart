import 'package:demo1_int/UI/bloc_pr1_02/Home.dart';
// import 'package:demo1_int/UI/internationalization_06/controller/language_change_controller.dart';
// import 'package:demo1_int/UI/lazyLoading_NetworkCache_05/Pr1.dart';
// import 'package:demo1_int/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'UI/internationalization_06/pr1.dart';
import 'UI/internationalization_06/screen/home_screen.dart';
import 'bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';
// import 'package:flutter_bloc_localization/l10n/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url:"https://fsbzejvfdvvorfeuylrb.supabase.co",
    anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzYnplanZmZHZ2b3JmZXV5bHJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NTQ5MTQsImV4cCI6MjAzNTIzMDkxNH0.i--PRZhDGC0Krkhv3pm94EISabVRnmyEoL0rF4VJgoo",
  );
  await Hive.initFlutter();
  final hive_box=await Hive.openBox("Hive_demo1_int");
  runApp(const MyApp_l10n());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return
        BlocProvider(create: (context) =>Pr1Bloc() ,
        child:MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:HomePage() ,
        ) ,
        );
  }
}

class MyApp_l10n extends StatefulWidget {
  const MyApp_l10n({super.key});
  @override
  State<MyApp_l10n> createState() => _MyApp_l10nState();
  static void setLocale(BuildContext cotext,Locale newLocale){
    _MyApp_l10nState? state=cotext.findAncestorStateOfType<_MyApp_l10nState>();
    state?.setLocale(newLocale);

  }
}

class _MyApp_l10nState extends State<MyApp_l10n> {
  Locale? _locale;
  setLocale(Locale locale){
    setState(() {
      _locale=locale;
    });

  }
  @override
  Widget build(BuildContext context) {
    return
        MaterialApp (
          title: 'Flutter Demo',
          // localizationsDelegates: AppLocalizations.localizationsDelegates,
          localizationsDelegates:AppLocalizations.localizationsDelegates,
          supportedLocales:AppLocalizations.supportedLocales ,
          locale:_locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:HomeScreen(),
        );
  }
}



