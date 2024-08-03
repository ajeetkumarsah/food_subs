import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_subs/data/repo/kitchen_repo.dart';
import 'package:food_subs/view/auth/bloc/auth_event.dart';
import 'package:food_subs/view/auth/bloc/auth_state.dart';

import 'dart:convert';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Repository repository;
  AuthBloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLogin);
    on<RegisterEvent>(_onRegister);
  }

  Future<void> _onLogin(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await repository.login(event.email, event.password);
      debugPrint('==>Email:${event.email}  Password:${event.password}');
      if (response.statusCode == 200) {
        if (jsonDecode(response.body)["status"]) {
          String userId = jsonDecode(response.body)["data"]["_id"];
          repository.saveUserId(userId);
          emit(AuthSuccess());
        }
        emit(AuthFailure(message: jsonDecode(response.body)['message']));
      } else {
        emit(AuthFailure(message: jsonDecode(response.body)['message']));
      }
    } catch (error) {
      emit(AuthFailure(message: error.toString()));
    }
  }

  Future<void> _onRegister(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final response = await repository.register(
          event.name, event.email, event.phone, event.password);
      if (response.statusCode == 200) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure(message: jsonDecode(response.body)['message']));
      }
    } catch (error) {
      emit(AuthFailure(message: error.toString()));
    }
  }
  // Stream<AuthState> mapEventToState(AuthEvent event) async* {
  //   if (event is LoginEvent) {
  //     yield* _mapLoginEventToState(event);
  //   } else if (event is RegisterEvent) {
  //     yield* _mapRegisterEventToState(event);
  //   }
  // }

  // Stream<AuthState> _mapLoginEventToState(LoginEvent event) async* {
  //   yield AuthLoading();
  //   try {
  //     final http.Response response =
  //         await repository.login(event.email, event.password);
  //     if (response.statusCode == 200) {
  //       yield AuthSuccess();
  //     } else {
  //       yield AuthFailure(message: json.decode(response.body)['message']);
  //     }
  //   } catch (e) {
  //     yield AuthFailure(message: 'An error occurred. Please try again.');
  //   }
  // }

  // Stream<AuthState> _mapRegisterEventToState(RegisterEvent event) async* {
  //   yield AuthLoading();
  //   try {
  //     final response = await http.post(
  //       Uri.parse('http://your_api_endpoint/register'),
  //       body: {
  //         'name': event.name,
  //         'email': event.email,
  //         'phone': event.phone,
  //         'password': event.password
  //       },
  //     );
  //     if (response.statusCode == 200) {
  //       yield AuthSuccess();
  //     } else {
  //       yield AuthFailure(message: json.decode(response.body)['message']);
  //     }
  //   } catch (e) {
  //     yield AuthFailure(message: 'An error occurred. Please try again.');
  //   }
  // }
}
