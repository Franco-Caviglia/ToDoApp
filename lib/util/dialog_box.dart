import 'package:flutter/material.dart';
import 'package:myapp_1/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox(
      {super.key,
      required this.controller,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[400],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //get user input;
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add a new task',
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //Save btn;
                MyButton(text: 'Save', onPressed: onSave),

                const SizedBox(
                  width: 10,
                ),
                //Cancel btn;
                MyButton(text: 'Cancel', onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
