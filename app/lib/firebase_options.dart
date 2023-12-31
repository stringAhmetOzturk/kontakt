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
    apiKey: 'AIzaSyAllYgVkcgPSzdmXHqEkcVf2Ci7p3vQYgc',
    appId: '1:356465475572:web:9c26ae3eba6a87253e03a1',
    messagingSenderId: '356465475572',
    projectId: 'kontakt-d4d5c',
    authDomain: 'kontakt-d4d5c.firebaseapp.com',
    storageBucket: 'kontakt-d4d5c.appspot.com',
    measurementId: 'G-S1J68PLQ1H',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBWTK9Yf2yjONpw4AuYjAHc-QV-PEO6rPc',
    appId: '1:356465475572:android:e5521e3d2cb30e883e03a1',
    messagingSenderId: '356465475572',
    projectId: 'kontakt-d4d5c',
    storageBucket: 'kontakt-d4d5c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAQQu4i9dASNgcqPtVpIvawZopBoGTZfwk',
    appId: '1:356465475572:ios:c789f69d480247793e03a1',
    messagingSenderId: '356465475572',
    projectId: 'kontakt-d4d5c',
    storageBucket: 'kontakt-d4d5c.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAQQu4i9dASNgcqPtVpIvawZopBoGTZfwk',
    appId: '1:356465475572:ios:128690836c7e0ced3e03a1',
    messagingSenderId: '356465475572',
    projectId: 'kontakt-d4d5c',
    storageBucket: 'kontakt-d4d5c.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
