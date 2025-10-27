import 'package:flutter/material.dart';

class AppBarPage extends StatelessWidget {
  final Widget children;
  final bool? showLeading;
  final String title;
  final Drawer? drawer;

  const AppBarPage({
    super.key,
    required this.children,
    required this.title,
    this.showLeading = true,
    this.drawer,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        // centerTitle: ,
        leading: showLeading! && Navigator.canPop(context)
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back),
              )
            : null,
        // automaticallyImplyLeading: true,
      ),
      drawer: drawer,
      body: children,
    );
  }
}
