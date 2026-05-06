import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_button.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_text_field.dart';
import 'package:mobile_dev_hakathon/core/services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _phoneController = TextEditingController(); // اختياري الآن
  final _authService = AuthService();
  bool _agreeToTerms = false;
  bool _isLoading = false;
  bool _isGoogleLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSignUp() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'يرجى ملء جميع الحقول المطلوبة (الاسم، البريد، كلمة المرور)',
          ),
        ),
      );
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('كلمات المرور غير متطابقة')));
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى الموافقة على الشروط والأحكام')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final user = await _authService.signUp(
        name: _nameController.text,
        email: _emailController.text,
        phone: _phoneController.text,
        password: _passwordController.text,
      );

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      }
    } on Exception catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      String message = 'فشل إنشاء الحساب. يرجى المحاولة لاحقاً.';

      if (e.toString().contains('email-already-in-use')) {
        message = 'البريد الإلكتروني مسجل مسبقاً.';
      } else if (e.toString().contains('weak-password')) {
        message = 'كلمة المرور ضعيفة جداً.';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  void _handleGoogleSignUp() async {
    setState(() => _isGoogleLoading = true);
    try {
      final user = await _authService.signInWithGoogle();

      if (!mounted) return;
      setState(() => _isGoogleLoading = false);

      if (user != null) {
        Navigator.pushReplacementNamed(context, Routes.homeScreen);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isGoogleLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'فشل الإنشاء بحساب Google: ${e.toString().split(']').last}',
          ),
          backgroundColor: Colors.red.shade600,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Column(
                children: [
                  Text(
                    'دواء',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF00408B),
                    ),
                  ),
                  Container(
                    width: 40.w,
                    height: 3.h,
                    color: const Color(0xFF0057B8),
                  ),
                ],
              ),
              SizedBox(height: 40.h),
              Container(
                padding: EdgeInsets.all(24.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      'إنشاء حساب جديد',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF191C22),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'انضم الينا لجعل ايجاد دواءك ابسط',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF545F73),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    _GoogleSignUpButton(
                      isLoading: _isGoogleLoading,
                      onPressed: _handleGoogleSignUp,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFE1E2EB),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'أو سجل بالبيانات',
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: const Color(0xFF727784),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 1,
                            color: const Color(0xFFE1E2EB),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      hintText: 'الاسم الكامل',
                      suffixIcon: Icons.person_outline,
                      controller: _nameController,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'البريد الإلكتروني',
                      suffixIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'رقم الجوال (اختياري)',
                      suffixIcon: Icons.phone_android_outlined,
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'كلمة المرور',
                      suffixIcon: Icons.lock_outline,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hintText: 'تأكيد كلمة المرور',
                      suffixIcon: Icons.lock_outline,
                      isPassword: true,
                      controller: _confirmPasswordController,
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'أوافق على الشروط والأحكام',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: const Color(0xFF191C22),
                          ),
                        ),
                        Checkbox(
                          value: _agreeToTerms,
                          onChanged: (value) {
                            setState(() {
                              _agreeToTerms = value ?? false;
                            });
                          },
                          activeColor: const Color(0xFF0057B8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      text: 'إنشاء حساب',
                      isLoading: _isLoading,
                      onPressed: _handleSignUp,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF0057B8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'لديك حساب بالفعل؟',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: const Color(0xFF545F73),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class _GoogleSignUpButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _GoogleSignUpButton({required this.isLoading, required this.onPressed});

  @override
  State<_GoogleSignUpButton> createState() => _GoogleSignUpButtonState();
}

class _GoogleSignUpButtonState extends State<_GoogleSignUpButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(scale: _scaleAnimation.value, child: child);
      },
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          child: InkWell(
            onTap: widget.isLoading
                ? null
                : () {
                    _animationController.forward().then((_) {
                      _animationController.reverse();
                    });
                    widget.onPressed();
                  },
            borderRadius: BorderRadius.circular(28.r),
            splashColor: const Color(0xFF4285F4).withValues(alpha: 0.1),
            highlightColor: const Color(0xFF4285F4).withValues(alpha: 0.05),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.r),
                border: Border.all(color: const Color(0xFFE1E2EB), width: 1.5),
              ),
              child: widget.isLoading
                  ? Center(
                      child: SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Color(0xFF4285F4),
                          ),
                        ),
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'إنشاء حساب بواسطة Google',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF3C4043),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CustomPaint(painter: _GoogleLogoPainter()),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;
    final double cy = h / 2;
    final double r = w * 0.45;

    const blue = Color(0xFF4285F4);
    const red = Color(0xFFEA4335);
    const yellow = Color(0xFFFBBC05);
    const green = Color(0xFF34A853);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.18
      ..strokeCap = StrokeCap.butt;

    paint.color = blue;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -0.4,
      -1.2,
      false,
      paint,
    );

    paint.color = red;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -1.6,
      -1.0,
      false,
      paint,
    );

    paint.color = yellow;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -2.6,
      -1.0,
      false,
      paint,
    );

    paint.color = green;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -3.6,
      -1.0,
      false,
      paint,
    );

    final linePaint = Paint()
      ..color = blue
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(cx, cy - w * 0.09, r + w * 0.05, w * 0.18),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
