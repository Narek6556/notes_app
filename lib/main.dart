import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/src/app/viewModels/add_note_view_model.dart';
import 'package:notes_app/src/app/viewModels/home_view_model.dart';
import 'package:notes_app/src/app/views/home_screen.dart';
import 'package:notes_app/src/auth/view/auth_screen.dart';
import 'package:notes_app/src/auth/viewModel/auth_view_model.dart';
import 'package:notes_app/src/auth/viewModel/form_error.dart';
import 'package:notes_app/src/shared_preferences/auth_prefs.dart';
import 'package:notes_app/src/shared_preferences/notes_prefs.dart';
import 'package:notes_app/src/store/app_state.dart';
import 'package:notes_app/src/themes/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await AuthPrefs.init();
  NotesPrefs.init();
  runApp(
    MultiProvider(
      providers: [
        Provider<AppState>(
          create: (_) => AppState(),
        ),
        Provider<AuthViewModel>(
          create: (_) => AuthViewModel(),
        ),
        Provider<FormErrorState>(
          create: (_) => FormErrorState(),
        ),
        Provider<AddNewNoteViewModel>(
          create: (_) => AddNewNoteViewModel(),
        ),
        Provider<HomeViewModel>(
          create: (_) => HomeViewModel(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note App',
      theme: AppThemes.light(),
      darkTheme: AppThemes.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: Provider.of<AppState>(context).themeMode,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: Provider.of<AppState>(context).statusBarMode,
        child: Provider.of<AppState>(context).isLoggedIn
            ? HomeScreen()
            : AuthScreen(),
      ),
    );
  }
}
