import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ================= MyApp ==================
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Phone Auth Demo',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: AddPhoneScreen(),
    );
  }
}

// ================= Screen 1 ==================
class AddPhoneScreen extends StatefulWidget {
  @override
  State<AddPhoneScreen> createState() => _AddPhoneScreenState();
}

class _AddPhoneScreenState extends State<AddPhoneScreen> {
  final TextEditingController phoneController = TextEditingController();

  bool _isValidPhone(String phone) {
    phone = phone.trim();
    if (phone.startsWith("9627") && phone.length == 12) {
      return true;
    } else if (phone.startsWith("07") && phone.length == 10) {
      return true;
    }
    return false;
  }

  void _navigateToOtp(BuildContext context, String phone) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 600),
        pageBuilder: (context, animation, secondaryAnimation) =>
            VerifyOtpScreen(phone: phone),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0); // من اليمين
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve),
          );

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Add phone number",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: "Phone number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String phone = phoneController.text;
                  if (_isValidPhone(phone)) {
                    _navigateToOtp(context, phone);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid phone number")),
                    );
                  }
                },
                child: Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= Screen 2 ==================
class VerifyOtpScreen extends StatefulWidget {
  final String phone;
  VerifyOtpScreen({required this.phone});

  @override
  State<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends State<VerifyOtpScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Text(
                "Verify Phone",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Enter the code sent to ${widget.phone}",
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
              SizedBox(height: 30),
              TextField(
                controller: otpController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "OTP Code",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String otp = otpController.text.trim();
                  if (otp.length == 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Phone Verified! ✅")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Invalid OTP code ❌")),
                    );
                  }
                },
                child: Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
