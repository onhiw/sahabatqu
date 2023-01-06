import 'dart:io';

import 'package:asma/asma.dart';
import 'package:core/core.dart';
import 'package:doa/doa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:gallery/gallery_page.dart';
import 'package:qibla/qibla.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sahabatqu/widgets/widget_home.dart';
import 'package:sahabatqu/injection.dart' as di;
import 'package:schedule/presentation/bloc/city-bloc/city_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-daily-bloc/prayer_daily_bloc.dart';
import 'package:schedule/presentation/bloc/prayer-monthly-bloc/prayer_monthly_bloc.dart';

import 'pages/page_splash_screen.dart';

const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'general', //id
    'General', //descriptions
    importance: Importance.max,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final BehaviorSubject<ReceivedNotification> didReceiveLocalNotificationSubject =
    BehaviorSubject<ReceivedNotification>();
final BehaviorSubject<String> selectNotificationSubject =
    BehaviorSubject<String>();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

class ReceivedNotification {
  ReceivedNotification({
    this.id,
    this.title,
    this.body,
    this.payload,
  });

  final int? id;
  final String? title;
  final String? body;
  final String? payload;
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('A bg message just showed up: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  di.init();
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Platform.isIOS
      ? messaging.subscribeToTopic('notification_ios')
      : messaging.subscribeToTopic('notification');

  NotificationSettings settings = await messaging.getNotificationSettings();

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, badge: true, sound: true);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/MyApp': (BuildContext context) => MyApp(),
    },
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool notificationsEnabled = false;

  Future<void> _isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      setState(() {
        notificationsEnabled = granted;
      });
    }
  }

  Future<void> _requestPermissions() async {
    if (Platform.isIOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      setState(() {
        notificationsEnabled = granted ?? false;
      });
    }
  }

  void initState() {
    super.initState();
    _isAndroidPermissionGranted();
    _requestPermissions();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    Navigator.pushNamed(context, "/");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    didReceiveLocalNotificationSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<CityBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PrayerDailyBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PrayerMonthlyBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // initialRoute: '/',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
        ),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => HomeWidget());
            case asmaRoute:
              return MaterialPageRoute(builder: (_) => AsmaPage());
            case doaRoute:
              return MaterialPageRoute(builder: (_) => DoaPage());
            case qiblaRoute:
              return MaterialPageRoute(builder: (_) => QiblaPage());
            case galleryRoute:
              return MaterialPageRoute(builder: (_) => GalleryPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
