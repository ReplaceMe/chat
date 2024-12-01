import 'package:chat/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget{
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmPwController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  
  final void Function()? onTap;

  RegisterPage({
    super.key,
    required this.onTap,

    });

  void register(BuildContext context){
    final _auth = AuthService();

    if(_pwController.text == _confirmPwController.text){
      try{
      _auth.signUpWithEmailPassword(
        _emailController.text,
         _pwController.text,
         _nameController.text,
         );
      } catch(e){
        showDialog(
        context: context, 
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
       )
      );
      }
    }
    else {
      showDialog(
        context: context, 
        builder: (context) => const AlertDialog(
          title: Text("Пароли не совпадают!"),
       )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset : false,

      backgroundColor: const Color(0xFF333B6B),//Colors.grey.shade300,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 100),
        child: 
      Center(
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
             const SizedBox(height: 35,),
            Text(
              "Создание аккаунта",
               style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
            ),

            const SizedBox(height: 25,),

            MyTextfield(
              hintText: "Имя", 
              obscureText: false,
              controller: _nameController,
              ),


            const SizedBox(height: 10,),

            
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

              const SizedBox(height: 10,),

              MyTextfield(
              hintText: "Подтверждение пароля", 
              obscureText: true,
              controller: _confirmPwController,
              ),

             const SizedBox(height: 25,),

             MyButton(
              text: Text(
                "Создать!",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontFamily: "Afacad",
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => register(context),
              ),

              const SizedBox(height: 25,),

               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text(
                    "Уже есть аккаунт?",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: "Afacad",
                    ),
                    ),
                  GestureDetector(
                    onTap: onTap,
                    child: Text(
                      "Вход",
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
      ),
    );
  }
}