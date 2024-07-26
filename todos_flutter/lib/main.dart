import 'package:todos_client/todos_client.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  List<Todo> todos = [];

  Todo? editingTodo;

  getTodos() async {
    todos = await client.todo.readAll();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Card(
                child: TextFormField(
                  controller: contentController,
                  decoration: const InputDecoration(
                    hintText: 'Content',
                  ),
                  maxLines: 10,
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (editingTodo != null) {
                    editingTodo!.title = titleController.text;
                    editingTodo!.content = contentController.text;
                    editingTodo!.updatedAt = DateTime.now();
                    await client.todo.update(editingTodo!);
                    editingTodo = null;
                    titleController.clear();
                    contentController.clear();
                    setState(() {});
                    return;
                  }
                  var todo = Todo(
                    title: titleController.text,
                    content: contentController.text,
                    createdAt: DateTime.now(),
                    updatedAt: DateTime.now(),
                  );
                  await client.todo.create(todo);
                  titleController.clear();
                  contentController.clear();
                  setState(() {});
                },
                child: const Text('Save'),
              ),
              Expanded(
                child: FutureBuilder(
                    future: getTodos(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const CircularProgressIndicator();
                      }
                      return ListView.builder(
                        itemCount: todos.length,
                        itemBuilder: (context, index) {
                          var item = todos[index];
                          return Card(
                            child: ListTile(
                              title: Text(item.title),
                              subtitle: Text(item.content),
                              leading: IconButton(
                                onPressed: () async {
                                  editingTodo = item;
                                  titleController.text = item.title;
                                  contentController.text = item.content;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Colors.blue,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () async {
                                  await client.todo.delete(item);
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.delete_forever_outlined,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
