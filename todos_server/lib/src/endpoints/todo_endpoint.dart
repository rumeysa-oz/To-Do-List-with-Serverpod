import 'package:serverpod/serverpod.dart';
import 'package:todos_server/src/generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  Future<void> create(Session session, Todo todo) async {
    try {
      await Todo.db.insertRow(session, todo);
    } catch (e) {
      print(e);
    }
  }

  Future<List<Todo>> readAll(Session session) async {
    try {
      return await Todo.db.find(session, orderBy: (e) => e.id, orderDescending: true);
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<void> delete(Session session, Todo todo) async {
    try {
      await Todo.db.deleteRow(session, todo);
    } catch (e) {
      print(e);
    }
  }

  Future<void> update(Session session, Todo todo) async {
    try {
      await Todo.db.updateRow(session, todo);
    } catch (e) {
      print(e);
    }
  }
}
