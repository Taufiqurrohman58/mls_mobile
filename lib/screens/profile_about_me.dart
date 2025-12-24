import 'package:flutter/material.dart';

class ProfileAboutMe extends StatelessWidget {
  const ProfileAboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          Text(
            "Informasi User",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 20),
          Text("Email address", style: TextStyle(fontSize: 14)),
          Text(
            "taufiqurrohman@365.telkomuniversity.ac.id",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Text("Program Studi", style: TextStyle(fontSize: 14)),
          Text(
            "S1 Teknik Informatika",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Text("Fakultas", style: TextStyle(fontSize: 14)),
          Text("Fakultas Teknik", style: TextStyle(fontSize: 14)),
          SizedBox(height: 20),
          Text(
            "Aktivitas Login",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(height: 20),
          Text("First access to site", style: TextStyle(fontSize: 14)),
          Text(
            "Monday, 7 September 2020, 9:27 AM  (288 days 12 hours)",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Text("Last access to site", style: TextStyle(fontSize: 14)),
          Text(
            "Tuesday, 22 June 2021, 9:44 PM  (now)",
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 40),
          GestureDetector(
            onTap: () {
              // TODO: logout logic
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/ic_logout.png',
                      width: 28,
                      height: 30,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'Logout',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
