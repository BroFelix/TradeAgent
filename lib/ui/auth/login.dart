import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trade_agent/theme/style.dart';
import 'package:trade_agent/ui/home/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'LogIn',
            style: AppTextStyles.labelTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Пожалуйста введите пароль';
                      }
                      if (value.isEmpty) {
                        return 'Пожалуйста введите логин!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // labelText: 'Логин',
                      label: const Text(
                        'Логин',
                        style: AppTextStyles.loginTextStyle,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.blueAccent,
                          width: 2.0,
                        ),
                      ),
                    ),
                    // autofillHints: const {'sd', 'ds'},
                  ),
                  const SizedBox(height: 12.0),
                  TextFormField(
                    validator: (value) {
                      if (value == null) {
                        return 'Пожалуйста введите пароль';
                      }
                      if (value.isEmpty) {
                        return 'Пожалуйста введите пароль';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: const Text(
                        'Пароль',
                        style: AppTextStyles.loginTextStyle,
                      ),
                      // labelText: 'Пароль',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        // borderSide: const BorderSide(color: Colors.blueAccent, width: 2.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  MaterialButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    height: mediaQuery.size.height * 0.075,
                    minWidth: mediaQuery.size.width,
                    child: const Text(
                      'Вход',
                      style: AppTextStyles.buttonTextStyle,
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ),
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
