import 'package:bare_bones_flutter/core/init/router/app_router.dart';
import 'package:bare_bones_flutter/core/interfaces/i_auth_repository.dart';
import 'package:bare_bones_flutter/data/repository/auth_repository.dart';
import 'package:bare_bones_flutter/presentation/blocs/auth/auth_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void injectionSetup() {
  // We call AppRouter for once and register it as a singleton.
  getIt.registerSingleton<AppRouter>(AppRouter());

  // Register Firebase Auth
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Register AuthRepository
  getIt.registerLazySingleton<IAuthRepository>(() => AuthRepository(getIt<FirebaseAuth>()));

  // Register AuthCubit
  getIt.registerFactory<AuthCubit>(() => AuthCubit(getIt<IAuthRepository>()));
}
