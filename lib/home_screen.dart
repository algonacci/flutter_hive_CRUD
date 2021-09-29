import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Box friendBox = Hive.box('friend');
  String? name;

  addFriend() async {
    await friendBox.put('name', 'Elon Musk');
  }

  getFriend() async {
    setState(() {
      name = friendBox.get('name');
    });
  }

  updateFriend() async {
    await friendBox.put('name', 'Sundar Pichai');
  }

  deleteFriend() async {
    await friendBox.delete('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hive"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$name'),
            ElevatedButton(onPressed: addFriend, child: const Text('Create')),
            ElevatedButton(onPressed: getFriend, child: const Text('Read')),
            ElevatedButton(
                onPressed: updateFriend, child: const Text('Update')),
            ElevatedButton(
                onPressed: deleteFriend, child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
