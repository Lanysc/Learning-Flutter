import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

class HomeController {
  final TextEditingController urlController;
  final TextEditingController userIdController;
  final TextEditingController keyController;
  final TextEditingController passwordGeneratedController;

  HomeController(this.urlController, this.userIdController, this.keyController,
      this.passwordGeneratedController);

  void generatePassword() {
    String url = urlController.text;
    String user = userIdController.text;
    String password = keyController.text;
    String result = _encrypt(url, user, password);

    passwordGeneratedController.text = result;
  }

  String _encrypt(String url, String userId, String key) {
    var especialChars = ['#', '@', '_'];
    var encrypted = '';

    userId = _transformUserId(userId);
    url = _transformUrl(url);

    userId = _caesarCipher(userId, 2);
    url = _caesarCipher(url, 2);

    userId = _viginerCipher(userId, key);
    url = _viginerCipher(url, key);

    encrypted = url[0].toUpperCase() + url[1];
    encrypted += (userId.codeUnitAt(0) - 97).toString() +
        ((userId.codeUnitAt(1) - 97) % 10).toString();
    encrypted += userId[0] + userId[userId.length-1].toUpperCase();
    encrypted += ((url.codeUnitAt(0) - 97) % 10).toString() +
        (url.codeUnitAt((url.length-1)) - 97).toString();
    encrypted += especialChars[(url.codeUnitAt(0) - 97) % 3];

    return encrypted;
  }

  String _transformUrl(String url) {
    var urlWithoutHttp = url.replaceAll('https://', '');
    var urlWithoutHttp2 = urlWithoutHttp.replaceAll('www.', '');
    var urlWithoutHttp3 = urlWithoutHttp2.split('.')[0];
    return urlWithoutHttp3.toLowerCase();
  }

  String _transformUserId(String userID) {
    var userIDTransformed = '';

    for (var i = 0; i < userID.length && userID[i] != '@'; i++) {
      if (isAlpha(userID[i])) {
        userIDTransformed += userID[i];
      }
    }
    return userIDTransformed.toLowerCase();
  }

  String _caesarCipher(String word, int key) {
    var cipher = '';
    for (var i = 0; i < word.length; i++) {
      var wordChar = word.codeUnitAt(i) - 97;
      var keyChar = key % 26;
      cipher += String.fromCharCode(((wordChar + keyChar) % 26 + 97));
    }
    return cipher;
  }

  String _viginerCipher(String word, String key) {
    var cipher = '';
    for (var i = 0; i < word.length; i++) {
      var wordChar = word.codeUnitAt(i) - 97;
      var keyChar = key.codeUnitAt(i % key.length) - 97;
      cipher += String.fromCharCode(((wordChar + keyChar) % 26 + 97));
    }
    return cipher;
  }

  String? get errorTextUserId {
    if (userIdController.text.isEmpty) {
      return 'Por favor, informe o usuário';
    }
    if (!isAlpha(userIdController.text[0])) {
      return 'Usuário inválido';
    }
    return null;
  }

  String? get errorTextUrl {
    if (urlController.text.isEmpty) {
      return 'Por favor, informe a URL';
    }
    return null;
  }

  String? get errorTextKey {
    if (keyController.text.isEmpty) {
      return 'Por favor, informe a chave';
    }
    for (var i = 0; i < keyController.text.length; i++) {
      if (!isAlpha(keyController.text[i])) {
        return 'Chave inválida';
      }
    }
    return null;
  }
}
