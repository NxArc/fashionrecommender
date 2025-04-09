import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'firebase_options.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return windows;
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
    apiKey: 'AIzaSyCdzYe4iWhtXK8pRFR6yIFvArXBbG930-g',
    appId: '1:220600408717:web:6ecf46f26888faa4f920c4',
    messagingSenderId: '220600408717',
    projectId: 'mixnslay-5f54f',
    authDomain: 'mixnslay-5f54f.firebaseapp.com',
    storageBucket: 'mixnslay-5f54f.firebasestorage.app',
    measurementId: 'G-VMJNJR3N1Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCxw5kc2uUZcYHZT2WBv6NnR3j9MX-qy-U',
    appId: '1:220600408717:android:d3939619abd30bdaf920c4',
    messagingSenderId: '220600408717',
    projectId: 'mixnslay-5f54f',
    storageBucket: 'mixnslay-5f54f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0v9BzWsVLDsET8RoXlVWw26IHod193fk',
    appId: '1:220600408717:ios:8d204106222be135f920c4',
    messagingSenderId: '220600408717',
    projectId: 'mixnslay-5f54f',
    storageBucket: 'mixnslay-5f54f.firebasestorage.app',
    iosBundleId: 'com.example.fasionrecommender',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB0v9BzWsVLDsET8RoXlVWw26IHod193fk',
    appId: '1:220600408717:ios:8d204106222be135f920c4',
    messagingSenderId: '220600408717',
    projectId: 'mixnslay-5f54f',
    storageBucket: 'mixnslay-5f54f.firebasestorage.app',
    iosBundleId: 'com.example.fasionrecommender',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCdzYe4iWhtXK8pRFR6yIFvArXBbG930-g',
    appId: '1:220600408717:web:55afd8bac41b90b3f920c4',
    messagingSenderId: '220600408717',
    projectId: 'mixnslay-5f54f',
    authDomain: 'mixnslay-5f54f.firebaseapp.com',
    storageBucket: 'mixnslay-5f54f.firebasestorage.app',
    measurementId: 'G-X1YC0ZBB15',
  );
}
