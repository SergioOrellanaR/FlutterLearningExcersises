

import 'dart:async';

class Validators {

  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink)
    {
      Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp emailRegex = new RegExp(pattern);

      if (!emailRegex.hasMatch(email))
      {
        sink.addError("Email inválido");
      }
      else
      {
        sink.add(email);
      }
    }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (password, sink)
    {
      if (password.length < 6)
      {
        sink.addError("La contraseña debe tener más de 6 caracteres");
      }
      else
      {
        sink.add(password);
      }
    }
  );
  
}