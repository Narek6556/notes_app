import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:notes_app/src/auth/viewModel/form_error.dart';
import 'package:notes_app/src/auth/widgets/text_input.dart';
import 'package:provider/provider.dart';

import '../viewModel/auth_view_model.dart';

class FormSection extends StatefulWidget {
  const FormSection({super.key});

  @override
  State<FormSection> createState() => _FormSectionState();
}

class _FormSectionState extends State<FormSection> {
  late final AuthViewModel _viewModel;
  late final FormErrorState _formErrors;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _viewModel = Provider.of<AuthViewModel>(context);
    _viewModel.formErrors = Provider.of<FormErrorState>(context);
    _formErrors = _viewModel.formErrors;
    _viewModel.setupValidationReactions();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (child, animation) {
          final inAnimation = Tween<Offset>(
            begin: const Offset(2.0, 0.0),
            end: Offset.zero,
          ).animate(animation);
          return SlideTransition(
            position: inAnimation,
            child: child,
          );
        },
        child: _viewModel.formMode == FormMode.login
            ? SizedBox(
                key: Key(FormMode.login.toString()),
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Observer(builder: (_) {
                      return TextInput(
                        hint: 'Username',
                        errorMessage: _formErrors.username,
                        onChange: (String username) {
                          _viewModel.username = username;
                        },
                      );
                    }),
                    TextInput(
                      hint: 'Password',
                      errorMessage: _formErrors.password,
                      onChange: (String password) {
                        _viewModel.password = password;
                      },
                    ),
                  ],
                ),
              )
            : SizedBox(
                key: Key(FormMode.signUp.toString()),
                height: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextInput(
                      hint: 'Email',
                      errorMessage: _formErrors.email,
                      onChange: (String email) {
                        _viewModel.email = email;
                      },
                    ),
                    TextInput(
                      hint: 'Username',
                      errorMessage: _formErrors.username,
                      onChange: (String username) {
                        _viewModel.username = username;
                      },
                    ),
                    TextInput(
                      hint: 'Password',
                      errorMessage: _formErrors.password,
                      onChange: (String password) {
                        _viewModel.password = password;
                      },
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
