import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferencesWithCache.create(cacheOptions: const SharedPreferencesWithCacheOptions(
    allowList: {'username', 'password'},
  ));

  runApp(Myapp(prefs: prefs));
}

class Myapp extends StatelessWidget {
  final SharedPreferencesWithCache prefs;
  const Myapp({super.key, required this.prefs});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.light,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          brightness: Brightness.dark,
        ),
      ),
      home: MainLogin(prefs: prefs,),
    );
  }
}

class MainLogin extends StatefulWidget {
  final SharedPreferencesWithCache prefs;
  const MainLogin({super.key, required this.prefs});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _savedUsername ='';
  String _savedPassword = '';

  @override
  void initState() {
    super.initState();
    _savedUsername = widget.prefs.getString('username') ?? 'no username saved';
    _savedPassword = widget.prefs.getString('password') ?? 'no password saved';
    _usernameController.text = _savedUsername;
    _passwordController.text = _savedPassword;
  }

  _saveUsername(String username) async {
    await widget.prefs.setString('username', username);

    setState(() => _savedUsername = username);
  }

  _savePassword(String password) async {
    await widget.prefs.setString('password', password);

    setState(() => _savedPassword = password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Shared Preference by 6410' ,),),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Enter your Username',
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Enter your password',
              ),
            ),
            ElevatedButton(onPressed: () {
              _saveUsername(_usernameController.text);
              _savePassword(_passwordController.text);
            }, child: const Text('Login')),
            // debug propose :
            //Text('Saved Username : ${_savedUsername} Saved Password : ${_savedPassword}')
          ],
        ),
      ),
    );
  }
}
