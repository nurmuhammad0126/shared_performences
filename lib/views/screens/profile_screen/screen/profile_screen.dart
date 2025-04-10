import 'package:bottom_navigaton_bar/view_model/viewmodel.dart';
import 'package:bottom_navigaton_bar/views/screens/profile_screen/widgets/edit_widget.dart';
import 'package:bottom_navigaton_bar/views/screens/profile_screen/widgets/text_for_profile_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final Function reFresh;
  const ProfileScreen({super.key, required this.reFresh});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final model = AppService().model;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Profile Screen",
          style: TextStyle(
            fontSize: 22,
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250,
            height: 250,
            child: ClipOval(
              child: Image.network(
                model.imageeUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      value:
                          loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 200, color: Colors.grey),
                    ),
                  );
                },
              ),
            ),
          ),
          TextForProfie(title: model.fullName, color: Colors.purpleAccent),

          TextForProfie(
            title: "Tel: ${model.telephoneNumber}",
            color: Colors.blue,
          ),
          TextForProfie(title: "Email: ${model.email}", color: Colors.amber),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final emailController = TextEditingController();
          final imageController = TextEditingController();
          final fullNameController = TextEditingController();
          final phoneNumberController = TextEditingController();

          emailController.text = model.email;
          imageController.text = model.imageeUrl;
          fullNameController.text = model.fullName;
          phoneNumberController.text = model.telephoneNumber;

          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return EditWidget(
                reFresh: () {
                  widget.reFresh;
                  setState(() {});
                },
                imageController: imageController,
                fullNameController: fullNameController,
                phoneNumberController: phoneNumberController,
                emailController: emailController,
              );
            },
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}
