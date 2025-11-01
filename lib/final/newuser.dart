import 'package:flutter/material.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? gender;
  String? selectedGovernorate;
  DateTime? selectedDate;

  final jordanGovernorates = [
    'Amman',
    'Irbid',
    'Zarqa',
    'Balqa',
    'Madaba',
    'Aqaba',
    'Mafraq',
    'Jerash',
    'Ajloun',
    'Karak',
    'Tafilah',
    'Ma\'an',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ),
              SizedBox(height: 30),
              _buildTextField("Full name"),
              _buildTextField("Email"),
              _buildTextField("Password", obscure: true),

              // Governorate Dropdown
              _buildGovernorateDropdown(),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildGenderOption("Male"),
                  SizedBox(width: 20),
                  _buildGenderOption("Female"),
                ],
              ),
              SizedBox(height: 20),

              // Replace Day / Month / Year with Date Picker
              Center(child: _buildDatePicker("Wedding Date (optional)")),

              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // تنفيذ عند الضغط على زر Next
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ),
              SizedBox(height: 30), // مسافة لمنع الالتصاق بأسفل الشاشة
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Widget _buildGovernorateDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: 'Governorate',
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text('Select Governorate'),
            value: selectedGovernorate,
            items: jordanGovernorates.map((gov) {
              return DropdownMenuItem(
                value: gov,
                child: Text(gov),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedGovernorate = value;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label) {
    return Row(
      children: [
        Radio<String>(
          value: label,
          groupValue: gender,
          onChanged: (value) {
            setState(() {
              gender = value;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildDatePicker(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () async {
          DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now().add(Duration(days: 30)),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365 * 2)),
          );
          if (picked != null) {
            setState(() => selectedDate = picked);
          }
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            selectedDate == null
                ? "Select Date"
                : "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
          ),
        ),
      ),
    );
  }
}
