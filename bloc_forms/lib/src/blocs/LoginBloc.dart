import 'dart:async';

import 'package:bloc_forms/src/blocs/Validators.dart';
import 'package:rxdart/rxdart.dart';


class LoginBloc with Validators{

  //Reemplaza streams
  final _emailController =    BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  //Recuperar datos de stream
  Stream<String> get emailStream    => _emailController.stream.transform(validateEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validatePassword);

  //Si existe dato en ambos devuelve true, si es que no, devuelve null
  Stream<bool> get formValidStream => CombineLatestStream.combine2(emailStream, passwordStream, (email, password) => true);

  //Insertar valores al stream
  Function(String) get changeEmail    => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  //Obtener ultimo valor de los streams
  String get getEmail =>    _emailController.value;
  String get getPassword => _passwordController.value;
  
  void dispose() { 
    _emailController?.close();
    _passwordController?.close();
  }
}