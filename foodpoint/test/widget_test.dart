import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Registration screen opens and shows necessary fields', (WidgetTester tester) async {
    // Запускаем приложение с экраном регистрации
    await tester.pumpWidget(const MaterialApp(home: RegisterScreen()));

    // Проверяем наличие основных полей с помощью поиска по типу виджета и тексту
    expect(find.text('Регистрация'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(6)); // 6 полей ввода

    // Проверяем наличие кнопки "Register"
    expect(find.text('Register'), findsOneWidget);

    // Проверяем наличие конкретного поля по labelText
    expect(find.widgetWithText(TextFormField, 'Name'), findsOneWidget);

    // Вводим данные в поле "Name"
    await tester.enterText(find.widgetWithText(TextFormField, 'Name'), 'Лира');

    // Нажимаем на кнопку регистрации
    await tester.tap(find.text('Register'));
    await tester.pump();

    // Проверяем, что после нажатия произошёл переход на главный экран
    expect(find.text('Добро пожаловать, Лира!'), findsOneWidget);
  });
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Регистрация')),
      body: const Center(child: Text('Registration Form Placeholder')),
    );
  }
}
