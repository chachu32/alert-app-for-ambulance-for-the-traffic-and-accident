import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class WarnPage extends StatefulWidget {
  const WarnPage({super.key});

  @override
  State<WarnPage> createState() => _WarnPageState();
}

class _WarnPageState extends State<WarnPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor:  Colors.red,title:const Text('Warning',style: TextStyle(color: Colors.white),            ),),
   body: Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: NetworkImage('https://images.unsplash.com/photo-16016625285auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHdoaXRlfGVufDB8fDB8fHww'), // Replace 'https://example.com/background_image.jpg' with the URL of your background image
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: SizedBox(
        width: 300, 
        height: 300, 
        child: Card(
          elevation: 5, 
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Colors.red, width: 2),
            borderRadius: BorderRadius.circular(20), 
          ),
          child: Stack(
            children: [
              const Padding(
                padding: EdgeInsets.all(20), 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Emergency Alert :.      Evacuate Now!. Mandatory evacuation order issued due to Nature of Disaster. Press E-Call  for emergency line and L-call for nearby support',
                      style: TextStyle(fontSize: 20,color: Colors.red),
                    ),
                    SizedBox(height: 20), // Adds some space between text and button
                  ],
                ),
              ),
              Positioned(
                bottom: 8,
                right: 10,
                child: ElevatedButton.icon(
                  onPressed: () async {
                    FlutterPhoneDirectCaller.callNumber('');
                  },
                  icon: const Icon(Icons.phone, color: Colors.white), 
                  label: const Text("L-Call", style: TextStyle(fontSize: 16,color: Colors.white)),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Colors.red), 
                  ),
                ),
              ),
          
            ],
          ),
        ),
      ),
    ),
  ),

    );
  }
}