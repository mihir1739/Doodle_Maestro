import "package:doodle_maestro/widgets/customtextfield.dart";
import "package:flutter/material.dart";

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomnameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Join Room", style: TextStyle(
            color: Colors.black, fontSize: 27,
          ),),
          SizedBox(height: MediaQuery.of(context).size.height*0.08,),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              Controller: _nameController,
              hintText: "Enter Your Name",
            ),
          ),
          const SizedBox(height: 17),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextField(
              Controller: _roomnameController,
              hintText: "Enter Name of the Room",
            ),
          ),
          const SizedBox(height: 17,),
          ElevatedButton(onPressed: () {}, 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 80, 3, 94)),
            minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width / 3, 50)),
            ),
          child: const  Text("Join!",style: TextStyle(
            color: Colors.white, fontSize: 14,
          ),
          ),
          
          
          )
          ]
          ),
      );
  }
}