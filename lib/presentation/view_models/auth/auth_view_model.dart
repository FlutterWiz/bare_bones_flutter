import 'package:bare_bones_flutter/core/di/dependency_injector.dart';
import 'package:bare_bones_flutter/core/interfaces/i_auth_repository.dart';
import 'package:bare_bones_flutter/domain/models/user.dart';
import 'package:bare_bones_flutter/presentation/view_models/auth/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModelProvider = NotifierProvider<AuthViewModel, AuthState>(() => AuthViewModel());

class AuthViewModel extends Notifier<AuthState> {
  late final IAuthRepository authRepo;

  @override
  AuthState build() {
    authRepo = getIt<IAuthRepository>();

    return AuthState.initial();
  }

  Future<void> createUserWithEmailAndPassword({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      // Simulate a delay for loading indicator demonstration
      await Future.delayed(const Duration(seconds: 2));

      final userCredential = await authRepo.createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        final user = User(email: userCredential.user?.email ?? '', uid: userCredential.user?.uid ?? '');
        state = state.copyWith(isLoading: false, user: user);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  Future<void> signInWithEmailAndPassword({required String email, required String password}) async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      final userCredential = await authRepo.signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        final user = User(email: userCredential.user?.email ?? '', uid: userCredential.user?.uid ?? '');
        state = state.copyWith(isLoading: false, user: user, isLoggedIn: true);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString(), isLoggedIn: false);
    }
  }

  Future<void> signOut() async {
    state = state.copyWith(isLoading: true);

    try {
      await Future.delayed(const Duration(seconds: 2));

      await authRepo.signOut();
      state = state.copyWith(isLoading: false, isLoggedIn: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }
}
