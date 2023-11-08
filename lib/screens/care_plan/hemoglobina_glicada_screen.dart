import 'package:flutter/material.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HemoglobinaGlicadaPage extends StatefulWidget {
  const HemoglobinaGlicadaPage({super.key});

  @override
  _HemoglobinaGlicadaPageState createState() => _HemoglobinaGlicadaPageState();
}


class _HemoglobinaGlicadaPageState extends State<HemoglobinaGlicadaPage> {
  /*FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();*/

  String? selectedLembrete;
  List<String> lembreteOptions = ['3 meses', '4 meses', '5 meses', '6 meses'];

  TextEditingController hemoglobinaGlicadaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //initializeNotifications();
  }
/*
  Future<void> initializeNotifications() async {
    //var initializationSettingsAndroid =
        //const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }*/

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    // Aqui você pode lidar com a notificação quando ela é recebida.
  }/*

  Future<void> scheduleNotification(String title, String body, int id, int months) async {
    var scheduledNotificationDateTime =
        DateTime.now().add(Duration(days: months * 30)); // Aproximadamente meses * 30 dias.

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    var iOSPlatformChannelSpecifics = DarwinNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      scheduledNotificationDateTime,
      platformChannelSpecifics,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hemoglobina Glicada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: hemoglobinaGlicadaController,
              decoration: const InputDecoration(labelText: 'Insira o valor da hemoglobina glicada'),
            ),
            const SizedBox(height: 16.0),
            DropdownButton<String>(
              value: selectedLembrete,
              items: lembreteOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedLembrete = newValue;
                });
              },
              hint: const Text('Selecione a frequência do lembrete'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (selectedLembrete != null) {
                  //int months = int.parse(selectedLembrete.split(' ')[0]);
                  /*scheduleNotification(
                    'Atualizar Hemoglobina Glicada',
                    'É hora de atualizar o valor da hemoglobina glicada!',
                    0,
                    months,
                  );*/
                }
              },
              child: const Text('Salvar e Configurar Lembrete'),
            ),
          ],
        ),
      ),
    );
  }
}