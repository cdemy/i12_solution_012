import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i12_into_012/models/app_state.dart';
import 'package:i12_into_012/models/todo.dart';

final refAppState = NotifierProvider<AppStateNotifier, AppState>(() => AppStateNotifier());

class AppStateNotifier extends Notifier<AppState> {
  @override
  AppState build() => AppState(
    todos: [
      Todo(
        id: 'a',
        text: 'Müll rausbringen',
        isCompleted: false,
      ),
      Todo(
        id: 'b',
        text: 'Hausaufgaben machen',
        isCompleted: true,
      ),
    ],
    isDarkMode: false,
    asksForDeletionConfirmation: true,
  );

  void addTodo(String text) {}

  void toggleTodo(Todo todo) {
    final newTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    final newTodos = <Todo>[];
    for (final t in state.todos) {
      if (t == todo) {
        newTodos.add(newTodo);
      } else {
        newTodos.add(t);
      }
    }
    state = state.copyWith(todos: newTodos);
  }

  void deleteTodos(List<Todo>()) {}

  void toggleDarkMode() {
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void toggleDeletionConfirmation() {}

  void loadState() {}

  void saveState() {}

  /*
    - `addTodo(String text)`: Add new Todo
  - `toggleTodo(ToDo toDo)`: Toggle completion status
  - `deleteTodos(List<ToDo> toDos)`: Delete selected Todos
  - `toggleDarkMode()`: Switch theme
  - `toggleDeletionConfirmation()`: Toggle confirmation setting
  - `loadState()`: Load state from storage
  - `saveState()`: Save state to storage
  */
}
