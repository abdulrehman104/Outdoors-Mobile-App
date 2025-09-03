import 'package:flutter/material.dart';
import 'package:cuttingedge/config/routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signUp() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.home,
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              /// ✅ Title
              const Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Sign up to view your tasks and start your workday.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 40),

              /// ✅ Sign Up Form
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInputField(
                      label: "First Name",
                      hint: "Your name",
                      controller: _firstNameController,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: "Last Name",
                      hint: "Your last name",
                      controller: _lastNameController,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: "Email Address",
                      hint: "Enter your email",
                      controller: _emailController,
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    _buildInputField(
                      label: "Password",
                      hint: "Enter your password",
                      controller: _passwordController,
                      obscure: _obscurePassword,
                      toggle: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              /// ✅ Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF61181D),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// ✅ Divider with "OR"
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: Colors.white24, thickness: 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "Or",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.white24, thickness: 1),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// ✅ Google Button
              _socialButton(
                icon: Icons.g_mobiledata,
                label: "Sign Up With Google",
                color: Colors.black,
                borderColor: Colors.white24,
              ),
              const SizedBox(height: 12),

              /// ✅ Facebook Button
              _socialButton(
                icon: Icons.facebook,
                label: "Sign Up With Facebook",
                color: Colors.black,
                borderColor: Colors.white24,
              ),

              const SizedBox(height: 30),

              /// ✅ Login Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(color: Colors.white70),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.login);
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                        color: Color(0xFF61181D),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  /// ✅ Reusable Input Field
  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    bool obscure = false,
    VoidCallback? toggle,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: keyboard,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.black,
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF466B00)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF466B00)),
            ),
            suffixIcon: toggle != null
                ? IconButton(
              icon: Icon(
                obscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.white54,
              ),
              onPressed: toggle,
            )
                : null,
          ),
          validator: (value) =>
          value == null || value.isEmpty ? "Please enter $label" : null,
        ),
      ],
    );
  }

  /// ✅ Social Button
  Widget _socialButton({
    required IconData icon,
    required String label,
    required Color color,
    required Color borderColor,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: borderColor),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: Icon(icon, color: Colors.white, size: 24),
        label: Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    );
  }
}
