// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAVqEFRCFHWMsrFshtOBy7o9qScicgSrYs',
    appId: '1:17017991372:web:396e48f8118f69f184d269',
    messagingSenderId: '17017991372',
    projectId: 'chat-69bbb',
    authDomain: 'chat-69bbb.firebaseapp.com',
    storageBucket: 'chat-69bbb.appspot.com',
    measurementId: 'G-9Q5F8HTQ2T',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDtl_6ZSataZKzwI7WHEgNmtshiktlxd_E',
    appId: '1:17017991372:android:72b31b667bf0386784d269',
    messagingSenderId: '17017991372',
    projectId: 'chat-69bbb',
    storageBucket: 'chat-69bbb.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQDWR48c8usMkDwNl84NNBkxpKuRD21RM',
    appId: '1:17017991372:ios:228bd0c4e47cbc1e84d269',
    messagingSenderId: '17017991372',
    projectId: 'chat-69bbb',
    storageBucket: 'chat-69bbb.appspot.com',
    iosClientId:
        '17017991372-4ittogc585mcipmkbdb06lqtli0d2ufq.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQDWR48c8usMkDwNl84NNBkxpKuRD21RM',
    appId: '1:17017991372:ios:228bd0c4e47cbc1e84d269',
    messagingSenderId: '17017991372',
    projectId: 'chat-69bbb',
    storageBucket: 'chat-69bbb.appspot.com',
    iosClientId:
        '17017991372-4ittogc585mcipmkbdb06lqtli0d2ufq.apps.googleusercontent.com',
    iosBundleId: 'com.example.chat',
  );
}
