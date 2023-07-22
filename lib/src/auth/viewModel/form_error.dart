import 'package:mobx/mobx.dart';

part 'form_error.g.dart';

class FormErrorState = FormErrorStateBase with _$FormErrorState;

abstract class FormErrorStateBase with Store {
  @observable
  String? username;

  @observable
  String? email;

  @observable
  String? password;

  @computed
  bool get hasErrors => username != null || email != null || password != null;
}
