import 'package:flutter/material.dart';
import '../../../generated/l10n.dart';
import '../../../main.dart';
import 'model/model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? groupValue = 'hi'; // Make groupValue a member variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.language),
      ),
      body: ListView.builder(
        itemCount: languageModel.length,
        itemBuilder: (context, index) {
          var item = languageModel[index];
          return RadioListTile(
            value: item.languageCode,
            groupValue: groupValue,
            title: Text(item.language),
            subtitle: Text(item.subLanguage),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  groupValue = value; // Update the selected language
                });
                MyApp_l10n.setLocale(context, Locale(value));
              }
            },
          );
        },
      ),
    );
  }
}

