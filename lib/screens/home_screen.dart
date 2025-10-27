import 'package:dosee/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dosee/components/ui/private/app_bar_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    onPressed() {}

    return AppBarPage(
      title: "Meus lembretes",
      showLeading: false,
      children: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              // TextButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/login');
              //   },
              //   child: Text('login'),
              // ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/about');
                },
                child: Text('about'),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 32,
            child: FloatingActionButton(
              onPressed: onPressed,
              backgroundColor: AppColors.blueLight1,

              child: (Icon(Icons.add)),
            ),
          ),
        ],
      ),
    );
  }
}


// Column(
//             children: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/login');
//                 },
//                 child: Text('login'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/team');
//                 },
//                 child: Text('equipe'),
//               ),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/about');
//                 },
//                 child: Text('about'),
//               ),
//             ],
//           )