import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Auto Expanding Navigation Rail',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  int get index => _index;
  set index(int index) => setState(() => _index = index);

  bool _expanded = false;
  bool get expanded => _expanded;
  set expanded(bool expanded) => setState(() => _expanded = expanded);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Auto Expanding Navigation Rail')),
      body: Row(
        children: [
          MouseRegion(
            onEnter: (_) => expanded = true,
            onExit: (_) => expanded = false,
            child: NavigationRail(
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.one_k),
                  label: Text('One'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.two_k),
                  label: Text('Two'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.three_k),
                  label: Text('Three'),
                )
              ],
              selectedIndex: index,
              extended: expanded,
              onDestinationSelected: (i) => index = i,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('👈 Hover your mouse over there. 👈'),
                Text('Selected index: $index'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
