// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
    apiKey: 'AIzaSyAXXIDZFOGgZcvIUsUoKWEAyzLpGS2OTjE',
    appId: '1:223564369184:web:6005ebb8d1b7598c051b45',
    messagingSenderId: '223564369184',
    projectId: 'setoran-66735',
    authDomain: 'setoran-66735.firebaseapp.com',
    storageBucket: 'setoran-66735.firebasestorage.app',
    measurementId: 'G-VZHNNF00TD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDmBd5_L7xurMeKe2X4X3frTXpwvAtgf18',
    appId: '1:223564369184:android:71cbe9304b3fea91051b45',
    messagingSenderId: '223564369184',
    projectId: 'setoran-66735',
    storageBucket: 'setoran-66735.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBVbW2BD5_7Z5RUwzy-Dvn63030w3bgizM',
    appId: '1:223564369184:ios:88569e514effbe0a051b45',
    messagingSenderId: '223564369184',
    projectId: 'setoran-66735',
    storageBucket: 'setoran-66735.firebasestorage.app',
    iosBundleId: 'com.example.tubesMobpro',
  );
}