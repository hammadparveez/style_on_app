import 'package:line_icons/line_icon.dart';
import 'package:style_on_app/exports.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: StyleOTitleWidget(),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.letsExplorDesc,
                        style: Theme.of(context).textTheme.headline2),
                    const Spacer(),
                    FractionallySizedBox(
                      widthFactor: 1,
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                          onPressed: () {
                            debugPrint("pressed");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(AppStrings.letsExplore),
                              const SizedBox(width: 8),
                              Flexible(
                                child: LayoutBuilder(
                                    builder: (context, constraints) {
                                  final halfWidthOfBtn =
                                      constraints.maxWidth / 2;
                                  return MirrorAnimation<Offset>(
                                      curve: Curves.easeInOutQuad,
                                      tween: Tween(
                                          begin: const Offset(0, 0),
                                          end: Offset(halfWidthOfBtn, 0.0)),
                                      builder: (context, child, offset) {
                                        return Transform.translate(
                                          offset: offset,
                                          child: const Icon(
                                              Icons.arrow_forward_rounded),
                                        );
                                      });
                                }),
                              ),
                            ],
                          )),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
              colorFilter:
                  ColorFilter.mode(Colors.black54, BlendMode.hardLight),
              image: AssetImage(ImagePaths.onBoardImg),
              fit: BoxFit.cover),
        ),
      ),
    );
  }
}
