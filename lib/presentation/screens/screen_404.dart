import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen404 extends StatelessWidget {
  const Screen404({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "404",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "No se encontró la página",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () => context.go("/home"),
              child: Text(
                "Regresar",
                style: GoogleFonts.roboto(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
