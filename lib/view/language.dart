import 'package:blood_donation/controller/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
// reference
//!  https://docs.flutter.dev/development/accessibility-and-localization/internationalization#using-the-dart-intl-tools

enum LanguageGroup { defaultA, english, malayalam }

class LanguageView extends StatefulWidget {
  const LanguageView({Key? key}) : super(key: key);

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  LanguageGroup? _group;

  langugeSettings() {
    switch (_group) {
      case LanguageGroup.defaultA:
        context.read<LanguagePro>().setLanguageSameAsSytemLanguage();
        break;
      case LanguageGroup.english:
        context.read<LanguagePro>().setApplanguage('en');
        break;
      case LanguageGroup.malayalam:
        context.read<LanguagePro>().setApplanguage('ml');
        break;
      default:
        context.read<LanguagePro>().setApplanguage('en');
    }
  }



  initFunction() async {
    print('initFunction exicuted');
    Locale? _locale = await context.read<LanguagePro>().locale;
    print(_locale);
    print('object');
    if (_locale == null) {
      _group = LanguageGroup.defaultA;
      setState(() {});
    } else if (_locale.toString() == 'en') {
      _group = LanguageGroup.english;
      setState(() {});
    } else if (_locale.toString() == 'ml') {
      _group = LanguageGroup.malayalam;
      setState(() {});
    }
  }

  // init() {
  //   _group = LanguageGroup.defaultA;
  // }
  @override
  void initState() {
 
    super.initState();
  }

  @override
  void didChangeDependencies() {
    initFunction();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gramaphone'),
      ),
      body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text('Choose Application Language',
                        style: Theme.of(context).textTheme.displaySmall),
                  ),
                ),
      
                RadioListTile<LanguageGroup>(
                    title: Text('System Language'),
                    value: LanguageGroup.defaultA,
                    groupValue: _group,
                    onChanged: (LanguageGroup? languageGroup) {
                      setState(() {
                        _group = languageGroup!;
                        langugeSettings();
                      });
                    }),
                RadioListTile<LanguageGroup>(
                    title: Text('English'),
                    value: LanguageGroup.english,
                    groupValue: _group,
                    onChanged: (LanguageGroup? languageGroup) {
                      setState(() {
                        _group = languageGroup!;
                        langugeSettings();
                      });
                    }),
                RadioListTile<LanguageGroup>(
                    title: Text('Malayalam'),
                    value: LanguageGroup.malayalam,
                    groupValue: _group,
                    onChanged: (LanguageGroup? languageGroup) {
                      setState(() {
                        _group = languageGroup!;
                        langugeSettings();
                      });
                    })
              ],
            ),
    );
  }
}
