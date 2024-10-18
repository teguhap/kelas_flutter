import 'package:flutter/material.dart';
import 'package:mulai_flutter_2/views/home/home.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  TextEditingController teEmailController = TextEditingController();
  TextEditingController tePasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200,
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    image: DecorationImage(
                      image: AssetImage('assets/images/login_bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Welcome Back  👋',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Today is a new day. It\'s your day. You shape it. Sign in to start streaming a movie',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: teEmailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD4D7E3).withOpacity(0.4),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    hintText: 'Example@email.com',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextField(
                  controller: tePasswordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: const Color(0xffD4D7E3).withOpacity(0.4),
                    filled: true,
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    hintText: 'At least 8 Characters',
                    hintStyle: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.blue),
                      )),
                ),
                SizedBox(
                  width: width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff162D3A),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(
                                nama: teEmailController.text,
                              ),
                            ));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Sign in',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        thickness: 0.6,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
