import 'package:chat/services/auth/auth_service.dart';
import 'package:chat/components/my_button.dart';
import 'package:chat/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  
  final void Function()? onTap;
  
  LoginPage({
    super.key,
    required this.onTap,
    });

  void login(BuildContext context) async {
    final authService = AuthService();

    try{
      await authService.signInWithEmailPassword(_emailController.text, _pwController.text);
    }
    catch (e){
      showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
       )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333B6B),//Colors.grey.shade300,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon(
            //   Icons.message,
            //   size: 60,
            //   color: Colors.grey.shade500,
            // ),
            Text(
              "ATHLETICA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontFamily: "AlfaSlabOne",
              ),
            ),
            
            
            Text(
              "B  A  S  K  E  T  B  A  L  L",
              style: TextStyle(
                color:  Colors.white,
                fontFamily: "Afacad",
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ), 
            ),

            const SizedBox(height: 25,),

            MyTextfield(
              hintText: "Почта", 
              obscureText: false,
              controller: _emailController,
              ),

            const SizedBox(height: 10,),

            MyTextfield(
              hintText: "Пароль", 
              obscureText: true,
              controller: _pwController,
              ),

             const SizedBox(height: 25,),

             MyButton(
              text: Text(
                "Войти",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => login(context),
              ),

              const SizedBox(height: 35,),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(
                    "Нет аккаунта?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Afacad",
                    ),
                    ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Регистрация",
                       style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: "Afacad",
                        ),
                      ),
                  ),
                ],
              ),


          ],
        ),
      ),
    );
  }
}