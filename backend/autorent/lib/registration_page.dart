import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final data = {"name": _nameCtrl.text, "email": _emailCtrl.text, "password": _passwordCtrl.text};

      print("Регистрация: $data");
//mail@gmail.com
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
          content: Text('Вы зарегистрированы.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );

      final jsonData = jsonEncode(data);
      print('JSON для отправки: $jsonData');

      final url = Uri.parse("http://localhost:8080/registration");
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonData,
      );
      if (response.statusCode == 200) {

          print('✅ Успех: ${response.body}');
      } else {
      
          print('❌ Ошибка: ${response.statusCode} ${response.body}');
      }
      _formKey.currentState!.reset();
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
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text('Личный кабинет'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
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
                    const Text(
                      'Создайте аккаунт',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    // Имя
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: _inputDecoration('Имя', Icons.person),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Введите имя' : null,
                    ),
                    const SizedBox(height: 16),

                    // Email
                    TextFormField(
                      controller: _emailCtrl,
                      decoration: _inputDecoration('Email', Icons.email),
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) => v != null && v.contains('@')
                          ? null
                          : 'Введите корректный Email',
                    ),
                    const SizedBox(height: 16),

                    // Пароль
                    TextFormField(
                      controller: _passwordCtrl,
                      decoration: _inputDecoration('Пароль', Icons.lock)
                          .copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => setState(() {
                                _obscurePassword = !_obscurePassword;
                              }),
                            ),
                          ),
                      obscureText: _obscurePassword,
                      validator: (v) => v != null && v.length >= 6
                          ? null
                          : 'Минимум 6 символов',
                    ),
                    const SizedBox(height: 16),

                    // Подтверждение пароля
                    TextFormField(
                      controller: _confirmPasswordCtrl,
                      decoration:
                          _inputDecoration(
                            'Повторите пароль',
                            Icons.lock,
                          ).copyWith(
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscureConfirmPassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () => setState(() {
                                _obscureConfirmPassword =
                                    !_obscureConfirmPassword;
                              }),
                            ),
                          ),
                      obscureText: _obscureConfirmPassword,
                      validator: (v) => v == _passwordCtrl.text
                          ? null
                          : 'Пароли не совпадают',
                    ),
                    const SizedBox(height: 24),

                    // Кнопка
                    ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      child: const Text('Зарегистрироваться'),
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
