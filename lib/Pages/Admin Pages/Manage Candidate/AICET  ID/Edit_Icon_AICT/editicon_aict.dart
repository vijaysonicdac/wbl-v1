import 'package:flutter/material.dart';

class Editaicte extends StatefulWidget {
  const Editaicte({super.key});

  @override
  State<Editaicte> createState() => EditaictetState();
}

class EditaictetState extends State<Editaicte> {
  // ignore: non_constant_identifier_names
  String TextField = '';

  @override
  //final screenSize=MediaQuery.of(context).size;
  //final screenWidth=screenSize.width;

  Widget build(BuildContext context) {
    // final screenSize=MediaQuery.of(context).size;
    // final screenHeight=screenSize.height;
    return Card(
      color: const Color.fromARGB(255, 250, 246, 246),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          height: 300,
          color: const Color.fromARGB(255, 222, 231, 223),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit AICTE ID',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(
                  thickness: 0.3,
                  color: Colors.black,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                          filled: true,
                          labelText: 'AICTE ID *',
                          hintText: 'enter aicte id',
                        ),
                        onChanged: (value) {
                          setState(() {
                            TextField = value;
                          });
                        },
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter AICTE ID';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                    onPressed: () {
                      {}
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
