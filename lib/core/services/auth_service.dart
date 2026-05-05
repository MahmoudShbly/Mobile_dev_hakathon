import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Sign Up
  Future<User?> signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    try {
      // Create user with email if provided, otherwise we'd need phone auth.
      // But for this hackathon/demo, I'll use email if provided or a dummy email based on phone.
      String authEmail = email.isNotEmpty ? email : '$phone@dawaa.com';
      
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: authEmail,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Save additional info to Firestore
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'phone': phone,
          'email': email,
          'uid': user.uid,
          'createdAt': FieldValue.serverTimestamp(),
        });
      }
      return user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Login
  Future<User?> login({
    required String phone,
    required String password,
  }) async {
    try {
      // Since Firebase Auth doesn't support phone+password out of the box (it's usually phone OTP),
      // and the UI shows phone+password, I'll assume we use email (phone@dawaa.com) as a workaround
      // or the user has a custom backend. But for simplicity with Firebase Auth:
      String authEmail = '$phone@dawaa.com';
      
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: authEmail,
        password: password,
      );
      return result.user;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  // Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Get current user data
  Future<DocumentSnapshot> getUserData() async {
    String uid = _auth.currentUser!.uid;
    return await _firestore.collection('users').doc(uid).get();
  }
}
