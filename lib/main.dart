import 'package:flutter/material.dart';
import 'package:sharedexample/models.dart';
import 'package:sharedexample/shared_preferences_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final preference = PreferencesSetting();

  final _usernameContoller = TextEditingController();

  Gender? _selectedgender = Gender.female;
  var _selectedlanguage = Set<Programminglanguage>();
  var _isemployed = false;

 @override
  void initState() {
    
    super.initState();
    populatefields();

  }

  void populatefields()async{
    final setting = await preference.getSetting();
    setState(() {
      _usernameContoller.text=setting.username;
      _selectedgender=setting.gender;
      _isemployed=setting.isEmployed;
      _selectedlanguage=setting.programminglanguage!;

    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Settings'),
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: TextField(
                controller: _usernameContoller,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
            ),
            RadioListTile<Gender>(
                title: const Text("Female"),
                value: Gender.female,
                groupValue: _selectedgender,
                onChanged: (Gender? val) =>
                    setState(() => _selectedgender = val)),
            RadioListTile<Gender>(
                title: const Text("Male"),
                value: Gender.male,
                groupValue: _selectedgender,
                onChanged: (Gender? val) =>
                    setState(() => _selectedgender = val)),
            RadioListTile<Gender>(
                title: const Text("Other "),
                value: Gender.other,
                groupValue: _selectedgender,
                onChanged: (Gender? val) =>
                    setState(() => _selectedgender = val)),
            CheckboxListTile(
                title: const Text("Dart"),
                value: _selectedlanguage.contains(Programminglanguage.dart),
                onChanged: (_) {
                  setState(() {
                    _selectedlanguage.contains(Programminglanguage.dart)
                        ? _selectedlanguage.remove(Programminglanguage.dart)
                        : _selectedlanguage.add(Programminglanguage.dart);
                  });
                }),
            CheckboxListTile(
                title: const Text("Javascript"),
                value:
                    _selectedlanguage.contains(Programminglanguage.javascript),
                onChanged: (_) {
                  setState(() {
                    _selectedlanguage.contains(Programminglanguage.javascript)
                        ? _selectedlanguage
                            .remove(Programminglanguage.javascript)
                        : _selectedlanguage.add(Programminglanguage.javascript);
                  });
                }),
            CheckboxListTile(
                title: const Text("Swift"),
                value: _selectedlanguage.contains(Programminglanguage.swift),
                onChanged: (_) {
                  setState(() {
                    _selectedlanguage.contains(Programminglanguage.swift)
                        ? _selectedlanguage.remove(Programminglanguage.swift)
                        : _selectedlanguage.add(Programminglanguage.swift);
                  });
                }),
            CheckboxListTile(
                title: const Text("C"),
                value: _selectedlanguage.contains(Programminglanguage.c),
                onChanged: (_) {
                  setState(() {
                    _selectedlanguage.contains(Programminglanguage.c)
                        ? _selectedlanguage.remove(Programminglanguage.c)
                        : _selectedlanguage.add(Programminglanguage.c);
                  });
                }),
            SwitchListTile(
                title: const Text("Is Employed"),
                value: _isemployed,
                onChanged: (val) {
                  setState(() {
                    _isemployed = val;
                  });
                }),
            TextButton(
                child: const Text("Save Setting"), onPressed: _saveSetting),
        ],
        ),
      ),
    );
  }

  void _saveSetting() {
    final newSetting = Settings(
        username: _usernameContoller.text,
        gender: _selectedgender,
        programminglanguage: _selectedlanguage,
        isEmployed: _isemployed);
    
    preference.saveSettings(newSetting);
  }
}
