
import 'package:flutter/material.dart';
import 'package:gerador_senhas/app/components/password_component.dart';
import '../controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController urlController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController keyController = TextEditingController();
  final TextEditingController passwordGeneratedController =
      TextEditingController();
  late bool passwordVisibility;
  late HomeController homeController;

  @override
  void initState() {
    super.initState();
    homeController = HomeController(urlController, userIdController,
        keyController, passwordGeneratedController);
    passwordVisibility = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Gerador de Senhas'),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(
              right: 12.0, left: 12.0, top: 80.0, bottom: 12.0),
          child: ListView(children: [
            TextField(
              controller: urlController,
              onChanged: (text) {
                setState(() {
                  text = text;
                });
              },
              decoration: InputDecoration(
                errorText: homeController.errorTextUrl,
                prefixIcon: const Icon(Icons.add_link),
                labelText: 'URL do Site',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: userIdController,
              onChanged: (text) {
                setState(() {
                  text = text;
                });
              },
              decoration: InputDecoration(
                errorText: homeController.errorTextUserId,
                prefixIcon: const Icon(Icons.account_circle),
                labelText: 'Usuário',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: keyController,
              onChanged: (text) {
                setState(() {
                  text = text;
                });
              },
              decoration: InputDecoration(
                errorText: homeController.errorTextKey,
                prefixIcon: const Icon(Icons.lock),
                labelText: 'Palavra Chave',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
                onPressed: () {
                  if (homeController.errorTextKey == null &&
                      homeController.errorTextUrl == null &&
                      homeController.errorTextUserId == null) {
                    setState(() {
                      passwordVisibility = true;
                    });
                    homeController.generatePassword();
                  }
                },
                child: const Text('Gerar Senha')),
            const SizedBox(height: 12.0),
            Visibility(
                visible: passwordVisibility,
                child: GeneratedPassword(
                  controller: passwordGeneratedController,
                )),
          ]),
        ),
      ),
    );
  }
}
