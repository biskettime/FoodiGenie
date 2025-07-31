import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodiGenie',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: GoogleFonts.roadRageTextTheme(
          Theme.of(context).textTheme,
        ),
        fontFamily: GoogleFonts.roadRage().fontFamily,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5), // 크림색 배경으로 앱 전체 통일
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: 393,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                // Header with Title
                _buildHeader(),
                
                // Main Content
                _buildMainContent(),
                
                // Bottom spacing
                SizedBox(height: 36),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 45,
      width: 393,
      child: Center(
        child: Text(
          'FoodiGenie',
          style: GoogleFonts.roadRage(
            fontSize: 28,
            fontWeight: FontWeight.w400,
            color: Color(0xFF40392B), // 다크 브라운으로 통일
            letterSpacing: -0.56,
          ),
        ),
      ),
    );
  }

  Widget _buildMainContent() {
    return Column(
      children: [
        // Illustration Area
        _buildIllustration(),
        
        SizedBox(height: 18),
        
        // Social Login Buttons
        _buildSocialButtons(),
        
        SizedBox(height: 18),
        
        // Main Action Buttons
        _buildActionButtons(),
      ],
    );
  }

  Widget _buildIllustration() {
    return Container(
      width: 400,
      height: 232,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 심플한 로고 아이콘
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Color(0xFFC2966B).withOpacity(0.1), // 계정 생성 페이지와 동일한 브라운 톤
                borderRadius: BorderRadius.circular(60),
              ),
              child: Icon(
                Icons.restaurant_menu_rounded,
                size: 60,
                color: Color(0xFF40392B), // 다크 브라운으로 통일
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildSocialButtons() {
    return Column(
      children: [
        // Facebook Button
        _buildSocialButton(
          text: 'Facebook으로 로그인',
          backgroundColor: Color(0xFF3a63ed),
          textColor: Colors.white,
          icon: FontAwesomeIcons.facebookF,
          onPressed: () {
            // Handle Facebook login
          },
        ),
        
        SizedBox(height: 16),
        
        // Google Button
        _buildSocialButton(
          text: 'Google로 로그인',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Color(0xFF40392B),
          borderColor: Color(0xFF6E5C49).withOpacity(0.2), // 계정 생성 페이지와 동일
          icon: FontAwesomeIcons.google,
          onPressed: () {
            // Handle Google login
          },
        ),
        
        SizedBox(height: 16),
        
        // Apple Button
        _buildSocialButton(
          text: 'Apple로 로그인',
          backgroundColor: Color(0xFF40392B), // 계정 생성 페이지와 동일한 다크 브라운
          textColor: Color(0xFFFFFCF5),
          icon: FontAwesomeIcons.apple,
          onPressed: () {
            // Handle Apple login
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 361,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
            side: borderColor != null 
              ? BorderSide(color: borderColor, width: 1)
              : BorderSide.none,
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              FaIcon(
                icon,
                size: 20,
                color: textColor,
              ),
              SizedBox(width: 12),
            ],
            Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Column(
      children: [
        // Primary Login Button
        _buildActionButton(
          text: '로그인',
          backgroundColor: Color(0xFF9AC26B), // 계정 생성 페이지와 동일한 연녹색
          textColor: Colors.white,
          onPressed: () {
            // Handle login
          },
        ),
        
        SizedBox(height: 16),
        
        // Forgot Password Button
        _buildActionButton(
          text: '비밀번호 찾기',
          backgroundColor: Color(0xFFC2966B).withOpacity(0.09), // 계정 생성 페이지와 동일
          textColor: Color(0xFF40392B),
          onPressed: () {
            // Handle forgot password
          },
        ),
        
        SizedBox(height: 16),
        
        // Create Account Button
        _buildActionButton(
          text: '계정 만들기',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Color(0xFF40392B),
          borderColor: Color(0xFF6E5C49).withOpacity(0.2), // 계정 생성 페이지와 동일
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccountScreen()),
            );
          },
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 361,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(36),
            side: borderColor != null 
              ? BorderSide(color: borderColor, width: 1)
              : BorderSide.none,
          ),
          elevation: 0,
        ),
        child: Text(
          text,
          style: GoogleFonts.plusJakartaSans(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

}

class CreateAccountScreen extends StatefulWidget {
  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5), // 로그인 페이지와 동일한 배경색
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFCF5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF40392B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Create Account',
          style: GoogleFonts.plusJakartaSans(
            color: Color(0xFF40392B),
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 20),
              
              // Social Sign Up Buttons (Figma 순서)
              _buildSocialSignUpButtons(),
              
              SizedBox(height: 40),
              
              // Email Sign Up Section
              _buildEmailSignUpSection(),
              
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialSignUpButtons() {
    return Column(
      children: [
        // Facebook Button
        _buildSocialButton(
          text: 'Sign up with Facebook',
          backgroundColor: Color(0xFF3a63ed),
          textColor: Colors.white,
          icon: FontAwesomeIcons.facebookF,
          onPressed: () {
            // Handle Facebook signup
          },
        ),
        
        SizedBox(height: 16),
        
        // Google Button
        _buildSocialButton(
          text: 'Sign up with Google',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Colors.black,
          borderColor: Colors.black.withOpacity(0.12),
          icon: FontAwesomeIcons.google,
          onPressed: () {
            // Handle Google signup
          },
        ),
        
        SizedBox(height: 16),
        
        // Apple Button
        _buildSocialButton(
          text: 'Sign up with Apple',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          icon: FontAwesomeIcons.apple,
          onPressed: () {
            // Handle Apple signup
          },
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String text,
    required Color backgroundColor,
    required Color textColor,
    Color? borderColor,
    IconData? icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 370,
      height: 52,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(48),
            side: borderColor != null 
              ? BorderSide(color: borderColor, width: 1)
              : BorderSide.none,
          ),
          elevation: 0,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              FaIcon(
                icon,
                size: 20,
                color: textColor,
              ),
              SizedBox(width: 12),
            ],
            Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                color: textColor,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailSignUpSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Title
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Create your account',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Color(0xFF40392B),
              letterSpacing: -0.22,
            ),
          ),
        ),
        
        SizedBox(height: 24),
        
        // First Name & Surname Row
        Row(
          children: [
            Expanded(
              child: _buildFigmaTextField(
                controller: _firstNameController,
                hintText: 'First Name',
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: _buildFigmaTextField(
                controller: _surnameController,
                hintText: 'Surname',
              ),
            ),
          ],
        ),
        
        SizedBox(height: 16),
        
        // Mobile Phone Field
        _buildFigmaTextField(
          controller: _phoneController,
          hintText: 'Mobile Phone (optional)',
          keyboardType: TextInputType.phone,
        ),
        
        SizedBox(height: 16),
        
        // Email Field
        _buildFigmaTextField(
          controller: _emailController,
          hintText: 'Email Address',
          keyboardType: TextInputType.emailAddress,
        ),
        
        SizedBox(height: 16),
        
        // Password Field
        _buildFigmaTextField(
          controller: _passwordController,
          hintText: 'Password',
          isPassword: true,
        ),
        
        SizedBox(height: 32),
        
        // Create Account Button
        Container(
          width: 370,
          height: 50,
          child: ElevatedButton(
            onPressed: _createAccount,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF9AC26B), // 원래 Figma 디자인의 연녹색
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(48),
              ),
              elevation: 0,
            ),
            child: Text(
              'Create Account',
              style: GoogleFonts.plusJakartaSans(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        
        SizedBox(height: 16),
        
        // Terms & Conditions
        Text(
          'By signing up, you agree to our Terms & Conditions.',
          textAlign: TextAlign.center,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 13,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildFigmaTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFC2966B).withOpacity(0.09),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: keyboardType,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 17,
          color: Color(0xFF2E2514),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.plusJakartaSans(
            color: Color(0xFF2E2514).withOpacity(0.5),
            fontSize: 17,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        ),
      ),
    );
  }

  void _createAccount() {
    // Validation logic
    if (_firstNameController.text.isEmpty ||
        _surnameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      _showSnackBar('Required fields must be filled');
      return;
    }

    if (_passwordController.text.length < 6) {
      _showSnackBar('Password must be at least 6 characters');
      return;
    }

    // Success
    _showSnackBar('Account created successfully!');
    
    // Navigate back to login screen after delay
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pop(context);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.plusJakartaSans(),
        ),
        backgroundColor: Color(0xFF9AC26B), // 계정 생성 페이지와 동일한 연녹색
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}