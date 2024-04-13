import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'const.dart';

class MyHomePage extends StatefulWidget {
  //WebSocketChannel instance created
  final WebSocketChannel channel;
  const MyHomePage({super.key, required this.channel});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    widget.channel.sink.close(); //closes the websocket connection
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChatLink WebSocket", style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              buildHeight(10),
              TextFormField(
                cursorColor: const Color(0xff6046C5),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(),
                  labelText: "Enter a message",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff6046C5)),
                  ),
                ),
                controller: controller,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter a message";
                  }
                  return null;
                },
              ),

              // StreamBuilder widget listens to the stream and displays the data received
              StreamBuilder(
                stream: widget.channel.stream,
                builder: (context, snapshot) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      snapshot.hasData ? "Message: ${snapshot.data}" : "no",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: const Color(0xff6046C5),
        onPressed: () {
          if (controller.text.isNotEmpty) {
            //sends data to the websocket server
            widget.channel.sink.add(controller.text);

            controller.clear(); //clears the textformfield

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green.withOpacity(0.8),
                content: const Text("Message sent"),
              ),
            );
          } else {
            // reminds the user to write something in the textformfield
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red.withOpacity(0.8),
                content: const Text("You must enter something"),
              ),
            );
          }
        },
        child: const Icon(Icons.send, color: Colors.white),
      ),
    );
  }
}
