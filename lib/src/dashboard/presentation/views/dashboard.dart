import 'package:creative_cave/core/extensions/context_extension.dart';
import 'package:creative_cave/src/chat/presentation/views/chat_view.dart';
import 'package:creative_cave/src/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:creative_cave/src/home/presentation/views/home_view.dart';
import 'package:creative_cave/src/settings/views/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  final List<Widget> pages = const [
    HomeView(),
    ChatView(),
    SettingsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: _mainWrapperBody(),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: context.theme.colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: context.theme.colorScheme.primary.withOpacity(0.1),
                ),
              ],
            ),
            child: GNav(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                backgroundColor: Colors.transparent,
                color: context.theme.colorScheme.background,
                activeColor: context.theme.colorScheme.background,
                haptic: true,
                gap: 8,
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: Icons.chat,
                    text: 'Chat',
                  ),
                  GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  ),
                ],
                selectedIndex: state.tabIndex,
                onTabChange: (index) => pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    )),
          ),
        );
      },
    );
  }

  PageView _mainWrapperBody() {
    return PageView(
      controller: pageController,
      children: pages,
      onPageChanged: (
        int index,
      ) {
        context.read<DashboardBloc>().add(
              TabChange(index),
            );

        print(index);
      },
    );
  }
}
