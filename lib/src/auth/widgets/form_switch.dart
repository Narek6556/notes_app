import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/src/app/views/home_screen.dart';
import 'package:notes_app/src/auth/viewModel/auth_view_model.dart';
import 'package:notes_app/src/auth/widgets/button_switch.dart';
import 'package:notes_app/src/auth/widgets/toast_message.dart';
import 'package:provider/provider.dart';

class FormSwitch extends StatefulWidget {
  const FormSwitch({super.key});

  @override
  State<FormSwitch> createState() => _ButtonSwitchState();
}

class _ButtonSwitchState extends State<FormSwitch> {
  late final AuthViewModel _viewModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _viewModel = Provider.of<AuthViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: SizedBox(
          height: 40,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_viewModel.formMode == FormMode.login) {
                      _viewModel.validateAll();
                      if (!_viewModel.formErrors.hasErrors) {
                        print(_viewModel.username);
                        print(_viewModel.password);
                        bool result = _viewModel.login({
                          'username': _viewModel.username,
                          'password': _viewModel.password,
                        });
                        print(result);
                        if (!result) {
                          SnackBar snackBar = SnackBar(
                              content: ToastMessage(
                            isSuccess: false,
                            message: 'Please Sign Up first',
                          ));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeScreen(),
                            ),
                          );
                        }
                      }
                    } else {
                      _viewModel.setLoginFormState(FormMode.login);
                    }
                  },
                  child: ButtonSwitch(
                    title: 'Login',
                    isSelected: _viewModel.formMode == FormMode.login,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (_viewModel.formMode == FormMode.signUp) {
                      _viewModel.validateAll();
                      if (!_viewModel.formErrors.hasErrors) {
                        bool result = _viewModel.signUp({
                          'username': _viewModel.username,
                          'email': _viewModel.email,
                          'password': _viewModel.password,
                        });
                        print(result);
                        String message =
                            result ? 'Good' : 'Please Sign Up first';
                        SnackBar snackBar = SnackBar(
                            content: ToastMessage(
                          isSuccess: result,
                          message: message,
                        ));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        if (result) {
                          // _viewModel.username = '';
                          // _viewModel.email = '';
                          // _viewModel.password = '';
                          _viewModel.setLoginFormState(FormMode.login);
                        }
                      }
                    } else {
                      _viewModel.setLoginFormState(FormMode.signUp);
                    }
                  },
                  child: ButtonSwitch(
                    title: 'Sign-up',
                    isSelected: _viewModel.formMode == FormMode.signUp,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
