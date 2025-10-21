class Todo {
  final String id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    required this.isCompleted,
  });

  Map<String, dynamic> toJson() => {
    // Das müsst ihr Euch herleiten können.
  };

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    // Muss herleitbar sein.
    id: '',
    text: '',
    isCompleted: false,
  );

  Todo copyWith({
    String? id,
    String? text,
    bool? isCompleted,
  }) => Todo(
    id: id ?? this.id,
    text: text ?? this.text,
    isCompleted: isCompleted ?? this.isCompleted,
  );
}
