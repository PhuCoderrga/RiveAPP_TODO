import 'package:flutter/cupertino.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/values/rive_assets_value.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    Key? key,
    required RiveAnimationController btnAnimationColtroller,
    required this.press,
  })  : _btnAnimationColtroller = btnAnimationColtroller,
        super(key: key);

  final RiveAnimationController _btnAnimationColtroller;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
          height: 46,
          width: 170,
          child: Stack(
            children: [
              RiveAnimation.asset(
                RiveAssets.button,
                controllers: [_btnAnimationColtroller],
              ),
              Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(CupertinoIcons.arrow_right),
                    SizedBox(width: 8),
                    Text(
                      'Start the course',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
