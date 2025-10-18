import 'dart:convert';

class Klasse {
  final String name;
  final List<Teilnehmer> teilnehmer;
  final int? tageSeitLetztemArbeitsunfall;

  Klasse({
    required this.name,
    required this.teilnehmer,
    this.tageSeitLetztemArbeitsunfall,
  });

  factory Klasse.fromJson(Map<String, dynamic> json) => Klasse(
    name: json['name'] as String,
    tageSeitLetztemArbeitsunfall: json['tageSeitLetztemArbeitsunfall'] as int?,
    teilnehmer: (json['teilnehmer'] as List<dynamic>)
        .map(
          (e) => Teilnehmer.fromJson(e as Map<String, dynamic>),
        )
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'tageSeitLetztemArbeitsunfall': tageSeitLetztemArbeitsunfall,
    'teilnehmer': teilnehmer.map((tn) => tn.toJson()).toList(),
  };

  String toString() =>
      'Klasse "$name" ($tageSeitLetztemArbeitsunfall Tage seit letztem Arbeitsunfall) mit den Teilnehmern: ${teilnehmer.map((e) => e.toString()).join(', ')}';
}

class Teilnehmer {
  final String lastName;
  final String firstName;
  final int? age;
  final double? weight;
  final bool aktiv;
  final List<Note> noten;

  Teilnehmer({
    required this.lastName,
    required this.firstName,
    required this.aktiv,
    required this.noten,
    this.age,
    this.weight,
  });

  factory Teilnehmer.fromJson(Map<String, dynamic> json) => Teilnehmer(
    lastName: json['lastName'] as String,
    firstName: json['firstName'] as String,
    aktiv: json['aktiv'] as bool,
    age: json['age'] as int?,
    weight: json['weight'] as double?,
    noten: (json['noten'] as List<dynamic>).map((e) => Note.fromJson(e as Map<String, dynamic>)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'lastName': lastName,
    'firstName': firstName,
    'age': age,
    'weight': weight,
    'aktiv': aktiv,
    'noten': noten.map((n) => n.toJson()).toList(),
  };

  String toString() => '$firstName $lastName ($age) mit den Noten ${noten.map((e) => e.toString()).join(', ')}';
}

class Note {
  final String fach;
  final int note;

  Note(this.fach, this.note);

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    json['fach'] as String,
    json['note'] as int,
  );

  Map<String, dynamic> toJson() => {
    'fach': fach,
    'note': note,
  };

  @override
  bool operator ==(Object other) {
    if (other is! Note) return false;
    if (other.fach != fach) return false;
    if (other.note != note) return false;
    return true;
  }

  String toString() => '$note in $fach';

  @override
  int get hashCode => Object.hash(fach, note);
}

void main() {
  final tn = Teilnehmer(
    lastName: 'Mustermann',
    firstName: 'Maxine',
    age: 27,
    weight: 72.7,
    aktiv: true,
    noten: [],
  );

  final klasse = Klasse(
    name: '27B',
    tageSeitLetztemArbeitsunfall: null,
    teilnehmer: [
      Teilnehmer(
        firstName: 'Yusuf',
        lastName: 'Mohammad',
        age: 34,
        aktiv: false,
        noten: [
          Note('English', 3),
          Note('Deutsch', 2),
        ],
      ),
      tn,
    ],
  );
  final json = jsonEncode(klasse.toJson());
  print(json);
  final map = jsonDecode(json) as Map<String, dynamic>;
  print(map);
  final klasse2 = Klasse.fromJson(map);
  print(klasse2);
}
