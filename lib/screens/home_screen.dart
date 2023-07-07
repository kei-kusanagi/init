import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void toggleDarkMode() {
    setState(() {
      final themeModel = Provider.of<ThemeModel>(context, listen: false);
      themeModel.isDark = !themeModel.isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context, listen: false);
    Color pickerColor = themeModel.colorTheme;

    void changeColor(Color color) {
      setState(() => pickerColor = color);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: pickerColor,
        title: const Text('Inicio'),
        actions: [
          IconButton(
            iconSize: 20,
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Pick a color!'),
                    content: SingleChildScrollView(
                      child: BlockPicker(
                        pickerColor: pickerColor,
                        onColorChanged: changeColor,
                      ),
                    ),
                    actions: <Widget>[
                      ElevatedButton(
                        child: const Text('Got it'),
                        onPressed: () {
                          setState(() {
                            themeModel.colorTheme = pickerColor;
                          });
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: pickerColor,
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(Icons.color_lens),
          ),
          IconButton(
            icon:
                themeModel.isDark ? Icon(Icons.sunny) : Icon(Icons.nights_stay),
            onPressed: toggleDarkMode,
          ),
        ],
      ),
      ////////////////// TU CODIGO VA AQUI //////////////////
      body: const SizedBox(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigate_next),
        onPressed: () {},
      ),
    );
  }
}
