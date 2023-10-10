import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../src.dart';

abstract class AuthRepository {
  Stream<AppUser?> authStateChanges();
  AppUser? get currentUser;
  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<void> signOut();
}

class FirebaseAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  // TODO: implement currentUser
  AppUser? get currentUser => throw UnimplementedError();

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}

class FakeAuthRepository implements AuthRepository {
  @override
  Stream<AppUser?> authStateChanges() => Stream.value(null);

  @override
  AppUser? get currentUser => null;

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
    return;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider.autoDispose<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});