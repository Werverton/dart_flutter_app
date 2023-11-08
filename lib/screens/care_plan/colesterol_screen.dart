
import 'package:flutter/material.dart';

class ColesterolPage extends StatefulWidget {
  const ColesterolPage({super.key});
  @override
  _CholesterolCalculatorState createState() => _CholesterolCalculatorState();
}

class _CholesterolCalculatorState extends State<ColesterolPage> {
  double hdlC = 0.0;
  double ldlC = 0.0;
  double triglycerides = 0.0;
  double totalCholesterol = 0.0;

  void calculateTotalCholesterol() {
    setState(() {
      totalCholesterol = hdlC + ldlC + (0.2 * triglycerides);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cálculo Colesterol'),
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
                labelText: 'HDL-C (mg/dL)', 
                border: OutlineInputBorder(),),
              onChanged: (value) {
                hdlC = double.tryParse(value) ?? 0.0;
              },
            ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'LDL-C (mg/dL)',
              border: OutlineInputBorder()),
              onChanged: (value) {
                ldlC = double.tryParse(value) ?? 0.0;
              },
            ),),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Triglicerídeos (mg/dL)',border: OutlineInputBorder()),
              onChanged: (value) {
                triglycerides = double.tryParse(value) ?? 0.0;
              },
            ),),

            ElevatedButton(
              onPressed: calculateTotalCholesterol,
              child: Text('Total'),
            ),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child:
            Text(
              'Colesterol Total: ${totalCholesterol.toStringAsFixed(2)} mg/dL',
              style: TextStyle(fontSize: 18),
            ),),
          ],
        ),
      ),
    );
  }
}