import 'package:edspertidapp/view/home.dart';
import 'package:edspertidapp/view/mapel/paketsoal.dart';
import 'package:flutter/material.dart';
import 'package:edspertidapp/view/login.dart';
import 'package:edspertidapp/view/register.dart';
import 'package:edspertidapp/view/mapel/listmapel.dart';

void main() {
  // WidgetsFlutterBinding.ensure
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const Home(),
        '/listmapel': (context) => const ListMapel(),
        '/paketsoal': (context) => const PaketSoal(),
      },
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE5E5E5),
        appBarTheme: const AppBarTheme(color: Color(0xff3A7FD5)),
      ),
      // home: const Login(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
