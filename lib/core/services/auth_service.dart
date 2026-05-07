import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MockUser {
  final String uid;
  final String? email;
  final String? displayName;
  final String? photoURL;

  MockUser({required this.uid, this.email, this.displayName, this.photoURL});
}

class AuthService {
  // حالياً نستخدم الوضع الوهمي (Mock Mode) لتجاوز مشاكل الاتصال والفيبيز
  // عند الربط الكامل مع Firebase، قم بتغيير هذه القيمة إلى false
  static const bool _isMockMode = true;

  // تسجيل مستخدم وهمي حالي
  static MockUser? _currentUser;

  // Google Sign-In instance مع Client ID المقدم
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    serverClientId: '385014701118-4lc4qe6gd80p25meusb3ncv3l398h0nb.apps.googleusercontent.com',
    scopes: ['email', 'profile'],
  );

  // بيانات المستخدمين الوهمية حسب الأدوار
  final Map<String, Map<String, dynamic>> _mockUsersData = {
    'user_account': {
      'uid': 'mock_user_1',
      'name': 'مريض تجريبي',
      'role': 'user',
      'email': 'user@gmail.com',
      'password': '12345678',
    },
    'pharmacist_account': {
      'uid': 'mock_pharm_1',
      'name': 'صيدلي تجريبي',
      'role': 'pharmacist',
      'email': 'pharmacist@gmail.com',
      'password': '12345678',
    },
    'doctor_account': {
      'uid': 'mock_doc_1',
      'name': 'طبيب تجريبي',
      'role': 'doctor',
      'email': 'doctor@gmail.com',
      'password': '12345678',
    },
    'admin_account': {
      'uid': 'mock_admin_1',
      'name': 'مدير النظام',
      'role': 'admin',
      'email': 'admin@gmail.com',
      'password': '12345678',
    },
  };

  // ══════════════════════════════════════════════
  // تسجيل الدخول بحساب Google
  // ══════════════════════════════════════════════
  Future<dynamic> signInWithGoogle() async {
    try {
      // بدء عملية تسجيل الدخول بحساب Google
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        // المستخدم ألغى عملية تسجيل الدخول
        debugPrint('Google Sign-In: المستخدم ألغى العملية');
        return null;
      }

      // الحصول على بيانات المصادقة
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // إنشاء credential لـ Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // تسجيل الدخول في Firebase
      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final firebaseUser = userCredential.user;
        if (firebaseUser != null) {
          _currentUser = MockUser(
            uid: firebaseUser.uid,
            email: firebaseUser.email,
            displayName: firebaseUser.displayName,
            photoURL: firebaseUser.photoURL,
          );
          debugPrint('Google Sign-In: تم تسجيل الدخول بنجاح - ${firebaseUser.email}');
          return _currentUser;
        }
      } catch (firebaseError) {
        // في حالة فشل Firebase، نستخدم بيانات Google مباشرة
        debugPrint('Firebase Auth failed, using Google data directly: $firebaseError');
        _currentUser = MockUser(
          uid: googleUser.id,
          email: googleUser.email,
          displayName: googleUser.displayName,
          photoURL: googleUser.photoUrl,
        );
        return _currentUser;
      }

      return null;
    } catch (error) {
      debugPrint('Google Sign-In Error: $error');
      rethrow;
    }
  }

  // ══════════════════════════════════════════════
  // Sign Up (Mock)
  // ══════════════════════════════════════════════
  Future<dynamic> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    if (_isMockMode) {
      await Future.delayed(const Duration(seconds: 1)); // محاكاة تأخير الشبكة
      _currentUser = MockUser(uid: 'new_user_${DateTime.now().millisecondsSinceEpoch}', displayName: name);
      return _currentUser;
    }
    return null;
  }

  // ══════════════════════════════════════════════
  // Login (Mock)
  // ══════════════════════════════════════════════
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    if (_isMockMode) {
      await Future.delayed(const Duration(seconds: 1));
      
      Map<String, dynamic>? userData;
      for (var user in _mockUsersData.values) {
        if (user['email'] == email.trim()) {
          userData = user;
          break;
        }
      }

      if (userData != null) {
        if (userData['password'] == password) {
          _currentUser = MockUser(
            uid: userData['uid'],
            displayName: userData['name'],
            email: userData['email'],
          );
          return _currentUser;
        } else {
          throw Exception('wrong-password');
        }
      }
      throw Exception('user-not-found');
    }
    return null;
  }

  // ══════════════════════════════════════════════
  // Logout (يشمل Google Sign-Out)
  // ══════════════════════════════════════════════
  Future<void> logout() async {
    try {
      // تسجيل الخروج من Google
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      // تسجيل الخروج من Firebase
      try {
        await FirebaseAuth.instance.signOut();
      } catch (_) {}
    } catch (e) {
      debugPrint('Logout error: $e');
    }
    _currentUser = null;
  }

  // ══════════════════════════════════════════════
  // Get current user data (Mock)
  // ══════════════════════════════════════════════
  Future<Map<String, dynamic>> getUserData() async {
    if (_isMockMode) {
      if (_currentUser == null) throw Exception('No user logged in');
      
      Map<String, dynamic>? foundData;
      _mockUsersData.forEach((key, value) {
        if (value['uid'] == _currentUser!.uid) {
          foundData = value;
        }
      });
      
      return foundData ?? {
        'name': _currentUser!.displayName ?? 'مستخدم جديد',
        'role': 'user',
        'email': _currentUser!.email ?? '',
        'photoURL': _currentUser!.photoURL ?? '',
      };
    }
    throw Exception('Not implemented in mock');
  }

  // الحصول على المستخدم الحالي
  dynamic get currentUser => _currentUser ?? FirebaseAuth.instance.currentUser;

  // التحقق مما إذا كان المستخدم مسجل عبر Google
  bool get isGoogleUser {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return firebaseUser.providerData.any(
        (provider) => provider.providerId == 'google.com',
      );
    }
    return false;
  }
}
