import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;
  late TextEditingController locationController;

  @override
  void onInit() {
    super.onInit();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  void updateUserData(
    String firstName,
    String lastName,
    String email,
    String location,
  ) async {
    try {
      // Create a reference to the current user's document
      final userId = 'your_user_id'; // Replace with your logic to get user ID
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(userId);

      // Create an instance of UserData
      Map<String, dynamic> userData = {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "location": location,
      };

      // Update the document with the new data
      await userRef.update(userData);

      // Show success message or handle success
      print('User data updated successfully');
    } catch (e) {
      // Handle error
      print('Error updating user data: $e');
    }
  }
}
