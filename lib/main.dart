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
      height: 65, // 큰 폰트에 맞게 높이 조정
      width: 393,
      child: Center(
        child: Text(
          'FoodiGenie',
          style: GoogleFonts.roadRage(
            fontSize: 42, // 1.5배 크기로 증가 (28 * 1.5 = 42)
            fontWeight: FontWeight.w400,
            color: Color(0xFF40392B), // 다크 브라운으로 통일
            letterSpacing: -0.84, // 레터 스페이싱도 비례적으로 조정
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
          text: 'Continue with Facebook',
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
          text: 'Continue with Google',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Color(0xFF40392B),
          borderColor: Color(0xFF6E5C49).withOpacity(0.2),
          icon: FontAwesomeIcons.google,
          onPressed: () {
            // Handle Google login
          },
        ),
        
        SizedBox(height: 16),
        
        // Apple Button
        _buildSocialButton(
          text: 'Continue with Apple',
          backgroundColor: Color(0xFF40392B),
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
          text: 'Sign In',
          backgroundColor: Color(0xFF9AC26B),
          textColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ActualLoginScreen()),
            );
          },
        ),
        
        SizedBox(height: 16),
        
        // Create Account Button
        _buildActionButton(
          text: 'Create Account',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Color(0xFF40392B),
          borderColor: Color(0xFF6E5C49).withOpacity(0.2),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateAccountScreen()),
            );
          },
        ),
        
        SizedBox(height: 16),
        
        // Anonymous Start Button (Test Mode)
        _buildActionButton(
          text: 'Start Anonymously (Test)',
          backgroundColor: Color(0xFFE8E8E8),
          textColor: Color(0xFF40392B),
          onPressed: () {
            // Navigate directly to MainScreen for testing
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
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

class ActualLoginScreen extends StatefulWidget {
  @override
  _ActualLoginScreenState createState() => _ActualLoginScreenState();
}

class _ActualLoginScreenState extends State<ActualLoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFCF5),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xFF40392B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Sign In',
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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              
              // Welcome Text
              Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome Back!',
                      style: GoogleFonts.roadRage(
                        fontSize: 32,
                        color: Color(0xFF40392B),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Sign in to your account',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        color: Color(0xFF2E2514).withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 48),
              
              // Email Field
              Text(
                'Email',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF40392B),
                ),
              ),
              SizedBox(height: 8),
              _buildTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
              ),
              
              SizedBox(height: 24),
              
              // Password Field
              Text(
                'Password',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF40392B),
                ),
              ),
              SizedBox(height: 8),
              _buildTextField(
                controller: _passwordController,
                hintText: 'Enter your password',
                isPassword: true,
                prefixIcon: Icons.lock_outline,
              ),
              
              SizedBox(height: 16),
              
              // Forgot Password Link
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: _showForgotPasswordDialog,
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      color: Color(0xFF9AC26B),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 32),
              
              // Sign In Button
              Container(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF9AC26B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.plusJakartaSans(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              
              SizedBox(height: 32),
              
              // Back to Welcome
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        color: Color(0xFF2E2514).withOpacity(0.6),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => CreateAccountScreen()),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 14,
                          color: Color(0xFF9AC26B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    bool isPassword = false,
    TextInputType? keyboardType,
    IconData? prefixIcon,
  }) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Color(0xFFC2966B).withOpacity(0.09),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFF6E5C49).withOpacity(0.1),
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? !_isPasswordVisible : false,
        keyboardType: keyboardType,
        style: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          color: Color(0xFF2E2514),
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: GoogleFonts.plusJakartaSans(
            color: Color(0xFF2E2514).withOpacity(0.5),
            fontSize: 16,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(
                  prefixIcon,
                  color: Color(0xFF40392B).withOpacity(0.6),
                  size: 20,
                )
              : null,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFF40392B).withOpacity(0.6),
                    size: 20,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  void _signIn() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      _showSnackBar('Please fill in all fields');
      return;
    }

    if (!_emailController.text.contains('@')) {
      _showSnackBar('Please enter a valid email');
      return;
    }

    // Success
    _showSnackBar('Signed in successfully!');
    
    // Navigate to main app
    Future.delayed(Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );
    });
  }

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final TextEditingController emailController = TextEditingController();
        
        return AlertDialog(
          backgroundColor: Color(0xFFFFFCF5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            'Reset Password',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF40392B),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your email address to receive a password reset link.',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  color: Color(0xFF2E2514).withOpacity(0.7),
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xFFC2966B).withOpacity(0.09),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: Color(0xFF2E2514),
                  ),
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    hintStyle: GoogleFonts.plusJakartaSans(
                      color: Color(0xFF2E2514).withOpacity(0.5),
                      fontSize: 14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Cancel',
                style: GoogleFonts.plusJakartaSans(
                  color: Color(0xFF40392B).withOpacity(0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty || !emailController.text.contains('@')) {
                  _showSnackBar('Please enter a valid email');
                  return;
                }
                Navigator.pop(context);
                _showSnackBar('Password reset link sent to ${emailController.text}');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF9AC26B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text(
                'Send Link',
                style: GoogleFonts.plusJakartaSans(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.plusJakartaSans(),
        ),
        backgroundColor: Color(0xFF9AC26B),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Data Models
class Category {
  final String id;
  final String name;
  final String imageUrl;
  final Color color;

  Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.color,
  });
}

class Recipe {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double rating;
  final int cookTime;
  final List<String> tags;

  Recipe({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.cookTime,
    required this.tags,
  });
}

class Restaurant {
  final String id;
  final String name;
  final double rating;
  final String priceRange;
  final List<String> categories;
  final int deliveryTime;
  final List<String> imageUrls;
  final bool isFavorite;

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.priceRange,
    required this.categories,
    required this.deliveryTime,
    required this.imageUrls,
    this.isFavorite = false,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    double? rating,
    String? priceRange,
    List<String>? categories,
    int? deliveryTime,
    List<String>? imageUrls,
    bool? isFavorite,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      priceRange: priceRange ?? this.priceRange,
      categories: categories ?? this.categories,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      imageUrls: imageUrls ?? this.imageUrls,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}

// Favorites Manager (Singleton)
class FavoritesManager {
  static final FavoritesManager _instance = FavoritesManager._internal();
  factory FavoritesManager() => _instance;
  FavoritesManager._internal();

  final List<String> _favoriteRestaurantIds = [];
  final List<String> _favoriteRecipeIds = [];
  final List<VoidCallback> _listeners = [];

  List<String> get favoriteRestaurantIds => List.unmodifiable(_favoriteRestaurantIds);
  List<String> get favoriteRecipeIds => List.unmodifiable(_favoriteRecipeIds);

  void toggleRestaurantFavorite(String restaurantId) {
    if (_favoriteRestaurantIds.contains(restaurantId)) {
      _favoriteRestaurantIds.remove(restaurantId);
    } else {
      _favoriteRestaurantIds.add(restaurantId);
    }
    _notifyListeners();
  }

  void toggleRecipeFavorite(String recipeId) {
    if (_favoriteRecipeIds.contains(recipeId)) {
      _favoriteRecipeIds.remove(recipeId);
    } else {
      _favoriteRecipeIds.add(recipeId);
    }
    _notifyListeners();
  }

  bool isRestaurantFavorite(String restaurantId) {
    return _favoriteRestaurantIds.contains(restaurantId);
  }

  bool isRecipeFavorite(String recipeId) {
    return _favoriteRecipeIds.contains(recipeId);
  }

  // Legacy methods for backward compatibility
  void toggleFavorite(String id) => toggleRestaurantFavorite(id);
  bool isFavorite(String id) => isRestaurantFavorite(id);

  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notifyListeners() {
    for (final listener in _listeners) {
      listener();
    }
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFCF5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: Color(0xFFFFFCF5),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFFD72600),
          unselectedItemColor: Color(0xFF2E1814).withOpacity(0.6),
          selectedFontSize: 11,
          unselectedFontSize: 11,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

// Home Screen (Main Page)
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();

  @override
  void initState() {
    super.initState();
    _favoritesManager.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesManager.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {});
  }

  // Sample Data
  final List<Category> categories = [
    Category(
      id: '1',
      name: 'Organic Products',
      imageUrl: 'assets/images/organic_products.png',
      color: Color(0xFF4CAF50),
    ),
    Category(
      id: '2',
      name: 'Vegan Options',
      imageUrl: 'assets/images/vegan_options.png',
      color: Color(0xFF8BC34A),
    ),
    Category(
      id: '3',
      name: 'Gluten-Free',
      imageUrl: 'assets/images/gluten_free.png',
      color: Color(0xFFFF9800),
    ),
    Category(
      id: '4',
      name: 'Dairy-Free',
      imageUrl: 'assets/images/dairy_free.png',
      color: Color(0xFF2196F3),
    ),
  ];

  final List<Recipe> featuredRecipes = [
    Recipe(
      id: '1',
      name: 'Quinoa Salad',
      description: 'A healthy blend of quinoa, tomatoes, and cucumbers',
      imageUrl: 'assets/images/quinoa_salad.png',
      rating: 4.5,
      cookTime: 15,
      tags: ['Healthy', 'Vegan'],
    ),
    Recipe(
      id: '2',
      name: 'Avocado Toast',
      description: 'Smashed avocado on sourdough bread',
      imageUrl: 'assets/images/avocado_toast.png',
      rating: 4.8,
      cookTime: 10,
      tags: ['Quick', 'Healthy'],
    ),
    Recipe(
      id: '3',
      name: 'Smoothie Bowl',
      description: 'A refreshing mix of berries and bananas',
      imageUrl: 'assets/images/smoothie_bowl.png',
      rating: 4.7,
      cookTime: 8,
      tags: ['Breakfast', 'Healthy'],
    ),
  ];

  List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Green Delight',
      rating: 4.5,
      priceRange: '\$\$',
      categories: ['Vegan'],
      deliveryTime: 30,
      imageUrls: ['assets/images/restaurant_vegan.png'],
    ),
    Restaurant(
      id: '2',
      name: 'Healthy Bites',
      rating: 4.8,
      priceRange: '\$\$',
      categories: ['Organic'],
      deliveryTime: 25,
      imageUrls: ['assets/images/restaurant_organic.png'],
    ),
    Restaurant(
      id: '3',
      name: 'Fresh Feast',
      rating: 4.7,
      priceRange: '\$\$\$',
      categories: ['Gluten-Free'],
      deliveryTime: 40,
      imageUrls: ['assets/images/gluten_free.png'],
    ),
    Restaurant(
      id: '4',
      name: "Nature's Plate",
      rating: 4.6,
      priceRange: '\$\$',
      categories: ['Dairy-Free'],
      deliveryTime: 35,
      imageUrls: ['assets/images/dairy_free.png'],
    ),
    Restaurant(
      id: '5',
      name: 'Pure Eats',
      rating: 4.9,
      priceRange: '\$\$\$',
      categories: ['Organic'],
      deliveryTime: 45,
      imageUrls: ['assets/images/organic_products.png'],
    ),
  ];

  // Toggle favorite status
  void _toggleFavorite(String restaurantId) {
    _favoritesManager.toggleRestaurantFavorite(restaurantId);
  }

  void _toggleRecipeFavorite(String recipeId) {
    _favoritesManager.toggleRecipeFavorite(recipeId);
  }

  // Get favorite restaurants
  List<Restaurant> get favoriteRestaurants => 
    restaurants.where((restaurant) => _favoritesManager.isRestaurantFavorite(restaurant.id)).toList();

  List<Recipe> get favoriteRecipes => 
    featuredRecipes.where((recipe) => _favoritesManager.isRecipeFavorite(recipe.id)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: _buildHeader(),
            ),
            
            // Explore Categories
            SliverToBoxAdapter(
              child: _buildExploreCategories(),
            ),
            
            // Featured Recipes
            SliverToBoxAdapter(
              child: _buildFeaturedRecipes(),
            ),
            
            // Restaurant Cards
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildRestaurantCard(restaurants[index]),
                childCount: restaurants.length,
              ),
            ),
            
            // Bottom spacing
            SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Center(
        child: Text(
          'Discover Delicious Foods',
          style: GoogleFonts.robotoSlab(
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: Color(0xFF281D1B),
            letterSpacing: -0.34,
          ),
        ),
      ),
    );
  }

  Widget _buildExploreCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Text(
            'Explore Categories',
            style: GoogleFonts.robotoSlab(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF281D1B),
              letterSpacing: -0.36,
            ),
          ),
        ),
        // Fixed 2x2 Grid (Figma Layout)
        Container(
          height: 386, // 173*2 + 8 + padding
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // First Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 173,
                      child: _buildCategoryCard(categories[0]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 173,
                      child: _buildCategoryCard(categories[1]),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              // Second Row
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 173,
                      child: _buildCategoryCard(categories[2]),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      height: 173,
                      child: _buildCategoryCard(categories[3]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(Category category) {
    return GestureDetector(
      onTap: () {
        // Navigate to category details
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  category.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: category.color.withOpacity(0.3),
                      child: Icon(
                        _getCategoryIcon(category.name),
                        size: 40,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    Color(0x66000000), // #00000066 - center (40% black)
                    Color(0x00000000), // #00000000 - edge (transparent)
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 0,
              right: 0,
              child: Text(
                category.name,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  letterSpacing: -0.3,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryName) {
    switch (categoryName) {
      case 'Organic Products':
        return Icons.eco;
      case 'Vegan Options':
        return Icons.grass;
      case 'Gluten-Free':
        return Icons.no_meals;
      case 'Dairy-Free':
        return Icons.water_drop_outlined;
      default:
        return Icons.restaurant;
    }
  }

  Widget _buildFeaturedRecipes() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Text(
            'Featured Recipes',
            style: GoogleFonts.robotoSlab(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF281D1B),
              letterSpacing: -0.36,
            ),
          ),
        ),
        Container(
          height: 250,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: featuredRecipes.length,
            itemBuilder: (context, index) => Container(
              width: 173,
              margin: EdgeInsets.only(right: 16),
              child: _buildRecipeCard(featuredRecipes[index]),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return GestureDetector(
      onTap: () {
        // Navigate to recipe details
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFDFC),
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Recipe Image with Heart Icon
            Stack(
              children: [
                Container(
                  height: 128,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                    child: Image.asset(
                      recipe.imageUrl,
                      width: double.infinity,
                      height: 128,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Color(0xFF4CAF50).withOpacity(0.3),
                          child: Center(
                            child: Icon(
                              Icons.restaurant,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                // Heart Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => _toggleRecipeFavorite(recipe.id),
                    child: Container(
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        _favoritesManager.isRecipeFavorite(recipe.id) 
                          ? Icons.bookmark 
                          : Icons.bookmark_border,
                        color: _favoritesManager.isRecipeFavorite(recipe.id) 
                          ? Color(0xFFFFB800) // 노란색 책갈피
                          : Color(0xFF281D1B).withOpacity(0.6),
                        size: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            
            // Recipe Info
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe Title
                  Text(
                    recipe.name,
                    style: GoogleFonts.robotoSlab(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF281D1B),
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 4),
                  // Recipe Description
                  Text(
                    recipe.description,
                    style: GoogleFonts.publicSans(
                      fontSize: 13,
                      color: Color(0xFF2E1814).withOpacity(0.62),
                      letterSpacing: -0.065,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  // Rating Stars and Cook Time
                  Row(
                    children: [
                      // Five Stars Rating
                      _buildStarRating(recipe.rating),
                      Spacer(),
                      // Cook Time with Icon
                      Icon(
                        Icons.access_time,
                        size: 12,
                        color: Color(0xFF2E1814).withOpacity(0.62),
                      ),
                      SizedBox(width: 2),
                      Text(
                        '${recipe.cookTime} min',
                        style: GoogleFonts.publicSans(
                          fontSize: 12,
                          color: Color(0xFF2E1814).withOpacity(0.62),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    
    // Full stars - 빨간색으로 변경
    for (int i = 0; i < fullStars; i++) {
      stars.add(
        Icon(
          Icons.star,
          size: 14,
          color: Colors.red, // 빨간색
        ),
      );
    }
    
    // Half star - 빨간색으로 변경
    if (hasHalfStar && stars.length < 5) {
      stars.add(
        Icon(
          Icons.star_half,
          size: 14,
          color: Colors.red, // 빨간색
        ),
      );
    }
    
    // Empty stars - 회색
    while (stars.length < 5) {
      stars.add(
        Icon(
          Icons.star_border,
          size: 14,
          color: Color(0xFF281D1B).withOpacity(0.3),
        ),
      );
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }

  Widget _buildRestaurantCard(Restaurant restaurant) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFFFFDFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xFF6E5049).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  restaurant.name,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF281D1B),
                    letterSpacing: -0.34,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _toggleFavorite(restaurant.id),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    _favoritesManager.isRestaurantFavorite(restaurant.id) ? Icons.favorite : Icons.favorite_border,
                    color: _favoritesManager.isRestaurantFavorite(restaurant.id) ? Color(0xFFFF0000) : Color(0xFF281D1B).withOpacity(0.6),
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8),
          
          // Restaurant Info
          Row(
            children: [
              Icon(Icons.star, size: 12, color: Colors.red),
              SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                restaurant.priceRange,
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                restaurant.categories.join(', '),
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                '${restaurant.deliveryTime} mins',
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
              ),
            ),
          ],
        ),
          
          SizedBox(height: 16),
          
          // Restaurant Images
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      restaurant.imageUrls.first,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Color(0xFF4CAF50).withOpacity(0.3),
                          child: Center(
                            child: Icon(
                              Icons.restaurant,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          restaurant.imageUrls.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Color(0xFF8BC34A).withOpacity(0.3),
                              child: Center(
                                child: Icon(
                                  Icons.restaurant_menu,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          restaurant.imageUrls.first,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Color(0xFFFF9800).withOpacity(0.3),
                              child: Center(
                                child: Icon(
                                  Icons.local_dining,
                                  size: 24,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Placeholder screens for other tabs
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFCF5),
        elevation: 0,
        title: Text(
          'Search',
          style: GoogleFonts.robotoSlab(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF281D1B),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search,
              size: 80,
              color: Color(0xFF9AC26B),
            ),
            SizedBox(height: 16),
            Text(
              'Search Feature',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF281D1B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Coming Soon!',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                color: Color(0xFF2E1814).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoritesManager _favoritesManager = FavoritesManager();
  
  // Sample restaurants data (same as HomeScreen)
  final List<Restaurant> restaurants = [
    Restaurant(
      id: '1',
      name: 'Green Delight',
      rating: 4.5,
      priceRange: '\$\$',
      categories: ['Vegan'],
      deliveryTime: 30,
      imageUrls: ['assets/images/restaurant_vegan.png'],
    ),
    Restaurant(
      id: '2',
      name: 'Healthy Bites',
      rating: 4.8,
      priceRange: '\$\$',
      categories: ['Organic'],
      deliveryTime: 25,
      imageUrls: ['assets/images/restaurant_organic.png'],
    ),
    Restaurant(
      id: '3',
      name: 'Fresh Feast',
      rating: 4.7,
      priceRange: '\$\$\$',
      categories: ['Gluten-Free'],
      deliveryTime: 40,
      imageUrls: ['assets/images/gluten_free.png'],
    ),
    Restaurant(
      id: '4',
      name: "Nature's Plate",
      rating: 4.6,
      priceRange: '\$\$',
      categories: ['Dairy-Free'],
      deliveryTime: 35,
      imageUrls: ['assets/images/dairy_free.png'],
    ),
    Restaurant(
      id: '5',
      name: 'Pure Eats',
      rating: 4.9,
      priceRange: '\$\$\$',
      categories: ['Organic'],
      deliveryTime: 45,
      imageUrls: ['assets/images/organic_products.png'],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _favoritesManager.addListener(_onFavoritesChanged);
  }

  @override
  void dispose() {
    _favoritesManager.removeListener(_onFavoritesChanged);
    super.dispose();
  }

  void _onFavoritesChanged() {
    setState(() {});
  }

  // Sample recipes data (same as HomeScreen)
  final List<Recipe> featuredRecipes = [
    Recipe(
      id: '1',
      name: 'Quinoa Salad',
      description: 'A healthy blend of quinoa, tomatoes, and cucumbers',
      imageUrl: 'assets/images/quinoa_salad.png',
      rating: 4.5,
      cookTime: 15,
      tags: ['Healthy', 'Vegan'],
    ),
    Recipe(
      id: '2',
      name: 'Avocado Toast',
      description: 'Smashed avocado on sourdough bread',
      imageUrl: 'assets/images/avocado_toast.png',
      rating: 4.8,
      cookTime: 10,
      tags: ['Quick', 'Healthy'],
    ),
    Recipe(
      id: '3',
      name: 'Smoothie Bowl',
      description: 'A refreshing mix of berries and bananas',
      imageUrl: 'assets/images/smoothie_bowl.png',
      rating: 4.7,
      cookTime: 8,
      tags: ['Breakfast', 'Healthy'],
    ),
  ];

  List<Restaurant> get favoriteRestaurants => 
    restaurants.where((restaurant) => _favoritesManager.isRestaurantFavorite(restaurant.id)).toList();

  List<Recipe> get favoriteRecipes => 
    featuredRecipes.where((recipe) => _favoritesManager.isRecipeFavorite(recipe.id)).toList();

  void _toggleFavorite(String restaurantId) {
    _favoritesManager.toggleRestaurantFavorite(restaurantId);
  }

  void _toggleRecipeFavorite(String recipeId) {
    _favoritesManager.toggleRecipeFavorite(recipeId);
  }

  @override
  Widget build(BuildContext context) {
    final favoriteRestaurantList = favoriteRestaurants;
    final favoriteRecipeList = favoriteRecipes;
    final hasAnyFavorites = favoriteRestaurantList.isNotEmpty || favoriteRecipeList.isNotEmpty;

    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFCF5),
        elevation: 0,
        title: Text(
          'Favorites',
          style: GoogleFonts.robotoSlab(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF281D1B),
          ),
        ),
        centerTitle: true,
      ),
      body: !hasAnyFavorites
          ? _buildEmptyFavorites()
          : _buildFavoritesList(favoriteRestaurantList, favoriteRecipeList),
    );
  }

  Widget _buildEmptyFavorites() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: Color(0xFF9AC26B),
          ),
          SizedBox(height: 16),
          Text(
            'No Favorites Yet',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Color(0xFF281D1B),
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Tap the heart icon on restaurants and recipes to add them here!',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: Color(0xFF2E1814).withOpacity(0.6),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildFavoritesList(List<Restaurant> favoriteRestaurantList, List<Recipe> favoriteRecipeList) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        // Favorite Recipes Section
        if (favoriteRecipeList.isNotEmpty) ...[
          Text(
            'Favorite Recipes',
            style: GoogleFonts.robotoSlab(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF281D1B),
              letterSpacing: -0.36,
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: favoriteRecipeList.length,
              itemBuilder: (context, index) => Container(
                width: 173,
                margin: EdgeInsets.only(right: 16),
                child: _buildFavoriteRecipeCard(favoriteRecipeList[index]),
              ),
            ),
          ),
          SizedBox(height: 24),
        ],
        
        // Favorite Restaurants Section
        if (favoriteRestaurantList.isNotEmpty) ...[
          Text(
            'Favorite Restaurants',
            style: GoogleFonts.robotoSlab(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF281D1B),
              letterSpacing: -0.36,
            ),
          ),
          SizedBox(height: 16),
          ...favoriteRestaurantList.map((restaurant) => 
            Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: _buildFavoriteRestaurantCard(restaurant),
            )
          ).toList(),
        ],
      ],
    );
  }

  Widget _buildFavoriteRecipeCard(Recipe recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFFFFDFC),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image with Heart Icon
          Stack(
            children: [
              Container(
                height: 128,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
                  child: Image.asset(
                    recipe.imageUrl,
                    width: double.infinity,
                    height: 128,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Color(0xFF4CAF50).withOpacity(0.3),
                        child: Center(
                          child: Icon(
                            Icons.restaurant,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              // Heart Icon
              Positioned(
                top: 8,
                right: 8,
                child: GestureDetector(
                  onTap: () => _toggleRecipeFavorite(recipe.id),
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.bookmark,
                      color: Color(0xFFFFB800), // 노란색 책갈피
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
          
          // Recipe Info
          Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  recipe.name,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF281D1B),
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  recipe.description,
                  style: GoogleFonts.publicSans(
                    fontSize: 13,
                    color: Color(0xFF2E1814).withOpacity(0.62),
                    letterSpacing: -0.065,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    // Star Rating
                    _buildStarRating(recipe.rating),
                    Spacer(),
                    // Cook Time
                    Icon(
                      Icons.access_time,
                      size: 12,
                      color: Color(0xFF2E1814).withOpacity(0.62),
                    ),
                    SizedBox(width: 2),
                    Text(
                      '${recipe.cookTime} min',
                      style: GoogleFonts.publicSans(
                        fontSize: 12,
                        color: Color(0xFF2E1814).withOpacity(0.62),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    List<Widget> stars = [];
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    
    // Full stars - 빨간색으로 변경
    for (int i = 0; i < fullStars; i++) {
      stars.add(
        Icon(
          Icons.star,
          size: 14,
          color: Colors.red, // 빨간색
        ),
      );
    }
    
    // Half star - 빨간색으로 변경
    if (hasHalfStar && stars.length < 5) {
      stars.add(
        Icon(
          Icons.star_half,
          size: 14,
          color: Colors.red, // 빨간색
        ),
      );
    }
    
    // Empty stars - 회색
    while (stars.length < 5) {
      stars.add(
        Icon(
          Icons.star_border,
          size: 14,
          color: Color(0xFF281D1B).withOpacity(0.3),
        ),
      );
    }
    
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: stars,
    );
  }

  Widget _buildFavoriteRestaurantCard(Restaurant restaurant) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Color(0xFFFFFDFC),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Color(0xFF6E5049).withOpacity(0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Restaurant Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  restaurant.name,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF281D1B),
                    letterSpacing: -0.34,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => _toggleFavorite(restaurant.id),
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 8),
          
          // Restaurant Info
          Row(
            children: [
              Icon(Icons.star, size: 12, color: Colors.red),
              SizedBox(width: 4),
              Text(
                restaurant.rating.toString(),
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                restaurant.priceRange,
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                restaurant.categories.join(', '),
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
              Text(' • ', style: TextStyle(color: Color(0xFF2E1814).withOpacity(0.62))),
              Text(
                '${restaurant.deliveryTime} mins',
                style: GoogleFonts.publicSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 16),
          
          // Restaurant Image
          Container(
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                restaurant.imageUrls.first,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Color(0xFF4CAF50).withOpacity(0.3),
                    child: Center(
                      child: Icon(
                        Icons.restaurant,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFCF5),
      appBar: AppBar(
        backgroundColor: Color(0xFFFFFCF5),
        elevation: 0,
        title: Text(
          'Profile',
          style: GoogleFonts.robotoSlab(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF281D1B),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Color(0xFF281D1B)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF9AC26B),
              child: Icon(
                Icons.person,
                size: 60,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Welcome to FoodiGenie!',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Color(0xFF281D1B),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Manage your profile and preferences',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                color: Color(0xFF2E1814).withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}