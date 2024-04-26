import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      // Navigate to another screen after successful login
      Navigator.pushReplacementNamed(context, '/weather');
      print('Successfully logged in: ${userCredential.user!.uid}');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
       // print('Invalid email or password.');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Login Failed'),
              content: const Text('Invalid email or password.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
    //    print('Authentication error: ${e.message}');
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:const Text('Login Failed'),
              content: Text('Authentication error: ${e.message}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close dialog
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      //print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Failed'),
            content: Text('An error occurred: $e'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Login',style: TextStyle(color: Colors.white),),
         backgroundColor: const Color.fromARGB(255,67,91,91),
      ),
      body: Container(
        decoration:const BoxDecoration(
    image: DecorationImage(
      image: NetworkImage('https://images.unsplash.com/photo-1576106676137cd?q=80&w=1854&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
      fit: BoxFit.cover,
    ),
  ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration:  InputDecoration(labelText: 'Email' ,
                filled: true,
                fillColor: Colors.white,
                 border: OutlineInputBorder(
        borderSide: const BorderSide(
         // Set the border color
          width: 4.0, // Increase the border thickness
        ),
         borderRadius: BorderRadius.circular(10.0), // Set border radius
            ),
             hintStyle: const TextStyle(color: Color.fromARGB(255, 238, 220, 211)),
                ),
              ),
             const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(hintText:  'Password' ,
                filled: true,
                fillColor: const Color.fromARGB(255, 177, 100, 100),
                border: OutlineInputBorder(
        borderSide: const BorderSide(
             
          width: 4.0, // Increase the border thickness
        ),
        borderRadius: BorderRadius.circular(10.0), // Set border radius
            ),
            hintStyle: const TextStyle(color: Color.fromARGB(255, 209, 90, 31)),
          ),
                obscureText: true,
              ),
             const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _login,
                child: const  Text('Login',style: TextStyle(color: Colors.blue),),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: const Text('New member? Sign up here',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
