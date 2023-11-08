
import 'package:flutter/material.dart';

class ColesterolPage extends StatefulWidget {
  const ColesterolPage({super.key});

  @override
  _ColesterolPageState createState() => _ColesterolPageState();
}

class _ColesterolPageState extends State<ColesterolPage> {
  String? selectedFrequencia;
  List<String> frequenciaOptions = ['1x por dia', '2x por dia', '3x por dia'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Colesterol'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const TextField(
              decoration: InputDecoration(labelText: 'Insira o valor da glicemia'),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedFrequencia,
              items: frequenciaOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedFrequencia = newValue;
                });
              },
              hint: const Text('Selecione a frequência do lembrete'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Coloque aqui o código para salvar o registro de glicemia
                // e configurar o lembrete com base nas seleções do usuário.
              },
              child: const Text('Salvar Registro'),
            ),
          ],
        ),
      ),
    );
  }
}
