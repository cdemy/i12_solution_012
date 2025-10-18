import 'package:flutter_test/flutter_test.dart';

import 'teilnehmer_test.dart';

void main() {
  test('Note: toJson/fromJson', () {
    final note1 = Note('Deutsch', 3);
    final json = note1.toJson();
    final note2 = Note.fromJson(json);
    expect(note1, note2);
  });
}
