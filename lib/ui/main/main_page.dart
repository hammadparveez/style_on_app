import 'package:flutter/gestures.dart';
import 'package:style_on_app/domain/services/riverpod/pods.dart';
import 'package:style_on_app/exports.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  late PageController pageController;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = const [
      Home(),
      AddProductScreen(),
      SignUp(),
      OnBoard(),
    ];
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    var body = Scaffold(
      bottomNavigationBar: _buildBottomNavigation(),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (changedIndex) =>
            setState(() => selectedIndex = changedIndex),
        itemCount: pages.length,
        itemBuilder: (ctx, index) => pages[index],
      ),
    );

      return  Consumer(builder: (context, watch, child) {
      final authNotifier = watch(authStateNotifyPod);
    return authNotifier.when(
      error: (_, __) => child!,
      loading: () => child!,
      data: (data) => data != null ? child! : const AuthScreen(),
    );
    },
    child: body,);
  }

  SalomonBottomBar _buildBottomNavigation() {
    return SalomonBottomBar(
      currentIndex: selectedIndex,
      items: salomonBottomBarItems,
      curve: Curves.decelerate,
      duration: const Duration(milliseconds: 500),
      selectedItemColor: Colors.black,
      onTap: (index) {
        debugPrint("$index Salmon");
        pageController.animateToPage(index,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        selectedIndex = index;
        setState(() {});
      },
    );
  }
}
