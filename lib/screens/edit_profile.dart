import 'package:baid_health_dev/controller/user_controller.dart';
import 'package:baid_health_dev/model/doenca.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  final DiseaseController diseaseController = Get.put(DiseaseController());

  void _editGame(String id) {
    //userController.editGame(id);
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edite seu perfil')),
      body: Container(
          padding: EdgeInsets.all(16.0),
          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: userController.weightController,
                decoration: InputDecoration(hintText: 'Peso'),
              ),
              TextField(
                controller: userController.heightController,
                decoration: InputDecoration(hintText: 'Altura'),
              ),
              TextField(
                controller: userController.cardSusController,
                decoration: InputDecoration(hintText: 'Cartão SUS'),
              ),
              TextField(
                controller: userController.healthUnityIdController,
                decoration: InputDecoration(hintText: 'Unidade de saúde'),
              ),
              TextField(
                controller: userController.diabetesTimeController,
                decoration: InputDecoration(hintText: 'Tempo de diabetes'),
              ),
              TextField(
                controller: userController.diabetesTypeIdController,
                decoration: InputDecoration(hintText: 'Tipo de diabetes'),
              ),
              DropdownButton<Disease>(
              value: null,
              hint: Text('Selecione uma doença'),
              items: diseaseController.allDiseases
                  .map((disease) => DropdownMenuItem(
                        value: disease,
                        child: Text(disease.name),
                      ))
                  .toList(),
              onChanged: (selectedDisease) {
                diseaseController.addDisease(selectedDisease!);
                // Adicionar a doença selecionada à lista
                //diseaseController.addDisease(selectedDisease!);
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Navegar de volta para a tela anterior ou realizar outras ações
                //Get.back();
              },
              child: Text('Voltar'),
            ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  //onPrimary: Colors.white,
                  //primary: Colors.green,
                  minimumSize: Size(88, 36),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                  ),
                ),
                onPressed: ()=> _editGame(userController.user.value.id.toString()),
                child: Text('Salvar'),
              )
            ],
          ),
        ),
    );
  }
}
//remover depois
class Disease {
  final int id;
  final String name;

  Disease({
    required this.id,
    required this.name,
  });
}

class DiseaseController extends GetxController {
  final RxList<Disease> selectedDiseases = <Disease>[].obs;
  final List<Disease> allDiseases = [
    Disease(id: 1, name: 'Colesterol alto'),
    Disease(id: 2, name: 'Doença renal'),
    Disease(id: 3, name: 'Gordura no fígado'),
    Disease(id: 4, name: 'Hipertensão (pressão alta)'),
    Disease(id: 5, name: 'Triglicerídeos alto'),
    Disease(id: 6, name: 'Apneia do sono'),
  ];

  void addDisease(Disease disease) {
    selectedDiseases.add(disease);
  }
}
