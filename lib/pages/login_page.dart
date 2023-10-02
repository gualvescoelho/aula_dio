import 'package:aula_dio/pages/main_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController senhaController = TextEditingController(text: "");
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        // MUITO IMPORTANTE PARA NÃO QUEBRAR O APP
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              margin: const EdgeInsets.only(top: 40),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50,),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.network(
                          "https://hermes.digitalinnovation.one/assets/diome/logo.png",
                        ),),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(height: 100),
                  const Text("Ja tem cadastro?", 
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
                  
                  ),
                  const SizedBox(height: 20),
                  const Text("Faça seu login e make the change_",
                  style: TextStyle(fontSize: 14, color: Colors.white),),
                  const SizedBox(height: 50),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    height: 30,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: emailController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(top: 0),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.person, color: Colors.purple,),
                      ),
                    )
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    width: double.infinity, 
                    height: 30, 
                    alignment: Alignment.center,
                    child: TextField(
                      obscureText: isObscureText,
                      controller: senhaController,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(top: 0),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple)
                        ),
                        hintText: "Senha",
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(Icons.lock, color: Colors.purple,),
                        suffixIcon: InkWell(
                          onTap: () {
                            setState(() {
                              isObscureText = !isObscureText;
                            });
                          },
                          child: Icon(
                            isObscureText ? Icons.visibility_off
                            : Icons.visibility, color: Colors.purple,),
                        )
                      ),
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          if(emailController.text.trim() == "email@email.com" &&
                          senhaController.text.trim() ==  "123"){
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login feito com sucesso!"))
                            );
                            Navigator.pushReplacement(context, 
                              MaterialPageRoute(builder: (context) => MainPage())
                            );
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Erro no login!"))
                            );
                          }
                          debugPrint(emailController.text);
                          debugPrint(senhaController.text);
                        }, 
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.purple),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                            )
                          )
                          ),
                        child: const Text("Login", 
                        style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16
                          ),
                        ),
                      ),
                    )
                  ),
                  Expanded(child: Container()),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    height: 30, 
                    alignment: Alignment.center,
                    child: const Text("Esqueci minha senha",
                    style: TextStyle(color: Colors.blue),),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    height: 30, 
                    alignment: Alignment.center,
                    child: const Text("Criar Conta",
                    style: TextStyle(color: Color.fromARGB(255, 50, 147, 53)),),
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}