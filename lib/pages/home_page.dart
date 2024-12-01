import 'package:flutter/material.dart';
import 'cientifica.dart';
import 'normal_page.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // 0 = Normal, 1 = Científica

  final List<Widget> _calculatorScreens = [
    SimpleCalculator(),
    ScientificCalculator(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? "Calculadora Normal" : "Calculadora Científica",
        ),
        centerTitle: true,
      ),
      body: _calculatorScreens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Normal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science),
            label: 'Científica',
          ),
        ],
      ),
    );
  }
}
