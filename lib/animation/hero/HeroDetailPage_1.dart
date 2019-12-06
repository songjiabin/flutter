import 'package:flutter/material.dart';
import 'package:flutter_github/animation/hero/Game.dart';

/**
 * hero 动画详情
 */
class HerodetailPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Game game = ModalRoute
        .of(context)
        .settings
        .arguments;
    return new Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: SingleChildScrollView(
          child: new Column(
            children: [
              Hero(tag: 'hero${game.title}',
                child: new Container(
                  //宽度
                    width: 500,
                    child: Image.asset('${game.imageUrl}',
                      height: 500,
                      fit: BoxFit.cover,
                    )


                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}