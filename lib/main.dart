import "package:flutter/material.dart";
import "package:web_socket_channel/web_socket_channel.dart";

import "home.dart";
import "login.dart";

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const LoginPage(),
        "/home": (context) => MyHomePage(
              channel: WebSocketChannel.connect(
                Uri.parse("wss://echo.websocket.org"),
              ),
            ),
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
