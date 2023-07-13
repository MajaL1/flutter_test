import 'package:flutter/material.dart';
import 'package:flutter_test1/second_screen.dart';
import 'package:flutter_test1/util/notification_service.dart';

class HomePage extends StatefulWidget {
// Key is a type used in Flutter to identify widgets and allows Flutter
// to know when a widget that's moved in the tree
// is the same as a widget that was previously in a different location
  const HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final NotificationService notificationService;
  @override
  void initState() {
    notificationService = NotificationService();
    listenToNotificationStream();
    notificationService.initializePlatformNotifications();
    super.initState();
  }

  void listenToNotificationStream() =>
      notificationService.behaviorSubject.listen((payload) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SecondScreen(payload: payload)));
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(children: <Widget>[

          Row( //ROW 2
              children: [
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
                Container(
                  color: Colors.purple,
                  margin: EdgeInsets.all(25.0),
                  child:  TextButton(
                    onPressed: () async {
                    await notificationService.showLocalNotification(
                        id: 0,
                        title: "Drink Water",
                        body: "Time to drink some water!",
                        payload: "You just took water! Huurray!");
                    },
                    child: Text(
                      'Alarms',
                      style: TextStyle(color: Colors.white70, fontSize: 25),
                    ),
                  ),
                )
              ]),
          Row( // ROW 2
              children: [
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.all(25.0),
                  child: FlutterLogo(
                    size: 60.0,
                  ),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(25.0),
                  child:  Text(
                    'Test',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ]),
          Row( // ROW 2
              children: [

                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(25.0),
                  child:  Text(
                    'Display alarm state: ',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ]),
        ]));
  }
}