import 'package:flutter/material.dart';
import 'package:gerenciador_cep/src/repository/via_cep_repository.dart';

class AddCepPage extends StatefulWidget {
  const AddCepPage({super.key});

  @override
  State<AddCepPage> createState() => _AddCepPageState();
}

class _AddCepPageState extends State<AddCepPage> {
  final _repository = ViaCepRepository();
  String cep = '';

  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _cepController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Adicionar CEP',
              style: TextStyle(fontSize: 30.0),
            ),
            TextFormField(
              autofocus: true,
              textAlign: TextAlign.center,
              controller: _cepController,
              onSaved: (newValue) => cep = newValue ?? '',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        _formKey.currentState?.save();
                        final address = await _repository.fetchCep(cep);
                      }
                    },
                    child: const Text('Adicionar'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
