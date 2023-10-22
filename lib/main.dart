import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gerenciador_cep/src/pages/cep_list_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  runApp(const GerenciarCepApp());
}

class GerenciarCepApp extends StatelessWidget {
  const GerenciarCepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de CEPs',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellowAccent),
        useMaterial3: true,
      ),
      home: const CepListPage(),
    );
  }
}
