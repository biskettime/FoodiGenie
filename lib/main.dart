import 'package:flutter/material.dart';
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
        buildSocialButton(
          text: 'Continue with Facebook',
          backgroundColor: Color(0xFF3a63ed),
          textColor: Colors.white,
          icon: Icons.facebook,
          onPressed: () {
            // Handle Facebook login
          },
        ),
        
        SizedBox(height: 16),
        
        // Google Button
        buildSocialButton(
          text: 'Continue with Google',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Color(0xFF40392B),
          borderColor: Color(0xFF6E5C49).withOpacity(0.2),
          icon: Icons.g_mobiledata,
          onPressed: () {
            // Handle Google login
          },
        ),
        
        SizedBox(height: 16),
        
        // Apple Button
        buildSocialButton(
          text: 'Continue with Apple',
          backgroundColor: Color(0xFF40392B),
          textColor: Color(0xFFFFFCF5),
          icon: Icons.apple,
          onPressed: () {
            // Handle Apple login
          },
        ),
      ],
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
        buildSocialButton(
          text: 'Sign up with Facebook',
          backgroundColor: Color(0xFF3a63ed),
          textColor: Colors.white,
          icon: Icons.facebook,
          onPressed: () {
            // Handle Facebook signup
          },
          width: 370,
          borderRadius: 48,
        ),
        
        SizedBox(height: 16),
        
        // Google Button
        buildSocialButton(
          text: 'Sign up with Google',
          backgroundColor: Color(0xFFFFFCF5),
          textColor: Colors.black,
          borderColor: Colors.black.withOpacity(0.12),
          icon: Icons.g_mobiledata,
          onPressed: () {
            // Handle Google signup
          },
          width: 370,
          borderRadius: 48,
        ),
        
        SizedBox(height: 16),
        
        // Apple Button
        buildSocialButton(
          text: 'Sign up with Apple',
          backgroundColor: Colors.black,
          textColor: Colors.white,
          icon: Icons.apple,
          onPressed: () {
            // Handle Apple signup
          },
      width: 370,
          borderRadius: 48,
        ),
      ],
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

