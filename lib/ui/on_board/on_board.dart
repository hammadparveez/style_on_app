import 'package:style_on_app/exports.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const spacer = Spacer();
    const title = Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: StyleOTitleWidget(),
      ),
    );
    final exploreText = Text(
      AppStrings.letsExplorDesc,
      style: Theme.of(context).textTheme.headline2,
    );

    final expandedTitleAndBtn = Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          exploreText,
          spacer,
          FractionallySizedBox(
            widthFactor: 1,
            alignment: Alignment.bottomCenter,
            child: _buildAnimatedButton(context),
          ),
          largeVrtSpacer,
        ],
      ),
    );
    //Entire View
    return ScaffoldWithImage(
      bgImgPath: ImagePaths.onBoardImg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title,
          largestVrtSpacer,
          expandedTitleAndBtn,
        ],
      ),
    );
  }

  ElevatedButton _buildAnimatedButton(BuildContext context) {
    return ElevatedButton(
        onPressed: () => Navigator.of(context).pushNamed(Routes.auth),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(AppStrings.letsExplore),
            smallVrtSpacer,
            Flexible(
              child: LayoutBuilder(builder: (context, constraints) {
                return _buildBtnAnimation(constraints.maxWidth / 2);
              }),
            ),
          ],
        ));
  }

  Widget _buildBtnAnimation(double halfWidth) => MirrorAnimation<Offset>(
        curve: Curves.easeInOutQuad,
        tween: Tween(begin: const Offset(0, 0), end: Offset(halfWidth, 0.0)),
        builder: (context, child, offset) {
          return Transform.translate(
            offset: offset,
            child: const Icon(Icons.arrow_forward_rounded),
          );
        },
      );
}
