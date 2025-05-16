// FoodPoint: Экран регистрации

import 'package:flutter/material.dart';
import '../utils/preferences_helper.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> _register() async {
    await PreferencesHelper.setUsername(_usernameController.text);
    await PreferencesHelper.setLoginStatus(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Food Point')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
            ),
            width: 320,
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Food Point',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildTextField('Имя пользователя', _usernameController, Icons.person, hintText: 'Имя', isRequired: true),
                  _buildTextField('Фамилия', _lastnameController, Icons.person_outline, hintText: 'Фамилия', isRequired: true),
                  _buildTextField('Номер телефона', _phoneController, Icons.phone, hintText: '+7xxx-xxx-xx-xx', isPhone: true, isRequired: true),
                  _buildTextField('Email', _emailController, Icons.email, hintText: 'example@gmail.com', isEmail: true, isRequired: true),
                  _buildTextField('Пароль', _passwordController, Icons.lock, isPassword: true, isRequired: true),
                  _buildTextField('Подтверждение пароля', _confirmPasswordController, Icons.lock, isPassword: true, isRequired: true),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_passwordController.text.length >= 6 && _passwordController.text == _confirmPasswordController.text) {
                        await _register();
                        Navigator.pushReplacementNamed(context, '/main');
                      }
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 160, 160, 160)),
                    child: const Text('Зарегистрироваться'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, IconData icon, {bool isPassword = false, bool isPhone = false, bool isEmail = false, bool isRequired = false, String? hintText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isPhone ? TextInputType.phone : (isEmail ? TextInputType.emailAddress : TextInputType.text),
        validator: (value) {
          if (isRequired && (value == null || value.isEmpty)) return 'Поле обязательно';
          if (isPhone && !RegExp(r'^\+7\d{3}-\d{3}-\d{2}-\d{2}\$').hasMatch(value!)) return 'Формат: +7xxx-xxx-xx-xx';
          if (isEmail && !RegExp(r'^[\w.-]+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}\$').hasMatch(value!)) return 'Неверный формат email';
          if (isPassword && value!.length < 6) return 'Не менее 6 символов';
          return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () => controller.clear(),
          ),
          labelText: label,
          hintText: hintText,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
