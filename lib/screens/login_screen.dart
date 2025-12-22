import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  String _currentLanguage = 'en'; // 'id' for Indonesian, 'en' for English
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    // Simple validation
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Navigate to main screen
    Navigator.pushReplacementNamed(context, '/main');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Background with vector wave at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.20,
            child: Image.asset(
              'assets/images/vector1.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          // Header with diagonal cut
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.35,
            child: ClipPath(
              clipper: DiagonalClipper(),
              child: Image.asset(
                'assets/images/gedung.jpeg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),

          // Floating logo in the center of the diagonal cut
          Positioned(
            top: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFB54847),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/logo_tel.png',
                    width: 60,
                    height: 60,
                  ),
                ),
              ),
            ),
          ),

          // Main content with form
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                  left: 32,
                  right: 32,
                  bottom: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const SizedBox(height: 40),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    // Email input
                    const SizedBox(height: 24),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFB54847),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                      keyboardType: TextInputType.emailAddress,
                    ),

                    // Password input
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                        border: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFFB54847),
                            width: 2,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      style: const TextStyle(fontSize: 16),
                    ),

                    // Login button
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFB01116),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                          elevation: 5,
                          shadowColor: Color(0xFFB01116).withValues(alpha: 0.3),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    // Help text
                    const SizedBox(height: 20),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          _showHelpBottomSheet(context);
                        },
                        child: const Text(
                          'Bantuan ?',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xFFB54847),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showHelpBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Handle bar
                  Center(
                    child: Container(
                      width: 40,
                      height: 4,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),

                  // Language switcher
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildLanguageOption(
                        'ID',
                        'assets/images/indonesia.png',
                        _currentLanguage == 'id',
                        setState,
                      ),
                      const SizedBox(width: 40),
                      _buildLanguageOption(
                        'EN',
                        'assets/images/united-kingdom.png',
                        _currentLanguage == 'en',
                        setState,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // Content - Dynamic based on language
                  if (_currentLanguage == 'en') ...[
                    // English content
                    const Text(
                      'Access only for Lecturers and Students of Telkom University.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SansSerif',
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Login using Microsoft Office 365 Account by following these instructions...',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Username (iGracias Account) added "@365.telkomuniversity.ac.id".',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Strong Password and changes in iGracias.',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 24),

                    // Footer
                    const Text(
                      'CeLOE Helpdesk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SansSerif',
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Email: celoe@telkomuniversity.ac.id',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'WhatsApp: +62 821-1666-3563',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),
                  ] else ...[
                    // Indonesian content
                    const Text(
                      'Akses hanya untuk Dosen dan Mahasiswa Telkom University.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SansSerif',
                      ),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Login menggunakan Akun Microsoft Office 365 dengan mengikuti petunjuk berikut...',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Username (Akun iGracias) ditambahkan "@365.telkomuniversity.ac.id".',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Strong Password dan perubahan di iGracias.',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 24),

                    // Footer
                    const Text(
                      'CeLOE Helpdesk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SansSerif',
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'Email: celoe@telkomuniversity.ac.id',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'WhatsApp: +62 821-1666-3563',
                      style: TextStyle(fontSize: 14, fontFamily: 'SansSerif'),
                    ),
                  ],

                  const SizedBox(height: 24),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildLanguageOption(
    String label,
    String flagAssetPath,
    bool isSelected,
    Function(void Function()) setState,
  ) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentLanguage = label.toLowerCase();
        });
      },
      child: Column(
        children: [
          Container(
            width: 32,
            height: 24,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(2),
              child: Image.asset(
                flagAssetPath,
                width: 28,
                height: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.red : Colors.grey,
            ),
          ),
          if (isSelected)
            Container(
              width: 20,
              height: 2,
              margin: const EdgeInsets.only(top: 4),
              color: Colors.red,
            ),
        ],
      ),
    );
  }
}

class DiagonalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
