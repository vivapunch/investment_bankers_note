import 'package:flutter/material.dart';
import 'package:investment_bankers_note/screens/schedule2_making.dart';
import 'package:investment_bankers_note/screens/contract1_setting.dart';
import 'screens/work_choice.dart';
import 'components/constant.dart';
import 'screens/item_select.dart';
import 'screens/schedule1_setting.dart';
import 'screens/proposal1_setting.dart';
import 'components/variables.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// the main function is the starting point for all our flutter apps.
void main() => runApp(const BankersNoteApp());

class BankersNoteApp extends StatelessWidget {
  const BankersNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ko', 'KR'),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: kBrightColor,
        appBarTheme: const AppBarTheme(
          titleTextStyle:
              TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
          centerTitle: true,
          backgroundColor: kDarkColor,
          foregroundColor: kBrightTextColor,
        ),
      ),
      initialRoute: '/chooseWork',
      routes: {
        chooseWork: (context) => const ChooseWork(),
        selectPage: (context) => const SelectPage(),
        setSchedule: (context) => const ScheduleAssumptionPage(),
        makeSchedule: (context) => const MakeSchedule(),
        makeProposal: (context) => const MakeProposal(),
        writeContract: (context) => const WriteContract(),
      },
    );
  }
}
