import 'package:bottom_navigaton_bar/view_model/viewmodel.dart';
import 'package:flutter/material.dart';

class EditWidget extends StatefulWidget {
  final TextEditingController imageController;
  final TextEditingController fullNameController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final Function reFresh;

  const EditWidget({
    super.key,
    required this.reFresh,
    required this.imageController,
    required this.fullNameController,
    required this.phoneNumberController,
    required this.emailController,
  });

  @override
  State<EditWidget> createState() => _EditWidgetState();
}

class _EditWidgetState extends State<EditWidget> {
  final appService = AppService();

  final model = AppService().model;

  bool isLoading = false;

  bool checkTextEdit() {
    if (widget.imageController.text.isNotEmpty &&
        widget.fullNameController.text.isNotEmpty &&
        widget.phoneNumberController.text.isNotEmpty &&
        widget.emailController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        spacing: 10,
        children: [
          Icon(Icons.person, color: Colors.amber, size: 60),
          TextField(
            controller: widget.imageController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          TextField(
            controller: widget.fullNameController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          TextField(
            controller: widget.phoneNumberController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),

          TextField(
            controller: widget.emailController,
            decoration: InputDecoration(border: OutlineInputBorder()),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "Bekor qilish",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              isLoading
                  ? CircularProgressIndicator()
                  : TextButton(
                    onPressed: () async {
                      if (checkTextEdit()) {
                        setState(() {
                          isLoading = false;
                        });
                        await appService.updateEmail(
                          widget.emailController.text,
                        );
                        await appService.updateFullName(
                          widget.fullNameController.text,
                        );
                        await appService.updateTelephoneNumber(
                          widget.phoneNumberController.text,
                        );
                        await appService.updateImage(
                          widget.imageController.text,
                        );
                        setState(() {
                          widget.reFresh();
                          isLoading = true;
                        });
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Malumotni toldirihs shart!")),
                        );
                      }
                    },
                    child: Text(
                      "Saqlash",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
            ],
          ),
        ],
      ),
    );
  }
}
