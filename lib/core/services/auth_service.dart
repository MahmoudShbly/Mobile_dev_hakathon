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
  // حالياً نستخدم الوضع الوهمي (Mock Mode) لبعض العمليات في حالة عدم الربط الكامل
  static const bool _isMockMode = true;

  // تسجيل مستخدم حالي (حقيقي أو وهمي)
  static MockUser? _currentUser;

  // Google Sign-In instance
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email', 'profile'],
  );

  // بيانات المستخدمين الوهمية للاختبار
  final Map<String, Map<String, dynamic>> _mockUsersData = {
    'khaled@example.com': {
      'uid': 'user_123',
      'name': 'خالد خالد',
      'role': 'user',
      'email': 'khaled@example.com',
      'password': '12345678',
    },
    'test@test.com': {
      'uid': 'user_456',
      'name': 'مستخدم تجريبي',
      'role': 'user',
      'email': 'test@test.com',
      'password': 'password123',
    },
  };

  // ══════════════════════════════════════════════
  // تسجيل الدخول بحساب Google (حقيقي)
  // ══════════════════════════════════════════════
  Future<MockUser?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        debugPrint('Google Sign-In: المستخدم ألغى العملية');
        return null;
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final firebaseUser = userCredential.user;
        
        if (firebaseUser != null) {
          _currentUser = MockUser(
            uid: firebaseUser.uid,
            email: firebaseUser.email,
            displayName: firebaseUser.displayName,
            photoURL: firebaseUser.photoURL,
          );
          return _currentUser;
        }
      } catch (firebaseError) {
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
  // إنشاء حساب (Email/Password)
  // ══════════════════════════════════════════════
  Future<dynamic> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    if (_isMockMode) {
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = MockUser(
        uid: 'new_user_${DateTime.now().millisecondsSinceEpoch}',
        displayName: name,
        email: email,
      );
      return _currentUser;
    } else {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    }
  }

  // ══════════════════════════════════════════════
  // تسجيل الدخول (Email/Password)
  // ══════════════════════════════════════════════
  Future<dynamic> login({
    required String email,
    required String password,
  }) async {
    if (_isMockMode) {
      await Future.delayed(const Duration(seconds: 1));
      
      final String trimmedEmail = email.trim();
      if (_mockUsersData.containsKey(trimmedEmail) && _mockUsersData[trimmedEmail]?['password'] == password) {
        final userData = _mockUsersData[trimmedEmail]!;
        _currentUser = MockUser(
          uid: userData['uid'],
          displayName: userData['name'],
          email: userData['email'],
        );
        return _currentUser;
      }
      throw Exception('wrong-password');
    } else {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }
  }

  // ══════════════════════════════════════════════
  Future<void> logout() async {
    try {
      if (await _googleSignIn.isSignedIn()) {
        await _googleSignIn.signOut();
      }
      try {
        await FirebaseAuth.instance.signOut();
      } catch (_) {}
    } catch (e) {
      debugPrint('Logout error: $e');
    }
    _currentUser = null;
  }

  // ══════════════════════════════════════════════
  // الحصول على بيانات المستخدم الحالي
  // ══════════════════════════════════════════════
  Future<Map<String, dynamic>> getUserData() async {
    final firebaseUser = FirebaseAuth.instance.currentUser;
    if (firebaseUser != null) {
      return {
        'uid': firebaseUser.uid,
        'name': firebaseUser.displayName ?? 'مستخدم جوجل',
        'email': firebaseUser.email ?? '',
        'photoURL': firebaseUser.photoURL ?? '',
        'role': 'user',
      };
    }

    if (_currentUser != null) {
      return {
        'uid': _currentUser!.uid,
        'name': _currentUser!.displayName ?? 'مستخدم دواء',
        'email': _currentUser!.email ?? '',
        'photoURL': _currentUser!.photoURL ?? '',
        'role': 'user',
      };
    }
    
    throw Exception('No user logged in');
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
