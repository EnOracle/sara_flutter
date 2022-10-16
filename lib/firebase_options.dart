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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAx29-2lO4IGnx0GdrFXtYuelG4cBwLKtU',
    appId: '1:817020816231:web:df5955e0bfe63ca6337dc2',
    messagingSenderId: '817020816231',
    projectId: 'fir-auth-9d89c',
    authDomain: 'fir-auth-9d89c.firebaseapp.com',
    storageBucket: 'fir-auth-9d89c.appspot.com',
    measurementId: 'G-1LJVF158J3',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxreNOtSgQXh6X1Yn2CIAZUroGmZ1OK9U',
    appId: '1:817020816231:android:a2836d021bfe51c6337dc2',
    messagingSenderId: '817020816231',
    projectId: 'fir-auth-9d89c',
    storageBucket: 'fir-auth-9d89c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWFvUdg8KPpi0m_v8zka_T7TE6Hk1ZY6g',
    appId: '1:817020816231:ios:7c7d25c2490eea0d337dc2',
    messagingSenderId: '817020816231',
    projectId: 'fir-auth-9d89c',
    storageBucket: 'fir-auth-9d89c.appspot.com',
    iosClientId:
        '817020816231-qhgbqr8putl265q44uunooi0v2mf5uoi.apps.googleusercontent.com',
    iosBundleId: 'com.example.saraFlutter',
  );
}