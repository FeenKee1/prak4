import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  String name;
  int age;

  Student(this.name, this.age);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ColumnScreen()),
                );
              },
              child: Text('Column'),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListViewScreen()),
                );
              },
              child: Text('ListView'),
            ),
            SizedBox(height: 16), // Расстояние между кнопками
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SeparatedListViewScreen()),
                );
              },
              child: Text('Separated ListView'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnScreen extends StatefulWidget {
  @override
  _ColumnScreenState createState() => _ColumnScreenState();
}

class _ColumnScreenState extends State<ColumnScreen> {
  List<Student> students = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Column'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index].name),
                    subtitle: Text("Age: ${students[index].age}"),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            buildAddStudentForm(),
          ],
        ),
      ),
    );
  }

  Widget buildAddStudentForm() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              students.add(Student(nameController.text, int.parse(ageController.text)));
              nameController.clear();
              ageController.clear();
            });
          },
          child: Text('Add'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (students.isNotEmpty) {
                students.removeLast();
              }
            });
          },
          child: Text('Remove'),
        ),
      ],
    );
  }
}

class ListViewScreen extends StatefulWidget {
  @override
  _ListViewScreenState createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  List<Student> students = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index].name),
                    subtitle: Text("Age: ${students[index].age}"),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            buildAddStudentForm(),
          ],
        ),
      ),
    );
  }

  Widget buildAddStudentForm() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: TextField(
            controller: ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              students.add(Student(nameController.text, int.parse(ageController.text)));
              nameController.clear();
              ageController.clear();
            });
          },
          child: Text('Add'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (students.isNotEmpty) {
                students.removeLast();
              }
            });
          },
          child: Text('Remove'),
        ),
      ],
    );
  }
}

class SeparatedListViewScreen extends StatefulWidget {
  @override
  _SeparatedListViewScreenState createState() => _SeparatedListViewScreenState();
}

class _SeparatedListViewScreenState extends State<SeparatedListViewScreen> {
  List<Student> students = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Separated ListView'),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Student List',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: students.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(students[index].name),
                    subtitle: Text("Age: ${students[index].age}"),
                  );
                },
              ),
            ),
            SizedBox(height: 8),
            buildAddStudentForm(),
          ],
        ),
      ),
    );
  }

  Widget buildAddStudentForm() {
    return Row(
      children: [
    Expanded(
    child: TextField(
    controller: nameController,
      decoration: InputDecoration(labelText: 'Name'),
    ),
    ),
    SizedBox(width: 8),
    Expanded(
    child: TextField(
    controller: ageController,
    decoration: InputDecoration(labelText: 'Age'),
    keyboardType: TextInputType.number,
    ),
    ),
    SizedBox(width: 8),
    ElevatedButton(
    onPressed: () {
    setState(() {
    students.add(Student(nameController.text, int.parse(ageController.text)));
    nameController.clear();
    ageController.clear();
    });
    },
      child: Text('Add'),
    ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () {
            setState(() {
              if (students.isNotEmpty) {
                students.removeLast();
              }
            });
          },
          child: Text('Remove'),
        ),
      ],
    );
  }
}

