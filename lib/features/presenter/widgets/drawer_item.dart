import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.title, required this.onPressed});

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '-',
          style: GoogleFonts.inter(
            color: const Color(0xFFFCFCFC),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: GoogleFonts.inter(
              color: const Color(0xFFFCFCFC),
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
