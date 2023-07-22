import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notes_app/src/auth/utils/curved_rectangle.dart';
import 'package:notes_app/src/auth/viewModel/auth_view_model.dart';
import 'package:notes_app/src/auth/widgets/form_section.dart';
import 'package:notes_app/src/themes/themes.dart';
import 'package:provider/provider.dart';

import '../widgets/form_switch.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final Widget logo = SvgPicture.asset('assets/images/logo.svg');

  late final AuthViewModel _viewModel;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _viewModel = Provider.of<AuthViewModel>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Stack(
                alignment: AlignmentDirectional.topStart,
                children: [
                  CustomPaint(
                    size: Size(MediaQuery.of(context).size.width, 257),
                    painter: CurvedRectangle(
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 57,
                    ),
                    child: logo,
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
              ),
              Column(
                children: [
                  const SizedBox(
                    width: 343,
                    child: FormSection(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    width: 343,
                    child: FormSwitch(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forget Password?',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.textButton,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
