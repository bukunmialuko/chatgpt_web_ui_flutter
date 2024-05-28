import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/shared/buttons/social_auth_button.dart';
import 'package:chatgpt_web_ui/shared/custom_checkbox.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _controller;
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 33),
            SizedBox(
              width: 30,
              height: 30,
              child: Assets.svg.logo.svg(color: AppColors.middle),
            ),
            const SizedBox(height: 89),
            Text(
              "Welcome back",
              style: TextStyle(
                  fontSize: 31,
                  color: AppColors.text,
                  fontFamily: Assets.fonts.inter.interBold,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Center(
              child: SizedBox(
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextFormField(
                      initialValue: ' ',
                      decoration: const InputDecoration(
                        labelText: 'Email address',
                        labelStyle: TextStyle(color: AppColors.accentGreen),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffC3C8CF),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentGreen,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.accentGreen,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    const _CaptchaWidget(),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: FilledButton(
                        onPressed: () {
                          context.go('/main');
                        },
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.accentGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        child: const Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff2E3339),
                              fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft,
                          ),
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.accentGreen,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(color: AppColors.greyIcons),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            "OR",
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.text,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(color: AppColors.greyIcons),
                        ),
                      ],
                    ),
                    const SizedBox(height: 17),
                    SocialAuthButton(
                      onPressed: () {},
                      label: 'Continue with Google',
                      icon: Assets.svg.googleLogo.svg(),
                    ),
                    const SizedBox(height: 8),
                    SocialAuthButton(
                      onPressed: () {},
                      label: 'Continue with Microsoft Account',
                      icon: Assets.svg.microsoftLogo.svg(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CaptchaWidget extends StatelessWidget {
  const _CaptchaWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.greyIcons),
      ),
      child: Row(
        children: [
          CustomCheckBox(
            value: false,
            checkBoxSize: 28,
            onChanged: (bool value) {},
          ),
          Expanded(
            child: Text(
              'I’m not a robot',
              style: TextStyle(
                fontSize: 15,
                color: const Color(0xff2E3339),
                fontFamily: Assets.fonts.inter.interMedium,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              right: 7,
              bottom: 5,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                SizedBox(height: 31, child: Assets.svg.recaptchaLogo.svg()),
                const SizedBox(height: 7),
                const Text(
                  'reCAPTCHA',
                  style: TextStyle(
                    fontSize: 10,
                    color: Color(0xff2E3339),
                  ),
                ),
                const Text(
                  'Privacy - Terms',
                  style: TextStyle(
                    fontSize: 8,
                    color: Color(0xff2E3339),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
