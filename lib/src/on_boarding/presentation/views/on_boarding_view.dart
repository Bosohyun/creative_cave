import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/src/on_boarding/domain/entities/page_content.dart';
import 'package:creative_cave/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:creative_cave/src/on_boarding/presentation/widgets/on_boarding_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: BlocConsumer<OnBoardingCubit, OnBoardingState>(
        listener: (context, state) {
          if (state is OnBoardingStatus && !state.isFirstTimer) {
            Navigator.of(context).pushReplacementNamed('/home');
          } else if (state is UserCached) {
            Navigator.of(context).pushReplacementNamed('/');
          }
        },
        builder: (context, state) {
          if (state is CheckingIfUserIsFirstTimer ||
              state is CachingFirstTimer) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Stack(
            children: [
              PageView(
                controller: pageController,
                children: const [
                  OnBoardingBody(
                    pageContent: PageContent.first(),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
