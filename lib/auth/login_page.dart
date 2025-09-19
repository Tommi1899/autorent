import 'package:flutter/material.dart';
import 'registration_page.dart';
import 'auth_layout.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AuthLayout(
      title: "Войти",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Google button
          ElevatedButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Google вход в разработке')),
              );
            },
            icon: const Icon(Icons.g_mobiledata, size: 28, color: Colors.white),
            label: const Text('Продолжить с помощью Google'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.25),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              textStyle: const TextStyle(fontSize: 16),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Divider
          Row(
            children: const [
              Expanded(child: Divider(thickness: 1, color: Colors.white54)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("или", style: TextStyle(color: Colors.white70)),
              ),
              Expanded(child: Divider(thickness: 1, color: Colors.white54)),
            ],
          ),
          const SizedBox(height: 16),

          // Email
          TextField(
            controller: _emailController,
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration("Электронная почта", Icons.email),
          ),
          const SizedBox(height: 16),

          // Password
          TextField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            style: const TextStyle(color: Colors.white),
            decoration: _inputDecoration("Пароль", Icons.lock).copyWith(
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
                onPressed: () {
                  setState(() => _obscurePassword = !_obscurePassword);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Forgot password
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Функция восстановления пароля в разработке'),
                  ),
                );
              },
              child: const Text(
                "Забыли пароль?",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Login button
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Авторизация в разработке')),
              );
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Colors.white.withOpacity(0.3),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
            child: const Text("Войти", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 16),

          // Registration link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "У вас нет аккаунта? ",
                style: TextStyle(color: Colors.white70),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const RegistrationPage()),
                  );
                },
                child: const Text(
                  "Регистрация",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.white70),
      prefixIcon: Icon(icon, color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white54),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Colors.white),
      ),
    );
  }
}
