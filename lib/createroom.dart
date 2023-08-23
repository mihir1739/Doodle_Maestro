import "package:doodle_maestro/paintscreen.dart";
import "package:doodle_maestro/widgets/customtextfield.dart";
import "package:flutter/material.dart";

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomnameController = TextEditingController();
  late String? _maxRounds; 
  late String? _roomSize;

  void createRoom() {
    if(_nameController.text.isNotEmpty && _maxRounds != null && _roomSize != null)
    {
      Map data= {
        "nickname": _nameController.text,
        "name":_roomnameController.text,
        "occupancy": _roomSize,
        "maxRounds": _roomSize
      };
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data,stringFrom: "createRoom")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Create Room", style: TextStyle(
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
          const SizedBox(height: 17),
          DropdownButton<String>(
            focusColor: const Color(0xffF5F6FA),
            items: <String>["2","5","7","10"]
            .map<DropdownMenuItem<String>>(
              (String val) => DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                  style: const TextStyle(color: Colors.black),
                  ),
                  )).toList(),
                  hint: const Text("Select Number of Rounds",
                    style: TextStyle(color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),),
          onChanged: (String? value) {
            setState(() {
              _maxRounds = value;
            });
          }),
          const SizedBox(height: 17,),
          DropdownButton<String>(
            focusColor: const Color(0xffF5F6FA),
            items: <String>["2","3","4","5","6","7","8"]
            .map<DropdownMenuItem<String>>(
              (String val) => DropdownMenuItem(
                value: val,
                child: Text(
                  val,
                  style: const TextStyle(color: Colors.black),
                  ),
                  )).toList(),
                  hint: const Text("Select Number of Rounds",
                    style: TextStyle(color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),),
          onChanged: (String? value) {
            setState(() {
              _roomSize = value;
            });
          }),
          const SizedBox(height: 37,),
          ElevatedButton(onPressed: () => createRoom(), 
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 80, 3, 94)),
            minimumSize: MaterialStatePropertyAll(
                          Size(MediaQuery.of(context).size.width / 3, 50)),
            ),
          child: const  Text("Create!",style: TextStyle(
            color: Colors.white, fontSize: 14,
          ),
          ),
          
          
          )
          ]
          ),
      );
  }
}