import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedexample/models.dart';

class PreferencesSetting {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setBool('isEmployed', settings.isEmployed);
    await preferences.setString('username', settings.username);
    await preferences.setInt('gender', settings.gender!.index);
    await preferences.setStringList(
        'programmingLanguages',
        settings.programminglanguage
            !.map((lang) => lang.index.toString())
            .toList());

    print('saveSetting');
  }

  Future<Settings> getSetting() async {
    final pref = await SharedPreferences.getInstance();

    final username = pref.getString('username');
    final isEmployed = pref.getBool('isEmployed');
    final gender = Gender.values[pref.getInt('gender') ?? 0];

    final programminglanguagesIndices =
        pref.getStringList('programmingLanguages');

    final programmingLanguages = programminglanguagesIndices
        ?.map(
            (stringindex) => Programminglanguage.values[int.parse(stringindex)])
        .toSet();

    return Settings(
      username: username as String,
      gender: gender,
      programminglanguage: programmingLanguages,
      isEmployed: isEmployed as bool,
    );
  }
}
