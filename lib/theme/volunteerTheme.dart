import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VolunteerTheme {
  static ThemeData get lightTheme {
    return ThemeData(
        primaryColor: const Color.fromARGB(255, 126, 148, 203),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 113, 200, 184),
          selectionColor: Color.fromARGB(255, 113, 200, 184),
          selectionHandleColor: Color.fromARGB(255, 113, 200, 184),
        ),
        fontFamily: GoogleFonts.mulish().fontFamily,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 126, 148, 203)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              const Color.fromARGB(255, 113, 200, 184)),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return const Color.fromARGB(255, 113, 200, 184)
                    .withOpacity(.04);
              }
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 113, 200, 184)
                    .withOpacity(.12);
              }
              return null; // Defer to the widget's default.
            },
          ),
        )),
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return const Color.fromARGB(255, 113, 200, 184)
                    .withOpacity(.04);
              }

              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed)) {
                return const Color.fromARGB(255, 113, 200, 184)
                    .withOpacity(.12);
              }

              return null; // Defer to the widget's default.
            },
          ),
        )),
        inputDecorationTheme: const InputDecorationTheme(
          floatingLabelStyle:
              TextStyle(color: Color.fromARGB(255, 126, 148, 203)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 126, 148, 203))),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Color.fromARGB(255, 113, 200, 184))),
        ));
  }
}
