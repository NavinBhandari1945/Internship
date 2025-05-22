import 'package:demo1_int/UI/skeleton_shimmer_09/Home_09.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'UI/authentication_08/Home.dart';
import 'UI/bloc_pr1_02/Home.dart';
import 'UI/internationalization_06/screen/home_screen.dart';
import 'bloc/bloc_pr1/bloc_pr1_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

//code 1
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Supabase.initialize(
//     url:"https://fsbzejvfdvvorfeuylrb.supabase.co",
//     anonKey:"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZzYnplanZmZHZ2b3JmZXV5bHJiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTk2NTQ5MTQsImV4cCI6MjAzNTIzMDkxNH0.i--PRZhDGC0Krkhv3pm94EISabVRnmyEoL0rF4VJgoo",
//   );
//   await Hive.initFlutter();
//   final hive_box=await Hive.openBox("Hive_demo1_int");
//   runApp(const MyApp());
// }


//donor app 01
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://lqevkoivmmqwzumdfgef.supabase.co/',
    anonKey:
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxxZXZrb2l2bW1xd3p1bWRmZ2VmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg4NjExNDMsImV4cCI6MjAzNDQzNzE0M30.QYnGKTBuyUjFFGGcJmCH-CABN4mcKndOc2hzw12SU_M',
  );
  runApp(const MyApp());
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
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:HomePage(),
        ) ,
        );
  }
}

//for internationalization

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



