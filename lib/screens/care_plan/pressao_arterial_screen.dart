import 'package:flutter/material.dart';

class BloodPressureInput extends StatefulWidget {
  const BloodPressureInput({super.key});
  @override
  _BloodPressureInputState createState() => _BloodPressureInputState();
}

class _BloodPressureInputState extends State<BloodPressureInput> {
  int systolic = 0;
  int diastolic = 0;
  int pulse = 0;

  void saveBloodPressure() {
    // Aqui, você pode implementar a lógica para salvar os valores inseridos.
    // Por enquanto, apenas exibimos os valores no console.
    print('Systolic: $systolic mmHg');
    print('Diastolic: $diastolic mmHg');
    print('Pulse: $pulse bpm');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insira sua pressão arterial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sistólica (mmHg)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  systolic = int.tryParse(value) ?? 0;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Diastólica (mmHg)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  diastolic = int.tryParse(value) ?? 0;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pulso (bpm)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  pulse = int.tryParse(value) ?? 0;
                },
              ),
            ),
            ElevatedButton(
              onPressed: saveBloodPressure,
              child: Text('Salve'),
            ),
          ],
        ),
      ),
    );
  }
}
