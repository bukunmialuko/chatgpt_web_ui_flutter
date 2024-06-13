import 'package:chatgpt_web_ui/features/chat/widgets/chat_history.dart';
import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.dark,
      width: 261,
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 9, top: 9, bottom: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: AppColors.dark,
              child: Container(
                margin: const EdgeInsets.only(bottom: 14),
                child: ListTile(
                  leading: SizedBox(height: 8, child: Assets.svg.plus.svg()),
                  title: const Text(
                    'New chat',
                    style: TextStyle(color: AppColors.white, fontSize: 13.5),
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.bright),
                    borderRadius: BorderRadius.circular(10.55),
                  ),
                ),
              ),
            ),
            const Expanded(
              child: ChatHistoryWidget(),
            ),
            const Divider(color: AppColors.bright),
            const _BottomSection(),
          ],
        ),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  const _BottomSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _BottomSectionItem(
          label: 'Clear conversations',
          icon: Assets.svg.delete.svg(),
          onPressed: () {},
        ),
        _BottomSectionItem(
          label: 'Light mode',
          icon: Assets.svg.contrast.svg(),
          onPressed: () {},
        ),
        _BottomSectionItem(
          label: 'OpenAI Discord',
          icon: Assets.svg.discord.svg(),
          onPressed: () {},
        ),
        _BottomSectionItem(
          label: 'Updates & FAQ',
          icon: Assets.svg.enlarge.svg(),
          onPressed: () {},
        ),
        _BottomSectionItem(
          label: 'Log out',
          icon: Assets.svg.logout.svg(),
          onPressed: () {},
        ),
      ],
    );
  }

  TextStyle get textStyle => const TextStyle(color: AppColors.white);
}

class _BottomSectionItem extends StatelessWidget {
  const _BottomSectionItem({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final Widget icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 12, left: 21, right: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: const Size.fromHeight(14),
        ),
        child: Row(
          children: [
            SizedBox(height: 14, width: 14, child: icon),
            const SizedBox(width: 14),
            Text(
              label,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
