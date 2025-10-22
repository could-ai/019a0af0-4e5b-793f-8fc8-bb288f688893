import 'package:flutter/material.dart';

void main() {
  runApp(const AternosApp());
}

class AternosApp extends StatelessWidget {
  const AternosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aternos-like Server Hosting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFF1a1a1a),
        colorScheme: const ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.blueAccent,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF2a2a2a),
          foregroundColor: Colors.white,
        ),
        cardColor: const Color(0xFF2a2a2a),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          headlineMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ServersPage(),
    ConsolePage(),
    FilesPage(),
    SettingsPage(),
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
        title: const Text('Aternos-like Hosting'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Placeholder for user account
            },
          ),
        ],
      ),
      body: Row(
        children: [
          NavigationRail(
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            labelType: NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.dns),
                label: Text('Servers'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.terminal),
                label: Text('Console'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.folder),
                label: Text('Files'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          Expanded(
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
    );
  }
}

class ServersPage extends StatelessWidget {
  const ServersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Your Servers',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Placeholder for creating server
            },
            child: const Text('Create New Server'),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: const [
                ServerCard(
                  name: 'My Minecraft Server',
                  status: 'Offline',
                  players: '0/20',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ServerCard extends StatelessWidget {
  const ServerCard({
    super.key,
    required this.name,
    required this.status,
    required this.players,
  });

  final String name;
  final String status;
  final String players;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(name),
        subtitle: Text('Status: $status | Players: $players'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                // Placeholder for start/stop
              },
              child: Text(status == 'Online' ? 'Stop' : 'Start'),
            ),
          ],
        ),
      ),
    );
  }
}

class ConsolePage extends StatelessWidget {
  const ConsolePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Server Console',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Console output would appear here...\n> Server started\n> Player joined\n',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FilesPage extends StatelessWidget {
  const FilesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'File Manager',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Card(
              child: Center(
                child: Text('File browser would be here'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Server Settings',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Expanded(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Server Name: My Server'),
                    SizedBox(height: 8),
                    Text('Version: 1.20.1'),
                    SizedBox(height: 8),
                    Text('Gamemode: Survival'),
                    SizedBox(height: 8),
                    Text('Difficulty: Normal'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
