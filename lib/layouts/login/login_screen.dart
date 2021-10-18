import 'package:flutter/material.dart';
import 'package:myshop/shared/components/components.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250.0,
            decoration: BoxDecoration(
                color: Colors.red,

                borderRadius:BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                  bottomRight: Radius.circular(50.0),

              )
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("Welcome!",
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                  letterSpacing: 1.0
                )),
                Text("Login to continue",
                    style:TextStyle(
                        fontSize: 18.0,
                        letterSpacing: 1.0,
                      color: Colors.grey
                    ),
                ),
                SizedBox(height: 20.0),

                defaultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validate: (value) {
                      if (value.isEmpty) {
                        return ("email adress must not be empty");
                      }
                      return null;
                    },
                    label: "Email Address",
                    prefix: Icons.email_outlined),

                SizedBox(height: 20.0),

                defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    validate: (value) {
                      if (value.isEmpty) {
                        return ("password must not be empty");
                      }
                      return null;
                    },
                    label: "Password",
                    prefix: Icons.lock_open_outlined),

                defaultTextButton(
                    function: (){},
                    text: "Forget Password?",

                ),
                SizedBox(height: 20.0),

                defaultButton(function: (){},
                    text: "login",
                    width: 250.0,
                    height: 70.0,
                radius:  BorderRadius.horizontal(
                  left: Radius.circular(50.0),
                  right: Radius.circular(50.0),

                )),

              ],
            ),
          )
        ],
      ),
    );
  }
}
