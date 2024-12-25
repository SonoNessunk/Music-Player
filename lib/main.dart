import 'package:prova_pala/models/playlist_provider.dart';
import 'package:prova_pala/pages/home_page.dart';
import 'package:prova_pala/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
	runApp(
		MultiProvider(
			providers: [
				ChangeNotifierProvider(create: (context) => ThemeProvider()),
				ChangeNotifierProvider(create: (context) => PlaylistProvider()),
			],
			child: const MyApp(),
		)
	);
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
    // Accedi al ThemeProvider
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: themeProvider.themeData, // Utilizza il tema dal provider
    );
  }
}