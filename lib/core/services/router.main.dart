part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final prefs = sl<SharedPreferences>();
      return _pageBuilder((context) {
        if (prefs.getBool(kFirstTimerKey) ?? true) {
          return BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingView());
        } else if (sl<FirebaseAuth>().currentUser != null) {
          final user = sl<FirebaseAuth>().currentUser!;
          final localUser = LocalUserModel(
            uid: user.uid,
            email: user.email ?? '',
            points: 0,
            fullName: user.displayName ?? '',
          );
          context.usesProvider.initUser(localUser);
          return const Dashboard();
        }
        return BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const SignInView(),
        );
      }, settings: settings);

    case '/forgot-password':
      return _pageBuilder(
        (_) => const fui.ForgotPasswordScreen(),
        settings: settings,
      );

    case '/settings':
      return _pageBuilder((_) => const SettingsView(), settings: settings);

    case SignInView.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
                create: (_) => sl<AuthBloc>(),
                child: const SignInView(),
              ),
          settings: settings);

    case SignUpView.routeName:
      return _pageBuilder(
          (_) => BlocProvider(
                create: (context) => sl<AuthBloc>(),
                child: const SignUpView(),
              ),
          settings: settings);

    default:
      return _errorRoute();
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}

Route<dynamic> _errorRoute() {
  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Error'),
      ),
      body: const Center(
        child: Text('ERROR'),
      ),
    ),
  );
}
