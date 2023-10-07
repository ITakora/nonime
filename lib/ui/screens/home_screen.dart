import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nonime/ui/colors/colors.dart';
import 'package:nonime/ui/widgets/recent_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: Text('Nonime',
            style: GoogleFonts.poppins(color: Colors.white, fontSize: 28)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: const Column(children: [RecentWidget()]),
    );
  }
}
