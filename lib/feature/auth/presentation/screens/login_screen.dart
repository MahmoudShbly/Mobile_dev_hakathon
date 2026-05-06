import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_dev_hakathon/core/route/routes.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_button.dart';
import 'package:mobile_dev_hakathon/core/shared%20widgets/custom_text_field.dart';
import 'package:mobile_dev_hakathon/core/services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _authService = AuthService();
  bool _isLoading = false;
  bool _isGoogleLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال جميع البيانات')),
      );
      return;
    }

    setState(() => _isLoading = true);
    try {
      final user = await _authService.login(
        email: _emailController.text,
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
      String message = 'خطأ في تسجيل الدخول. يرجى التحقق من البيانات.';
      
      if (e.toString().contains('user-not-found')) {
        message = 'المستخدم غير موجود. يرجى إنشاء حساب جديد.';
      } else if (e.toString().contains('wrong-password')) {
        message = 'كلمة المرور غير صحيحة.';
      } else if (e.toString().contains('invalid-phone-number')) {
        message = 'رقم الهاتف غير صحيح.';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  // ══════════════════════════════════════════════
  // تسجيل الدخول بحساب Google
  // ══════════════════════════════════════════════
  void _handleGoogleSignIn() async {
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
          content: Text('فشل تسجيل الدخول بحساب Google: ${e.toString().split(']').last}'),
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
              SizedBox(height: 40.h),
              // App Logo/Title
              Column(
                children: [
                  Image.asset(
                    'assets/image/logofin.png',
                    height: 100.h,
                  ),
                  SizedBox(height: 16.h),
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
              SizedBox(height: 60.h),
              // Login Card
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
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'تسجيل الدخول',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF191C22),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'مرحباً بك مجدداً في تطبيق دواء',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF545F73),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomTextField(
                      labelText: 'البريد الإلكتروني',
                      hintText: 'example@mail.com',
                      suffixIcon: Icons.email_outlined,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.h),
                    CustomTextField(
                      labelText: 'كلمة المرور',
                      hintText: '********',
                      suffixIcon: Icons.lock_outline,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    SizedBox(height: 12.h),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.forgotPasswordScreen);
                      },
                      child: Text(
                        'نسيت كلمة المرور؟',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFF0057B8),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      text: 'دخول',
                      isLoading: _isLoading,
                      onPressed: _handleLogin,
                    ),
                    SizedBox(height: 24.h),
                    // ═══════════════════════════════════════
                    // فاصل "أو"
                    // ═══════════════════════════════════════
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
                            'أو سجل الدخول بواسطة',
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
                    // ═══════════════════════════════════════
                    // زر تسجيل الدخول بحساب Google
                    // ═══════════════════════════════════════
                    _GoogleSignInButton(
                      isLoading: _isGoogleLoading,
                      onPressed: _handleGoogleSignIn,
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
                      Navigator.pushNamed(context, Routes.registerScreen);
                    },
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: const Color(0xFF0057B8),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'ليس لديك حساب؟',
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

// ═══════════════════════════════════════════════════
// ويدجت زر Google Sign-In - تصميم احترافي
// ═══════════════════════════════════════════════════
class _GoogleSignInButton extends StatefulWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _GoogleSignInButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  State<_GoogleSignInButton> createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<_GoogleSignInButton>
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
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: child,
        );
      },
      child: SizedBox(
        width: double.infinity,
        height: 56.h,
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.r),
          child: InkWell(
            onTap: widget.isLoading ? null : () {
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
                border: Border.all(
                  color: const Color(0xFFE1E2EB),
                  width: 1.5,
                ),
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
                          'تسجيل الدخول بحساب Google',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF3C4043),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // أيقونة Google بالألوان الرسمية
                        SizedBox(
                          width: 24.w,
                          height: 24.w,
                          child: CustomPaint(
                            painter: _GoogleLogoPainter(),
                          ),
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

// ═══════════════════════════════════════════════════
// رسم شعار Google بالألوان الرسمية
// ═══════════════════════════════════════════════════
class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double w = size.width;
    final double h = size.height;
    final double cx = w / 2;
    final double cy = h / 2;
    final double r = w * 0.45;

    // الألوان الرسمية لـ Google
    const blue = Color(0xFF4285F4);
    const red = Color(0xFFEA4335);
    const yellow = Color(0xFFFBBC05);
    const green = Color(0xFF34A853);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.18
      ..strokeCap = StrokeCap.butt;

    // رسم القوس الأزرق (يمين - أعلى)
    paint.color = blue;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -0.4, // بداية من اليمين العلوي
      -1.2, // قوس نحو الأعلى
      false,
      paint,
    );

    // رسم القوس الأحمر (أعلى - يسار)
    paint.color = red;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -1.6,
      -1.0,
      false,
      paint,
    );

    // رسم القوس الأصفر (يسار - أسفل)
    paint.color = yellow;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -2.6,
      -1.0,
      false,
      paint,
    );

    // رسم القوس الأخضر (أسفل - يمين)
    paint.color = green;
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: r),
      -3.6,
      -1.0,
      false,
      paint,
    );

    // الخط الأفقي الأزرق (يمين "G")
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
