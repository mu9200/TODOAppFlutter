import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var output = '';
  List<dynamic> lst = [];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Todo App'),
            centerTitle: true,
          ),
          body: ListView.builder(
              itemCount: lst.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.yellow.shade500,
                  height: 75,
                  margin: EdgeInsets.all(5.0),
                  child: ListTile(
                      title: Text('${lst[index]}'),
                      trailing: Container(
                        height: 50,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Edit Text'),
                                        content: TextField(onChanged: (value) {
                                          output = value;
                                        }),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop;
                                                setState(() {
                                                  lst.replaceRange(index,
                                                      index + 1, {output});
                                                });
                                              },
                                              child: Text('Done'))
                                        ],
                                      );
                                    });
                              },
                              child: Icon(Icons.edit),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(Icons.delete),
                            )
                          ],
                        ),
                      )),
                );
              }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Add Text'),
                      content: TextField(onChanged: (value) {
                        output = value;
                      }),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop;
                              setState(() {
                                lst.add(output);
                              });
                            },
                            child: Text('Add'))
                      ],
                    );
                  });
            },
            child: Text('Add'),
          )),
    );
  }
}
