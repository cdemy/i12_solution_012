import 'package:i12_into_012/models/todo.dart';

class AppState {
  final List<Todo> todos;
  final bool isDarkMode;
  final bool asksForDeletionConfirmation;

  AppState({
    required this.todos,
    required this.isDarkMode,
    required this.asksForDeletionConfirmation,
  });

  Map<String, dynamic> toJson() => {
    // Mechanistisch ableitbar
  };

  factory AppState.fromJson(Map<String, dynamic> json) => AppState(
    // ableitbar
    todos: [],
    isDarkMode: false,
    asksForDeletionConfirmation: true,
  );

  AppState copyWith({
    List<Todo>? todos,
    bool? isDarkMode,
    bool? asksForDeletionConfirmation,
  }) => AppState(
    // ergibt sich automatisch
    todos: todos ?? this.todos,
    isDarkMode: isDarkMode ?? this.isDarkMode,
    asksForDeletionConfirmation: asksForDeletionConfirmation ?? this.asksForDeletionConfirmation,
  );
}
