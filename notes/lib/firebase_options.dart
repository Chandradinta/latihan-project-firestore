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
    apiKey: 'AIzaSyDIzqOIacZTO0E1gJBr6_Y76-sbv4C9i34',
    appId: '1:236031969412:web:6822452cfd8584ad605ad1',
    messagingSenderId: '236031969412',
    projectId: 'notes-3a7e8',
    authDomain: 'notes-3a7e8.firebaseapp.com',
    storageBucket: 'notes-3a7e8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZ4kiV0gXgmHtZYUPKl6fRQo2Hwr5vl04',
    appId: '1:236031969412:android:d499fdca7ec207ff605ad1',
    messagingSenderId: '236031969412',
    projectId: 'notes-3a7e8',
    storageBucket: 'notes-3a7e8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAAQYfoz0KA6CZW5Y_ctmDPHTKm98xHpP0',
    appId: '1:236031969412:ios:f5bb32537159acb3605ad1',
    messagingSenderId: '236031969412',
    projectId: 'notes-3a7e8',
    storageBucket: 'notes-3a7e8.appspot.com',
    iosBundleId: 'com.example.notes',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAAQYfoz0KA6CZW5Y_ctmDPHTKm98xHpP0',
    appId: '1:236031969412:ios:5c336c9560555ea0605ad1',
    messagingSenderId: '236031969412',
    projectId: 'notes-3a7e8',
    storageBucket: 'notes-3a7e8.appspot.com',
    iosBundleId: 'com.example.notes.RunnerTests',
  );
}
