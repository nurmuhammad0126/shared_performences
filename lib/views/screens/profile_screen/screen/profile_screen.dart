import 'package:bottom_navigaton_bar/views/screens/profile_screen/widgets/text_for_profile_info.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                "https://avatars.githubusercontent.com/u/194600411?v=4&size=64",
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ),
          TextForProfie(
            title: "Mahmudov Nurmuhammad \nFarhod O'gli",
            color: Colors.black,
          ),

          TextForProfie(title: "Tel: +998 88 111 78 72", color: Colors.blue),
          TextForProfie(
            title: "Email: nurmuhammadmahmudov268@gmail.com",
            color: Colors.amber,
          ),
        ],
      ),

      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: Icon(Icons.edit),
      ),
    );
  }
}