// Utility Functions
Widget buildStarRating(double rating) {
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

Widget buildSocialButton({
  required String text,
  required Color backgroundColor,
  required Color textColor,
  Color? borderColor,
  IconData? icon,
  required VoidCallback onPressed,
  double width = 361,
  double height = 52,
  double borderRadius = 36,
}) {
  return Container(
    width: width,
    height: height,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
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
            Icon(
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



// Data Models
class AppData {
  static final List<Category> categories = [
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

  static final List<Recipe> recipes = [
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

  static final List<Restaurant> restaurants = [
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
}

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

  Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.priceRange,
    required this.categories,
    required this.deliveryTime,
    required this.imageUrls,
  });

  Restaurant copyWith({
    String? id,
    String? name,
    double? rating,
    String? priceRange,
    List<String>? categories,
    int? deliveryTime,
    List<String>? imageUrls,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      rating: rating ?? this.rating,
      priceRange: priceRange ?? this.priceRange,
      categories: categories ?? this.categories,
      deliveryTime: deliveryTime ?? this.deliveryTime,
      imageUrls: imageUrls ?? this.imageUrls,
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
          selectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.2,
          ),
          unselectedLabelStyle: GoogleFonts.inter(
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
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

  // Use common data
  final List<Category> categories = AppData.categories;
  final List<Recipe> featuredRecipes = AppData.recipes;
  List<Restaurant> restaurants = AppData.restaurants;

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
              child: _buildHomeRecipeCard(featuredRecipes[index]),
            ),
          ),
        ),
      ],
    );
  }





  Widget _buildHomeRecipeCard(Recipe recipe) {
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
            // Recipe Image with Bookmark Icon
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
                // Bookmark Icon
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
                          ? Color(0xFFFFB800) 
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
                      buildStarRating(recipe.rating),
                      Spacer(),
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

// Search Screen matching Figma Search Page design exactly
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FavoritesManager _favoritesManager = FavoritesManager();
  
  // Filtered lists for search results
  List<Recipe> _filteredRecipes = [];
  List<Restaurant> _filteredRestaurants = [];
  
  // Use common data
  final List<Recipe> allRecipes = AppData.recipes;
  final List<Restaurant> allRestaurants = AppData.restaurants;
  
  @override
  void initState() {
    super.initState();
    _favoritesManager.addListener(_onFavoritesChanged);
    _searchController.addListener(_onSearchChanged);
  }
  
  @override
  void dispose() {
    _favoritesManager.removeListener(_onFavoritesChanged);
    _searchController.dispose();
    super.dispose();
  }
  
  void _onFavoritesChanged() {
    setState(() {});
  }
  
  void _onSearchChanged() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      if (query.isEmpty) {
        _filteredRecipes = [];
        _filteredRestaurants = [];
      } else {
        _filteredRecipes = allRecipes.where((recipe) =>
          recipe.name.toLowerCase().contains(query) ||
          recipe.description.toLowerCase().contains(query) ||
          recipe.tags.any((tag) => tag.toLowerCase().contains(query))
        ).toList();
        
        _filteredRestaurants = allRestaurants.where((restaurant) =>
          restaurant.name.toLowerCase().contains(query) ||
          restaurant.categories.any((category) => category.toLowerCase().contains(query))
        ).toList();
      }
    });
  }

  // Information items for Food Information Sharing
  final List<Map<String, dynamic>> informationItems = [
    {
      'icon': Icons.eco,
      'title': 'Delicious Recipes',
      'description': 'Explore various cuisines and share your favorite dishes.',
      'distance': '2 miles',
    },
    {
      'icon': Icons.museum,
      'title': 'Healthy Eating Tips',
      'description': 'Discover nutritious recipes and meal plans.',
      'distance': '5 miles',
    },
    {
      'icon': Icons.tram,
      'title': 'Culinary Adventures',
      'description': 'Join us in exploring food cultures around the world.',
      'distance': '3 miles',
    },
  ];

  // Food images for the grid - Figma Search Page Images
  final List<String> foodImages = [
    'assets/images/food_sharing_table.png',     // 393x176 - 다양한 음식이 배치된 테이블
    'assets/images/chef_cooking.png',           // 139x176 - 셰프가 요리하는 주방 장면
    'assets/images/gourmet_plating.png',        // 250x176 - 고급 요리 플레이팅
    'assets/images/food_market.png',            // 393x176 - 식재료 시장 장면
    'assets/images/dessert_sharing.png',        // 250x176 - 디저트를 나누어 먹는 모습
    'assets/images/appetizer_platter.png',      // 139x176 - 애피타이저 플래터
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: Column(
          children: [
            // Search Field Filled Out
            _buildSearchField(),
            
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: _searchController.text.isNotEmpty 
                  ? _buildSearchResults()
                  : Column(
                  children: [
                    // Table Title Huge
                    _buildTableTitle(),
                    
                    // Map Search Results
                    _buildMapSearchResults(),
                    
                    // Image Grid Dynamic Sizes
                    _buildImageGrid(),
                    
                    // Popular Places Section
                    _buildPopularPlaces(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Container(
      width: double.infinity,
      height: 76,
      color: Color(0xFFFCFCFC),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF525252).withOpacity(0.09),
          borderRadius: BorderRadius.circular(360),
        ),
        child: Row(
          children: [
            SizedBox(width: 13),
            // Search Icon
            Container(
              width: 18,
              height: 18,
              child: Icon(
                Icons.search,
                size: 15,
                color: Color(0xFF222222),
              ),
            ),
            SizedBox(width: 8),
            // Search Text
            Expanded(
              child: TextField(
                controller: _searchController,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF222222),
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: GoogleFonts.plusJakartaSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF222222),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            // Close Icon
            Container(
              width: 18,
              height: 18,
              child: Icon(
                Icons.close,
                size: 12,
                color: Color(0xFF212121).withOpacity(0.62),
              ),
            ),
            SizedBox(width: 13),
          ],
        ),
      ),
    );
  }

  Widget _buildTableTitle() {
    return Container(
      width: double.infinity,
      height: 63,
      color: Color(0xFFFCFCFC),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Text(
          'Food Information Sharing',
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: Color(0xFF222222),
            letterSpacing: -0.56,
          ),
        ),
      ),
    );
  }

  Widget _buildMapSearchResults() {
    return Container(
      width: double.infinity,
      child: Column(
        children: informationItems.map((item) => _buildMapSearchResult(item)).toList(),
      ),
    );
  }

  Widget _buildMapSearchResult(Map<String, dynamic> item) {
    return Container(
      width: double.infinity,
      height: 81,
      color: Color(0xFFFCFCFC),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
        children: [
          // Icon Frame
          Container(
            width: 24,
            height: 24,
            child: Icon(
              item['icon'],
              size: 20,
              color: Color(0xFF222222),
            ),
          ),
          SizedBox(width: 16),
          // Content
          Expanded(
            child: Container(
              height: 49, // 고정 높이 설정으로 overflow 방지
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  item['title'],
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF222222),
                    letterSpacing: -0.34,
                  ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                ),
                  SizedBox(height: 2), // 간격 줄임
                  Expanded(
                    child: Text(
                  item['description'],
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF212121).withOpacity(0.62),
                  ),
                      maxLines: 1, // 1줄로 제한
                  overflow: TextOverflow.ellipsis,
                    ),
                ),
              ],
              ),
            ),
          ),
          // Distance
          Container(
            width: 50,
            child: Text(
            item['distance'],
            style: GoogleFonts.plusJakartaSans(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Color(0xFF212121).withOpacity(0.62),
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.zero, // 패딩 제거
      child: Column(
        children: [
          // First large image (393x176)
          Container(
            width: double.infinity,
            height: 176,
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(foodImages[0]),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
              color: Color(0xFF4CAF50).withOpacity(0.3),
            ),
            child: foodImages[0].isNotEmpty ? null : Container(
              color: Color(0xFF4CAF50).withOpacity(0.3),
              child: Center(
                child: Icon(Icons.restaurant, size: 60, color: Colors.white),
              ),
            ),
          ),
          
          // Second row: Small (139) + Large (250)
          Row(
            children: [
              // Left image (smaller - 139x176)
              Container(
                width: 139,
                height: 176,
                margin: EdgeInsets.only(right: 4, bottom: 4),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(foodImages[1]),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {},
                  ),
                  color: Color(0xFF8BC34A).withOpacity(0.3),
                ),
                child: foodImages[1].isNotEmpty ? null : Container(
                  color: Color(0xFF8BC34A).withOpacity(0.3),
                  child: Center(
                    child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                  ),
                ),
              ),
              // Right image (larger - 250x176)
              Container(
                width: 250,
                  height: 176,
                  margin: EdgeInsets.only(bottom: 4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(foodImages[2]),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                  color: Color(0xFFFF9800).withOpacity(0.3),
                  ),
                  child: foodImages[2].isNotEmpty ? null : Container(
                  color: Color(0xFFFF9800).withOpacity(0.3),
                    child: Center(
                      child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          
          // Third large image (393x176)
          Container(
            width: double.infinity,
            height: 176,
            margin: EdgeInsets.only(bottom: 4),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(foodImages[3]),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
              color: Color(0xFF2196F3).withOpacity(0.3),
            ),
            child: foodImages[3].isNotEmpty ? null : Container(
              color: Color(0xFF2196F3).withOpacity(0.3),
              child: Center(
                child: Icon(Icons.restaurant, size: 60, color: Colors.white),
              ),
            ),
          ),
          
          // Fourth row: Large (250) + Small (139)
          Row(
            children: [
              // Left image (larger - 250x176)
              Container(
                width: 250,
                  height: 176,
                  margin: EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(foodImages[4]),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                  color: Color(0xFF9C27B0).withOpacity(0.3),
                  ),
                  child: foodImages[4].isNotEmpty ? null : Container(
                  color: Color(0xFF9C27B0).withOpacity(0.3),
                    child: Center(
                      child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                    ),
                  ),
                ),
              // Right image (smaller - 139x176)
              Container(
                width: 139,
                height: 176,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(foodImages[5]),
                    fit: BoxFit.cover,
                    onError: (exception, stackTrace) {},
                  ),
                  color: Color(0xFF607D8B).withOpacity(0.3),
                ),
                child: foodImages[5].isNotEmpty ? null : Container(
                  color: Color(0xFF607D8B).withOpacity(0.3),
                  child: Center(
                    child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularPlaces() {
    return Container(
      width: double.infinity,
      color: Color(0xFFFCFCFC),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // padding 더 줄임
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // 중앙 정렬
        children: [
          Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // 내용 크기에 맞춤
            children: [
              Text(
                'Popular Places',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 17, // 폰트 크기 약간 줄임
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF222222),
                    letterSpacing: -0.34,
                    height: 1.2, // 줄간격 조정
                ),
              ),
              Text(
                'See All',
                style: GoogleFonts.plusJakartaSans(
                    fontSize: 12, // 폰트 크기 줄임
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF212121).withOpacity(0.62),
                    height: 1.1, // 줄간격 조정
                ),
              ),
            ],
            ),
          ),
          // Forward Arrow
          Container(
            width: 20,
            height: 20,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: Color(0xFF212121).withOpacity(0.62),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchResults() {
    bool hasResults = _filteredRecipes.isNotEmpty || _filteredRestaurants.isNotEmpty;
    
    if (!hasResults) {
      return Container(
        height: 300,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFFD72600).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.search_off,
                  size: 40,
                  color: Color(0xFF281D1B).withOpacity(0.6),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'No Results Found',
                style: GoogleFonts.robotoSlab(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF281D1B),
                  letterSpacing: -0.36,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Try searching for something else',
                style: GoogleFonts.publicSans(
                  fontSize: 15,
                  color: Color(0xFF2E1814).withOpacity(0.62),
                  letterSpacing: -0.075,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipes Section
          if (_filteredRecipes.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Featured Recipes (${_filteredRecipes.length})',
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
                scrollDirection: Axis.horizontal,
                itemCount: _filteredRecipes.length,
                itemBuilder: (context, index) => Container(
                  width: 173,
                  margin: EdgeInsets.only(right: 16),
                  child: _buildSearchRecipeCard(_filteredRecipes[index]),
                ),
              ),
            ),
            SizedBox(height: 24),
          ],
          
          // Restaurants Section
          if (_filteredRestaurants.isNotEmpty) ...[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                'Restaurants (${_filteredRestaurants.length})',
                style: GoogleFonts.robotoSlab(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF281D1B),
                  letterSpacing: -0.36,
                ),
              ),
            ),
            ...(_filteredRestaurants.map((restaurant) => Container(
              margin: EdgeInsets.only(bottom: 16),
              child: _buildSearchRestaurantCard(restaurant),
            )).toList()),
          ],
        ],
      ),
    );
  }



  Widget _buildSearchRecipeCard(Recipe recipe) {
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
            // Recipe Image with Bookmark Icon
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
                // Bookmark Icon
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () => _favoritesManager.toggleRecipeFavorite(recipe.id),
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
                          ? Color(0xFFFFB800) 
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
                      buildStarRating(recipe.rating),
                      Spacer(),
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

  Widget _buildSearchRestaurantCard(Restaurant restaurant) {
    return Container(
      padding: EdgeInsets.all(18),
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
          // Restaurant Header
          Row(
            children: [
              Expanded(
                child: Text(
                  restaurant.name,
                  style: GoogleFonts.robotoSlab(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF281D1B),
                    letterSpacing: -0.36,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _favoritesManager.toggleRestaurantFavorite(restaurant.id);
                },
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
              Expanded(
                child: Text(
                  restaurant.categories.join(', '),
                  style: GoogleFonts.publicSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2E1814).withOpacity(0.62),
                  ),
                  overflow: TextOverflow.ellipsis,
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

// Favorites Screen matching Figma Favorites Page design exactly
class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  
  // 헤더 이미지들 리스트
  final List<Map<String, String>> _headerImages = [
    {'image': 'assets/images/favorites_header_sushi.png', 'title': 'Sushi Platter'},
    {'image': 'assets/images/avocado_toast.png', 'title': 'Avocado Toast'}, 
    {'image': 'assets/images/quinoa_salad.png', 'title': 'Quinoa Salad'},
    {'image': 'assets/images/organic_products.png', 'title': 'Organic Products'},
    {'image': 'assets/images/gluten_free.png', 'title': 'Gluten Free'},
  ];
  
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  // AppData의 restaurants 사용
  List<Restaurant> get firstGroupRestaurants => AppData.restaurants.take(5).toList();
  List<Restaurant> get secondGroupRestaurants => AppData.restaurants.skip(5).take(5).toList();

  final List<String> ingredients = [
    'Rice',
    'Seaweed', 
    'Salmon',
    'Soy Sauce',
    'Wasabi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Navigation Bar Immersive with Image
              _buildImageHeader(),
              
              // Main Content
              _buildMainContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageHeader() {
    return Container(
      width: double.infinity,
      height: 600,
      child: Stack(
        children: [
          // PageView for scrollable images
          PageView.builder(
            controller: _pageController,
            itemCount: _headerImages.length,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            itemBuilder: (context, index) {
              return Container(
            width: double.infinity,
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                    image: AssetImage(_headerImages[index]['image']!),
                fit: BoxFit.cover,
                    onError: (exception, stackTrace) {
                      print('Error loading image: ${_headerImages[index]['image']}');
                    },
              ),
            ),
            child: Container(
                  color: Colors.black.withOpacity(0.3), // 더 연한 overlay
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        '${index + 1}. ${_headerImages[index]['title']}',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          
          // Top Gradient Overlay
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x99000000),
                  Color(0x00000000),
                ],
              ),
            ),
          ),
          
          // Status Bar and Navigation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 104,
              child: Column(
                children: [
                  // Status Bar
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '12:45',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.white),
                            SizedBox(width: 6),
                            Icon(Icons.wifi, size: 16, color: Colors.white),
                            SizedBox(width: 6),
                            Icon(Icons.battery_full, size: 16, color: Colors.white),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Navigation
                  Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        'Favorites',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: -0.34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Bottom Gradient and Page Indicator
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0x00000000),
                    Color(0x99000000),
                  ],
                ),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _headerImages.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 6 : 
                             (_currentPage - index).abs() == 1 ? 6 :
                             (_currentPage - index).abs() == 2 ? 4 : 2,
                      height: _currentPage == index ? 6 : 
                              (_currentPage - index).abs() == 1 ? 6 :
                              (_currentPage - index).abs() == 2 ? 4 : 2,
                      decoration: BoxDecoration(
                        color: _currentPage == index 
                            ? Colors.white 
                            : Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(_currentPage == index ? 3 : 
                                                          (_currentPage - index).abs() == 1 ? 3 :
                                                          (_currentPage - index).abs() == 2 ? 2 : 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    return Container(
      width: double.infinity,
      color: Color(0xFFFCFCFC),
      child: Column(
        children: [
          // Table Title Huge - Featured Recipes (가로 스크롤) - 먼저 나옴
          _buildSectionTitle('Featured Recipes'),
          
          // Recipes - 가로 스크롤
          _buildRecipesHorizontalScroll(),
          
          SizedBox(height: 24),
          
          // Table Title Huge - Favorite Food Items (세로 스크롤) - 두 번째
          _buildSectionTitle('Favorite Food Items'),
          
          // Food Items - 세로 스크롤
          Column(
            children: [
          // First Group Restaurant Cards
          ...firstGroupRestaurants.map((restaurant) => _buildFirstGroupRestaurantCard(restaurant)).toList(),
          
          // Second Group Restaurant Cards
          ...secondGroupRestaurants.map((restaurant) => _buildSecondGroupRestaurantCard(restaurant)).toList(),
            ],
          ),
          
          SizedBox(height: 24),
          
          // Ingredients Section
          _buildIngredientsSection(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      width: double.infinity,
      height: 63,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            fontSize: 28,
            fontWeight: FontWeight.w700, // 동일한 볼드체로 통일
            color: Color(0xFF222222),
            letterSpacing: -0.56,
          ),
        ),
      ),
    );
  }

  Widget _buildRecipesHorizontalScroll() {
    // AppData의 recipes 사용
    final List<Recipe> featuredRecipes = AppData.recipes;

    return Container(
      height: 280,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal, // 가로 스크롤
        itemCount: featuredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = featuredRecipes[index];
          return Container(
            width: 220,
            margin: EdgeInsets.only(right: 16),
            child: _buildRecipeCard(recipe),
          );
        },
      ),
    );
  }

  Widget _buildRecipeCard(Recipe recipe) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recipe Image
          Container(
            height: 140,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.asset(
                recipe.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Color(0xFF4CAF50).withOpacity(0.3),
                    child: Center(
                      child: Icon(
                        Icons.restaurant_menu,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          
          // Recipe Info
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Recipe Name
                  Text(
                    recipe.name,
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: 8),
                  
                  // Recipe Details
                  Row(
                    children: [
                      Icon(Icons.access_time, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        '${recipe.cookTime} min',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                      SizedBox(width: 12),
                      Icon(Icons.star, size: 14, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(
                        recipe.rating.toString(),
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 4),
                  
                  // Tags
                  if (recipe.tags.isNotEmpty)
                    Text(
                      recipe.tags.first,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        color: Color(0xFF4CAF50),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFirstGroupRestaurantCard(Restaurant restaurant) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF5C5C5C).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
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
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF222222),
                      letterSpacing: -0.34,
                    ),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Color(0xFF222222).withOpacity(0.6),
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 8),
            
            // Restaurant Info
            Row(
              children: [
                Icon(Icons.star, size: 12, color: Color(0xFF222222)),
                SizedBox(width: 4),
                Text(
                  restaurant.rating.toString(),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121).withOpacity(0.62),
                  ),
                ),
                Text(' · ${restaurant.priceRange} · ${restaurant.categories.first} · ${restaurant.deliveryTime} mins',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF212121).withOpacity(0.62),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            
            // Restaurant Images
            Row(
              children: [
                // Large image
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 207,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(restaurant.imageUrls.first),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {},
                      ),
                      color: Color(0xFF4CAF50).withOpacity(0.3),
                    ),
                    child: restaurant.imageUrls.isNotEmpty ? null : Container(
                      color: Color(0xFF4CAF50).withOpacity(0.3),
                      child: Center(
                        child: Icon(Icons.restaurant, size: 60, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Small images column
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        height: 99.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF4CAF50).withOpacity(0.3),
                        ),
                        child: Center(
                          child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 99.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF4CAF50).withOpacity(0.3),
                        ),
                        child: Center(
                          child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondGroupRestaurantCard(Restaurant restaurant) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFFFCFDFF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xFF495B6E).withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(18),
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
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF1B2128),
                    ),
                  ),
                ),
                Icon(
                  Icons.favorite_border,
                  color: Color(0xFF1B2128).withOpacity(0.6),
                  size: 20,
                ),
              ],
            ),
            SizedBox(height: 8),
            
            // Restaurant Info
            Row(
              children: [
                Icon(Icons.star, size: 12, color: Color(0xFF1B2128)),
                SizedBox(width: 4),
                Text(
                  restaurant.rating.toString(),
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF14212E).withOpacity(0.62),
                  ),
                ),
                Text(' · ${restaurant.priceRange} · ${restaurant.categories.first} · ${restaurant.deliveryTime} mins',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF14212E).withOpacity(0.62),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            
            // Restaurant Images
            Row(
              children: [
                // Large image
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 207,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(restaurant.imageUrls.first),
                        fit: BoxFit.cover,
                        onError: (exception, stackTrace) {},
                      ),
                      color: Color(0xFF2196F3).withOpacity(0.3),
                    ),
                    child: restaurant.imageUrls.isNotEmpty ? null : Container(
                      color: Color(0xFF2196F3).withOpacity(0.3),
                      child: Center(
                        child: Icon(Icons.restaurant, size: 60, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                // Small images column
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Container(
                        height: 99.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF2196F3).withOpacity(0.3),
                        ),
                        child: Center(
                          child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 8),
                      Container(
                        height: 99.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF2196F3).withOpacity(0.3),
                        ),
                        child: Center(
                          child: Icon(Icons.restaurant, size: 40, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIngredientsSection() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Text(
            'Ingredients',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Color(0xFF222222),
              letterSpacing: -0.36,
            ),
          ),
          SizedBox(height: 8),
          // Divider
          Container(
            width: double.infinity,
            height: 1,
            color: Color(0xFF5C5C5C).withOpacity(0.2),
          ),
          SizedBox(height: 8),
          // Servings
          Text(
            '4 servings',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121).withOpacity(0.62),
            ),
          ),
          SizedBox(height: 16),
          // Ingredients List
          ...ingredients.map((ingredient) => _buildIngredientItem(ingredient)).toList(),
        ],
      ),
    );
  }

  Widget _buildIngredientItem(String ingredient) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                ingredient,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF222222),
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: Color(0xFF5C5C5C).withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Social media posts data
  final List<Map<String, dynamic>> socialPosts = [
    {
      'userImage': 'assets/images/quinoa_salad.png',
      'username': 'Astrid C. Valdez',
      'timestamp': 'Just made this amazing spaghetti carbonara!',
      'caption': 'Just made this amazing spaghetti carbonara!',
      'postImage': 'assets/images/quinoa_salad.png',
      'likes': 500,
      'comments': 45,
    },
    {
      'userImage': 'assets/images/avocado_toast.png',
      'username': 'Astrid C. Valdez',
      'timestamp': 'Tasting the best chocolate lava cake in town!',
      'caption': 'Tasting the best chocolate lava cake in town!',
      'postImage': 'assets/images/avocado_toast.png',
      'likes': 300,
      'comments': 30,
    },
    {
      'userImage': 'assets/images/smoothie_bowl.png',
      'username': 'Astrid C. Valdez',
      'timestamp': 'Enjoying a delightful brunch with avocado toast and poached eggs.',
      'caption': 'Enjoying a delightful brunch with avocado toast and poached eggs.',
      'postImage': 'assets/images/smoothie_bowl.png',
      'likes': 200,
      'comments': 20,
    },
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF080808),
      body: CustomScrollView(
        slivers: [
          // Header with Image
          SliverToBoxAdapter(
            child: _buildHeader(),
          ),
          
          // Profile Section
          SliverToBoxAdapter(
            child: _buildProfileSection(),
          ),
          
          // Social Photo Feed
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _buildSocialPost(socialPosts[index]),
              childCount: socialPosts.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      height: 426,
      child: Stack(
        children: [
          // Background Image
              Container(
                    width: double.infinity,
            height: 426,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/quinoa_salad.png'),
                    fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
              color: Color(0xFF4CAF50).withOpacity(0.8),
            ),
                  child: Container(
              color: Color(0xFF4CAF50).withOpacity(0.3),
            ),
          ),
          
          // Top Gradient Overlay
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0x99000000),
                  Color(0x00000000),
                ],
              ),
            ),
          ),
          
          // Status Bar and Navigation
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 104,
      child: Column(
        children: [
                  // Status Bar
                  Container(
                    height: 56,
                    padding: EdgeInsets.symmetric(horizontal: 32),
                    child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                        Text(
                          'Recipe Time',
                          style: GoogleFonts.inter(
                    fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            height: 1.21,
                          ),
                        ),
          Row(
            children: [
                            Icon(Icons.signal_cellular_4_bar, size: 16, color: Colors.white),
                            SizedBox(width: 6),
                            Icon(Icons.wifi, size: 16, color: Colors.white),
                            SizedBox(width: 6),
                            Icon(Icons.battery_full, size: 16, color: Colors.white),
                          ],
              ),
            ],
          ),
                  ),
                  // Navigation
                  Container(
                    height: 48,
                    child: Center(
                      child: Text(
                        'Profile',
                        style: GoogleFonts.inter(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        color: Colors.white,
                          letterSpacing: -0.425,
                          height: 1.21,
                      ),
              ),
            ),
          ),
        ],
      ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: double.infinity,
      color: Color(0xFF080808),
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          // Profile Image
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/quinoa_salad.png'),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
              color: Color(0xFF4CAF50).withOpacity(0.3),
            ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                color: Color(0xFF4CAF50).withOpacity(0.3),
              ),
              child: Center(
                child: Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                ),
              ),
          SizedBox(height: 16),
          
          // Profile Info
          Text(
            'Culinary Creations',
            style: GoogleFonts.inter(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Color(0xFFDDDDDD),
              letterSpacing: -0.55,
              height: 1.30,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Food Lover',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: Color(0xFFDDDDDD),
              letterSpacing: -0.085,
              height: 1.35,
            ),
          ),
          SizedBox(height: 16),
          
          // Followers Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildStatItem('1.2k', 'Followers'),
              SizedBox(width: 20),
              _buildStatItem('300', 'Following'),
            ],
          ),
          SizedBox(height: 24),
          
          // Follow Button
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48),
                ),
                elevation: 0,
              ),
              child: Text(
                'Follow',
                style: GoogleFonts.inter(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1.35,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String count, String label) {
    return Column(
      children: [
        Text(
          count,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFFDEDEDE).withOpacity(0.4),
            letterSpacing: -0.075,
            height: 1.35,
          ),
        ),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: Color(0xFFDEDEDE).withOpacity(0.4),
            letterSpacing: -0.075,
            height: 1.35,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialPost(Map<String, dynamic> post) {
    return Container(
      width: double.infinity,
      color: Color(0xFF080808),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          // Post Header
          Container(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
                // User Avatar
            Container(
                  width: 40,
                  height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(post['userImage']),
                      fit: BoxFit.cover,
                      onError: (exception, stackTrace) {},
                    ),
                    color: Color(0xFF4CAF50).withOpacity(0.3),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF4CAF50).withOpacity(0.3),
                    ),
                    child: Center(
                      child: Icon(Icons.person, size: 20, color: Colors.white),
                    ),
              ),
            ),
            SizedBox(width: 16),
                // User Info
            Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['username'],
                        style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                          color: Color(0xFFDDDDDD),
                  letterSpacing: -0.075,
                          height: 1.35,
                        ),
                      ),
                      Text(
                        post['timestamp'],
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFDEDEDE).withOpacity(0.62),
                          height: 1.21,
                        ),
            ),
          ],
        ),
      ),
              ],
            ),
          ),
          
          // Post Caption
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              post['caption'],
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFFDDDDDD),
                letterSpacing: -0.075,
                height: 1.35,
              ),
            ),
          ),
          SizedBox(height: 16),
          
          // Post Image
          Container(
            width: double.infinity,
            height: 393,
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: AssetImage(post['postImage']),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
              color: Color(0xFF4CAF50).withOpacity(0.3),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xFF4CAF50).withOpacity(0.3),
              ),
              child: Center(
                child: Icon(Icons.image, size: 80, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 16),
          
          // Post Actions
              Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                // Like Button
                Row(
                  children: [
                    Icon(Icons.favorite_border, size: 16, color: Color(0xFFDDDDDD)),
                    SizedBox(width: 8),
              Text(
                      post['likes'].toString(),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDDDDDD),
                        letterSpacing: -0.075,
                        height: 1.35,
                ),
              ),
            ],
          ),
                SizedBox(width: 20),
                // Comment Button
                Row(
            children: [
                    Icon(Icons.chat_bubble_outline, size: 16, color: Color(0xFFDDDDDD)),
                    SizedBox(width: 8),
              Text(
                      post['comments'].toString(),
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDDDDDD),
                        letterSpacing: -0.075,
                        height: 1.35,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                // More Button
                Icon(Icons.more_horiz, size: 16, color: Color(0xFFDDDDDD)),
              ],
            ),
          ),
          SizedBox(height: 24),
          
          // Divider
          Container(
            width: double.infinity,
            height: 1,
            color: Color(0xFFA3A3A3).withOpacity(0.2),
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }
}
