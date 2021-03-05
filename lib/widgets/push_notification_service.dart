import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationHelper {
  FirebaseMessaging firebaseMessaging = FirebaseMessaging();
  final BuildContext context;

  // this variable is to make sure if there is no same notification dialog that
  // will appear twice
  static String lastMessage;

  bool isUploading = false;
  bool load = false;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;

  //constructor PushNotificationHelper
  PushNotificationHelper(this.context) {
    print("Constructor being called");
    printToken();
    print("fcm listener being called");
    // firebaseMessaging.subscribeToTopic('/topics');
    firebaseCMListener();
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    initializing();
  }

  /*
   * @description printToken untuk mencetak token firebase dalam bentuk debug dan dapat dilihat di debug consolenya
   */
  Future<String> printToken() async {
    print("token should be printed");
    var token = await firebaseMessaging.getToken();
    print("token saya $token");

    return token;
  }

  /*
   * @description initializing untuk initialisasi awal dalam penggunaan local notification 
   */

  void initializing() async {
    androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    iosInitializationSettings = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    initializationSettings = InitializationSettings(
        androidInitializationSettings, iosInitializationSettings);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: (payload) async {
        onSelectNotification(payload);
      },
    );
  }

  /*
   * @description firebaseCMListener untuk mendapatkan callback dengan menerima pesan dari firebase messaging
   */

  void firebaseCMListener() {
    print("must be here");
    firebaseMessaging.configure(
      onMessage: (message) {
        print("push received");
        print(message.toString());
        lastMessage = message.toString();
        _showNotification(message);
        return Future.value(true);
      },
      onResume: (message) {
        print("push received");
        print(message.toString());
        if (lastMessage == message.toString()) return Future.value(true);
        lastMessage = message.toString();
        _showNotification(message);
        return Future.value(true);
      },
      onLaunch: (message) {
        print("push received");
        print(message.toString());
        if (lastMessage == message.toString()) return Future.value(true);
        lastMessage = message.toString();
        _showNotification(message);
        return Future.value(true);
      },
    );
    firebaseMessaging.requestNotificationPermissions(IosNotificationSettings(
      sound: true,
      alert: true,
      badge: true,
    ));
    firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      // print("Settings registered: $settings");
    });
  }

  /*
   * @description _showNotification untuk menampilkan notification yang di kirim melalui firebase messaging
   */

  void _showNotification(var message) {
    String body, title;
    // bool isSilent;
    if (Platform.isIOS) {
      title = message['notification']['title'];
      body = message['notification']['body'];
      print("body $body");
    } else {
      title = message['notification']['title'];
      body = message['notification']['body'];
    }
    print(message);
    _showNotificationsInit(title, body);
  }

  /*
   * @description _showNotificationsInit untuk initialisasi dalam menampilkan notification
   * @description notification untuk initialisasi awal dalam mengconfig settingan dari local notification 
   */

  void _showNotificationsInit(String title, String body) async {
    await notification(title, body);
  }

  Future<void> notification(String title, String message) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('first channel ID', 'General', 'General',
            priority: Priority.High,
            importance: Importance.Max,
            enableLights: true,
            playSound: true,
            enableVibration: true,
            ticker: 'test');

    IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    NotificationDetails notificationDetails =
        NotificationDetails(androidNotificationDetails, iosNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        0, title, message, notificationDetails);
    load = true;
  }

  /*
   * @description onSelectNotification digunakan ketika user mengklik notification yang muncul dan mengarahkan ke page selanjutnya
   */

  Future onSelectNotification(String payload) async {
    if (load == true) {
      debugPrint('notification payload: ' + payload);
      load = false;
      Navigator.pushNamed(context, "/");
    }
  }

  /*
   * @description onDidReceiveLocalNotification untuk initialisasi dalam menampilkan notification iOS
   */
  Future onDidReceiveLocalNotification(
      int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: <Widget>[
        CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              print("");
            },
            child: Text("Okay")),
      ],
    );
  }
}
