import 'package:mobx/mobx.dart';
import 'package:notes_app/src/auth/models/user_model.dart';
import 'package:notes_app/src/shared_preferences/auth_prefs.dart';

import 'form_error.dart';

part 'auth_view_model.g.dart';

enum FormMode {
  login,
  signUp,
}

class AuthViewModel = AuthViewModelBase with _$AuthViewModel;

abstract class AuthViewModelBase with Store {
  FormErrorState formErrors = FormErrorState();

  late List<ReactionDisposer> _disposers;

  @observable
  FormMode formMode = FormMode.login;

  @observable
  String email = '';
  @observable
  String username = '';
  @observable
  String password = '';

  @action
  void validateEmail(String email) {
    if (formMode == FormMode.login) {
      formErrors.email = null;
      return;
    }
    formErrors.email =
        RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email)
            ? null
            : 'Enter Valid Email';
  }

  @action
  void validatePassword(String password) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (password.isEmpty) {
      formErrors.password = 'Please enter password';
    } else {
      formErrors.password =
          !regex.hasMatch(password) ? 'Enter valid password' : null;
    }
  }

  @action
  validateUsername(String username) {
    print('Started Validation');
    if (username.length > 5) {
      formErrors.username = null;
    } else {
      formErrors.username = 'Username should be more than 5 characters';
    }
  }

  @action
  void setLoginFormState(FormMode mode) {
    formMode = mode;
  }

  @action
  bool login(Map<String, String> userData) {
    UserModel? user = AuthPrefs.loginUser(userData);

    if (user != null) {
      AuthPrefs.addUserId(user.id);
      return true;
    }
    return false;
  }

  @action
  bool signUp(Map<String, String> user) {
    final List<String> usernames = AuthPrefs.getUsersUsername();

    if (formMode == FormMode.signUp && usernames.contains(username)) {
      //TODO: handle case when username was taken
      formErrors.username = 'Username already taken';
      return false;
    }
    UserModel newUser = UserModel(
      userName: user['username']!,
      password: user['password']!,
      email: user['email'],
    );
    print(newUser.id);
    AuthPrefs.addUser(newUser);
    return true;
  }

  void setupValidationReactions() {
    _disposers = [
      reaction((_) => username, validateUsername),
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateEmail(email);
    validateUsername(username);
  }
}
