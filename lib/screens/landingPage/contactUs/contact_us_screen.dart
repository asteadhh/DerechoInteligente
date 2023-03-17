import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

import '../base/home_page_landing.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LandingPageBase(
      widget: Column(
        children: [
          Container(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.45,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/cover.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          ContactUsForm(),
        ],
      ),
    );
  }
}

class ContactUsForm extends StatelessWidget {
  ContactUsForm({
    super.key,
  });

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 450,
        width: 400,
        margin: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 1,
                  color: Colors.grey[300]!)
            ]),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              PlatformText('Contact Us',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(hintText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(hintText: 'Email'),
                validator: (email) {
                  if (email == null || email.isEmpty) {
                    return 'Required*';
                  } else if (!EmailValidator.validate(email)) {
                    return 'Please enter a valid Email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: messageController,
                decoration: const InputDecoration(hintText: 'Message'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '*Required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 45,
                width: 110,
                child: TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: const Color(0xff151534),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final response = await sendEmail(
                          nameController.value.text,
                          emailController.value.text,
                          messageController.value.text);
                      ScaffoldMessenger.of(context).showSnackBar(
                        response == 200
                            ? SnackBar(
                                content: PlatformText('Message Sent!'),
                                backgroundColor: Colors.green)
                            : SnackBar(
                                content:
                                    PlatformText('Failed to send message!'),
                                backgroundColor: Colors.red),
                      );
                      nameController.clear();
                      emailController.clear();
                      messageController.clear();
                    }
                  },
                  child: PlatformText('Send', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future sendEmail(String name, String email, String message) async {
//www.Emailjs.com

  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  const serviceId = 'service_2f0eunl';
  const templateId = 'derechoInteligenteContac';
  const userId = 'bfvlzI61ip-w_ZVkK';
  final response = await http.post(url,
      headers: {
        'Content-Type': 'application/json'
      }, //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message
        }
      }));
  return response.statusCode;
}
