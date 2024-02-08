import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/src/on_boarding/domain/entities/page_content.dart';
import 'package:creative_cave/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:creative_cave/src/on_boarding/presentation/widgets/on_boarding_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(pageContent.title,
            textAlign: TextAlign.center,
            style: context.theme.textTheme.displayLarge),
        Image.asset(pageContent.image, height: context.height * .4),
        SizedBox(height: context.height * .03),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayMedium,
              ),
              SizedBox(
                height: context.height * .05,
              ),
              OnBoardingButton(
                text: 'Get Started',
                onPressed: () {
                  context.read<OnBoardingCubit>().cacheFirstTimer();
                },
              )
            ],
          ),
        ),
      ],
    );
  }
}
