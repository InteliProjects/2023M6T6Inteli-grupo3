import 'package:flutter/material.dart';

class UserState extends ChangeNotifier {
  String? _cieEscola;
  String? _emailFornecedor;
  String? _cnpjFornecedor;
  String? _email;
  String? _emailSeduc;
  String? _senhaSeduc;
  String? _emailTransportadora;
  String? _cnpjTransportadora;

  String? get cieEscola => _cieEscola;
  String? get emailFornecedor => _emailFornecedor;
  String? get cnpjFornecedor => _cnpjFornecedor;
  String? get email => _email;
  String? get emailSeduc => _emailSeduc;
  String? get senhaSeduc => _senhaSeduc;
  String? get emailTransportadora => _emailTransportadora;
  String? get cnpjTransportadora => _cnpjTransportadora;

  void setCieEscola(String cieEscola) {
    _cieEscola = cieEscola;
    notifyListeners();
  }

  void setEmailFornecedor(String emailFornecedor) {
    _emailFornecedor = emailFornecedor;
    notifyListeners();
  }

  void setCnpjFornecedor(String cnpjFornecedor) {
    _cnpjFornecedor = cnpjFornecedor;
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setEmailSeduc(String emailSeduc) {
    _emailSeduc = emailSeduc;
    notifyListeners();
  }

  void setSenhaSeduc(String senhaSeduc) {
    _senhaSeduc = senhaSeduc;
    notifyListeners();
  }

  void setEmailTransportadora(String emailTransportadora) {
    _emailTransportadora = emailTransportadora;
    notifyListeners();
  }

  void setCnpjTransportadora(String cnpjTransportadora) {
    _cnpjTransportadora = cnpjTransportadora;
    notifyListeners();
  }
}