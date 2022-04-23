enum Gender { female, male, other }

enum Programminglanguage { dart, swift, javascript, python, c }

class Settings {
  final String username;
  final Gender? gender;
  final Set<Programminglanguage>? programminglanguage;
  final bool isEmployed;

  Settings({
   required this.username,
    this.gender,
  required  this.programminglanguage,
   required this.isEmployed,
  });
}
