import 'package:flutter/material.dart';

import 'api.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<User> _user;

  @override
  void initState() {
    super.initState();
    _user = Api.getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: FutureBuilder<User>(
          future: _user,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                User user = snapshot.data!;
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Welcome, ${user.name}!"),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Api.logout();
                        Navigator.pop(context);
                      },
                      child: Text("Logout"),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
