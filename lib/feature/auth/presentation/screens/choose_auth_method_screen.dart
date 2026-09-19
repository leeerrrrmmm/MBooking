import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mbooking/feature/auth/presentation/widgets/log_or_reg_btn_widget.dart';
import 'package:mbooking/router/app_routes.dart';

class ChooseAuthMethodScreen extends StatefulWidget {
  const ChooseAuthMethodScreen({super.key});

  @override
  State<ChooseAuthMethodScreen> createState() => _ChooseAuthMethodScreenState();
}

class _ChooseAuthMethodScreenState extends State<ChooseAuthMethodScreen> {
  void _onLanguageTap() {
    String selectedLanguage = 'English'; // текущий выбранный язык

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Container(
              width: double.infinity,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF1A1A1A),
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Choose language',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Which language do you want to use?',
                    style: TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                  const SizedBox(height: 28),

                  // ===== Список языков =====
                  Column(
                    spacing: 12,
                    children: [
                      _LanguageOption(
                        title: 'English',
                        isSelected: selectedLanguage == 'English',
                        onTap: () {
                          setModalState(() => selectedLanguage = 'English');
                          // Здесь можно сохранить выбор и закрыть sheet
                          // Navigator.pop(context);
                        },
                      ),
                      const Divider(color: Colors.white38),
                      _LanguageOption(
                        title: 'Українська',
                        isSelected: selectedLanguage == 'Українська',
                        onTap: () {
                          setModalState(() => selectedLanguage = 'Українська');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Title Logo
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: 'MB'),
                  TextSpan(
                    text: 'oO',
                    style: TextStyle(color: Colors.amber),
                  ),
                  TextSpan(text: 'king'),
                ],
              ),
            ),

            //Language Selector
            GestureDetector(
              onTap: () => _onLanguageTap(),
              child: Container(
                width: 98,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.4),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Row(
                  spacing: 4,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.language_outlined, color: Colors.white),
                    Text(
                      'English',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Onboarding Image and Text
              Padding(
                padding: const EdgeInsets.only(top: 61.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 460, maxWidth: 330),
                  child: Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Image.asset(
                          'assets/images/onb_img.png',
                          width: 330,
                          height: 330,
                        ),
                      ),
                      Text(
                        'MBooking hello!',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Enjoy your favorite movies',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              //Choose Auth Method
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 190, maxWidth: 370),
                  child: Column(
                    children: [
                      LogOrRegBtnWidget(
                        text: 'Sign in',
                        onTap: () => context.pushReplacement(AppRoutes.login),
                        btnColor: Colors.amber,
                        textColor: Colors.black,
                      ),
                      LogOrRegBtnWidget(
                        text: 'Sign up',
                        onTap: () =>
                            context.pushReplacement(AppRoutes.register),
                        btnColor: Colors.black,
                        textColor: Colors.white,
                        isBorder: true,
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        child: Text(
                          'By sign in or sign up, you agree to our Terms of Service and Privac y Policy',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const _LanguageOption({
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.white.withValues(alpha: 0.08)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: Colors.white,
              ),
            ),

            // Круглый индикатор
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected ? Colors.amber : Colors.white54,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? Center(
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
