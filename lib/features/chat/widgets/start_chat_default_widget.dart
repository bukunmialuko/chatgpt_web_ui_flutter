import 'package:chatgpt_web_ui/generated/assets.gen.dart';
import 'package:chatgpt_web_ui/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

List<String> examples = [
  '“Explain quantum computing in simple terms” →',
  """“Got any creative ideas for a 10 year old’s birthday?” →""",
  """“How do I make an HTTP  request in Javascript?” →"""
];

List<String> capabilities = [
  """Remembers what user said earlier in the conversation""",
  """“Allows user to provide follow- up corrections""",
  """“Trained to decline inappropriate requests"""
];

List<String> limitations = [
  """May occasionally generate incorrent information""",
  """“May occasionally produce harmful instructions or biased content""",
  """“Limited knowledge of world and events after 2021"""
];

class StartChatDefaultWidget extends StatelessWidget {
  const StartChatDefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 141),
        const Text(
          'ChatGPT',
          style: TextStyle(
            fontSize: 34,
            color: AppColors.white,
          ),
          textAlign: TextAlign.center,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                _Column(
                  title: 'Examples',
                  labels: examples,
                  icon: Assets.svg.contrast.svg(),
                ),
                const SizedBox(width: 14),
                _Column(
                  title: 'Capabilities',
                  labels: capabilities,
                  icon: Assets.svg.flash.svg(),
                ),
                const SizedBox(width: 14),
                _Column(
                  title: 'Limitations',
                  labels: limitations,
                  icon: Assets.svg.limitations.svg(),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _Column extends StatelessWidget {
  final String title;
  final List<String> labels;
  final Widget icon;
  const _Column({
    required this.title,
    required this.labels,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 69),
          Container(
            width: 230,
            height: 62,
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Center(
                    child: SizedBox(
                      width: 22,
                      height: 22,
                      child: Assets.svg.contrast.svg(),
                    ),
                  ),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 21),
          ListView.separated(
            shrinkWrap: true,
            itemBuilder: (c, i) => Center(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.bright,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 13, vertical: 15),
                width: 230,
                alignment: Alignment.center,
                child: Text(
                  labels[i],
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            separatorBuilder: (c, i) => const SizedBox(height: 16),
            itemCount: labels.length,
          ),
        ],
      ),
    );
  }
}
