import 'package:flutter/material.dart';
import 'package:gerenciador_cep/src/repository/back4app_repository.dart';

import 'add_cep_page.dart';

class CepListPage extends StatefulWidget {
  const CepListPage({super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {
  final _repository = Back4AppRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: const Text("CEPs"),
      ),
      body: const Placeholder(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) => const AddCepPage(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
