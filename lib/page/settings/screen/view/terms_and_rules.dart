import 'package:flutter/material.dart';

class RulesAndTermsPage extends StatelessWidget {
  const RulesAndTermsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rules and Terms'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rules and Regulations',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '1. Users must be 18 years or older to register an account.\n\n'
                '2. Ensure all information provided is accurate and up-to-date.\n\n'
                '3. Respect other users and their privacy at all times.\n\n'
                '4. Do not share your login credentials with anyone.\n\n'
                '5. Report any suspicious activities to the support team immediately.\n\n'
                '6. Follow the community guidelines for appropriate behavior.\n\n',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Terms of Service',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '1. By using this service, you agree to comply with our terms and conditions.\n\n'
                '2. We reserve the right to terminate accounts that violate our policies.\n\n'
                '3. We are not responsible for any content posted by users.\n\n'
                '4. Users are responsible for maintaining the confidentiality of their account.\n\n'
                '5. We may update these terms at any time, and users will be notified of significant changes.\n\n'
                '6. Continued use of the service constitutes acceptance of the updated terms.\n\n',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
