import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Student {
  final String name;
  final List<double> grades;

  Student({required this.name, required this.grades});

  double calculateAverage() {
    double sum = grades.reduce((value, element) => value + element);
    return sum / grades.length;
  }

  bool isApproved() {
    return calculateAverage() >= 7.0;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Grades',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Student Grades'),
        ),
        body: StudentForm(),
      ),
    );
  }
}

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final TextEditingController _nameController = TextEditingController();
  final List<TextEditingController> _gradeControllers = List.generate(4, (index) => TextEditingController());
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nome do Aluno'),
          ),
          SizedBox(height: 20.0),
          for (int i = 0; i < 4; i++)
            TextField(
              controller: _gradeControllers[i],
              decoration: InputDecoration(labelText: 'Nota ${i + 1}'),
              keyboardType: TextInputType.number,
            ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              List<double> grades = _gradeControllers.map((controller) => double.tryParse(controller.text) ?? 0.0).toList();
              Student student = Student(name: _nameController.text, grades: grades);
              double average = student.calculateAverage();
              String status = student.isApproved() ? 'Aprovado' : 'Reprovado';
              setState(() {
                _result = 'Média: ${average.toStringAsFixed(2)} | Situação: $status';
              });
            },
            child: Text('Calcular Média'),
          ),
          SizedBox(height: 20.0),
          Text(_result, style: TextStyle(fontSize: 18.0)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    for (var controller in _gradeControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
