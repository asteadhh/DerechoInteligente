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
    apiKey: 'AIzaSyBKtsTEicBjsSZJOl_cLdoOyKb3rKspZO0',
    appId: '1:966796738568:web:35bef57290dd16ec1711bd',
    messagingSenderId: '966796738568',
    projectId: 'derechointeligente-b881f',
    authDomain: 'derechointeligente-b881f.firebaseapp.com',
    storageBucket: 'derechointeligente-b881f.appspot.com',
    measurementId: 'G-8GCC98C1ZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD3bRBKTPVkf18KaeUNRZVB1sQ5Hy-81Gs',
    appId: '1:966796738568:android:48bc3a65e43716471711bd',
    messagingSenderId: '966796738568',
    projectId: 'derechointeligente-b881f',
    storageBucket: 'derechointeligente-b881f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiufzPyQ-qOQ1sk-_SVzjGaxSqk60hat0',
    appId: '1:966796738568:ios:1136ad06f02334441711bd',
    messagingSenderId: '966796738568',
    projectId: 'derechointeligente-b881f',
    storageBucket: 'derechointeligente-b881f.appspot.com',
    iosClientId: '966796738568-36b0p3n3gpt0jsdjhuq345lh4sp9h8nk.apps.googleusercontent.com',
    iosBundleId: 'cl.derechointeligente.portal',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiufzPyQ-qOQ1sk-_SVzjGaxSqk60hat0',
    appId: '1:966796738568:ios:e13c393f38327cd01711bd',
    messagingSenderId: '966796738568',
    projectId: 'derechointeligente-b881f',
    storageBucket: 'derechointeligente-b881f.appspot.com',
    iosClientId: '966796738568-vaeue15ghtqhe1do7edovst36b5v87gj.apps.googleusercontent.com',
    iosBundleId: 'com.example.derechoInteligente',
  );
}
