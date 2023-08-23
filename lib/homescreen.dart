import "package:doodle_maestro/createroom.dart";
import "package:doodle_maestro/joinscreen.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Create a room to play",
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const CreateRoomScreen())),
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width / 3, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color.fromARGB(255, 12, 160, 108))),
                  child: Text(
                    "Create",
                    style: TextStyle(color: const Color.fromARGB(210, 255, 255, 255), fontSize: 17),
                  )),
              ElevatedButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const JoinRoomScreen())),
                  style: ButtonStyle(
                      minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width / 3, 50)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color.fromARGB(255, 65, 35, 130))),
                  child: Text(
                    "Join",
                    style: TextStyle(color: const Color.fromARGB(224, 255, 255, 255), fontSize: 17),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
