// detail_screen.dart
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Детали заведения'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Название: Example Place',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text('Описание: Отличное место для отдыха и еды.'),
            SizedBox(height: 12),
            Text('Адрес: ул. Примерная, 123'),
            SizedBox(height: 12),
            Text('Время работы: 09:00 - 22:00'),
          ],
        ),
      ),
    );
  }
}
