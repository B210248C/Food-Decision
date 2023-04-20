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
    apiKey: 'AIzaSyBaKDq0EHI4t4hGF1Xmf-t-BlwpWo5Qx94',
    appId: '1:594581270530:web:3838fc70f3cfa3d6ebb71b',
    messagingSenderId: '594581270530',
    projectId: 'foodchoicebox',
    authDomain: 'foodchoicebox.firebaseapp.com',
    storageBucket: 'foodchoicebox.appspot.com',
    measurementId: 'G-YTKSG537KB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCAks1YgTNpupWdd0s2s57FyjUIKOhV8o',
    appId: '1:594581270530:android:dc60d6071898985eebb71b',
    messagingSenderId: '594581270530',
    projectId: 'foodchoicebox',
    storageBucket: 'foodchoicebox.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjyqGuD3waA71-pYwpenNAJ_F0uWg9R7k',
    appId: '1:594581270530:ios:543fe9d22ecb92d7ebb71b',
    messagingSenderId: '594581270530',
    projectId: 'foodchoicebox',
    storageBucket: 'foodchoicebox.appspot.com',
    iosClientId: '594581270530-opmhke320fci2f05e30ash9uq6jjhv7k.apps.googleusercontent.com',
    iosBundleId: 'com.example.loginlogout.loginInterface',
  );
}
