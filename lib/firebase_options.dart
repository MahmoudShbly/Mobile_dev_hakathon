import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBaKFYpSuKLuQUozZE2I8Sh82d8WDrE_vM',
    appId: '1:298555124245:web:e8fe099f93282fa87bfc1c', // تخمين: تم تغيير android إلى web
    messagingSenderId: '298555124245',
    projectId: 'hack-93e8f',
    authDomain: 'hack-93e8f.firebaseapp.com',
    storageBucket: 'hack-93e8f.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaKFYpSuKLuQUozZE2I8Sh82d8WDrE_vM',
    appId: '1:298555124245:android:e8fe099f93282fa87bfc1c',
    messagingSenderId: '298555124245',
    projectId: 'hack-93e8f',
    storageBucket: 'hack-93e8f.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBaKFYpSuKLuQUozZE2I8Sh82d8WDrE_vM',
    appId: '1:298555124245:ios:e8fe099f93282fa87bfc1c', // تخمين
    messagingSenderId: '298555124245',
    projectId: 'hack-93e8f',
    storageBucket: 'hack-93e8f.firebasestorage.app',
    iosBundleId: 'com.hakk.hack',
  );
}
