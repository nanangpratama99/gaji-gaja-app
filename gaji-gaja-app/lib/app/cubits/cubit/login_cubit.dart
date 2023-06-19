import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState.unauthenticated());

  void login(int rule) {
    if (rule == 1) {
      emit(const LoginState.authenticated());
    } else {
      emit(const LoginState.authenticated1());
      print(rule);
    }
  }

  void logout(int i) {
    emit(const LoginState.unauthenticated());
  }
}
