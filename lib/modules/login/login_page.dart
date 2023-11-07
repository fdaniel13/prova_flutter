import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prova_flutter/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = Modular.get<LoginController>();
  final userController = TextEditingController();
  final passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 14, 59, 52),
            Color.fromARGB(255, 35, 137, 122),
          ],
        )),
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Usuário',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: userController,
                        validator: (text) {
                          return controller.validateUser(username: text)
                              ? null
                              : "Nome de usuário inválido";
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          'Senha',
                          style: GoogleFonts.openSans(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: passController,
                        validator: (text) {
                          return controller.validatePass(pass: text)
                              ? null
                              : "Senha inválida";
                        },
                        decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock_rounded,
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder()),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
              OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    bool canGoHome = await controller.canLogin(
                        username: userController.text,
                        pass: passController.text);
                    canGoHome ? Modular.to.navigate('/home') : null;
                  }
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.symmetric(horizontal: 48)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 47, 189, 109)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ))),
                child: Text(
                  "Entrar",
                  style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              TextButton(
                  onPressed: () {
                    Modular.to.pushNamed("webPage");
                  },
                  child: Text(
                    "Política de Privacidade",
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
