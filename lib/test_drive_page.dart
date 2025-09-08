import 'package:flutter/material.dart';
import 'dart:convert';

class TestDrivePage extends StatefulWidget {
  final String? preselectedCar; // марка и модель

  const TestDrivePage({this.preselectedCar});

  @override
  _TestDrivePageState createState() => _TestDrivePageState();
}

class _TestDrivePageState extends State<TestDrivePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _carCtrl = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.preselectedCar != null) {
      _carCtrl.text = widget.preselectedCar!;
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final data = {
        'name': _nameCtrl.text,
        'phone': _phoneCtrl.text,
        'email': _emailCtrl.text,
        'car': _carCtrl.text,
        'date': _selectedDate?.toIso8601String() ?? '',
      };

      final jsonData = jsonEncode(data);
      print('JSON для отправки: $jsonData');

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green),
              SizedBox(width: 8),
              Text('Успешно!'),
            ],
          ),
          content: Text('Запрос на тест-драйв отправлен.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );

      _formKey.currentState!.reset();
      setState(() => _selectedDate = null);
    }
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(Duration(days: 365)),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey[100],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F7FA),
      appBar: AppBar(
        title: Text('Запись на тест-драйв'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 400), // ограничение ширины
          child: Card(
            elevation: 8,
            margin: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Text(
                      'Заполните форму',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: _inputDecoration('Имя', Icons.person),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Введите имя' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: _inputDecoration('Телефон', Icons.phone),
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Введите телефон' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: _inputDecoration('Email', Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Введите email' : null,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _carCtrl,
                      decoration: _inputDecoration(
                        'Марка и модель авто',
                        Icons.directions_car,
                      ),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Выберите автомобиль' : null,
                    ),
                    SizedBox(height: 16),
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      leading: Icon(Icons.calendar_today, color: Colors.indigo),
                      title: Text(
                        _selectedDate == null
                            ? 'Выберите дату'
                            : 'Дата: ${_selectedDate!.day}.${_selectedDate!.month}.${_selectedDate!.year}',
                        style: TextStyle(
                          fontSize: 16,
                          color: _selectedDate == null
                              ? Colors.grey
                              : Colors.black,
                        ),
                      ),
                      onTap: _pickDate,
                    ),
                    SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: TextStyle(fontSize: 16),
                      ),
                      child: Text('Отправить'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
