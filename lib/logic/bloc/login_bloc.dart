import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:mocka/data/repositories/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(LoginInitial()) {
    on<LogInRequired>((event, emit) async {
      emit(LoginLoading());
      await Future.delayed(const Duration(seconds: 5));
      try {
        if (event.email.isEmpty || event.password.isEmpty) {
          emit(const LoginFailure('Email and password cannot be empty'));
          return;
        }

        if (await _authRepository.hasPassword) {
          final isValid = await _authRepository.validateLocalPassword(
            event.password,
          );
          if (isValid) {
            emit(LoginSuccess());
          } else {
            emit(const LoginFailure('Invalid password'));
          }
        } else {
          await _authRepository.persistPassword(event.password);
          emit(LoginSuccess());
        }
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });

    on<LogOutRequired>((event, emit) async {
      emit(LoginInitial());
    });
  }
}
