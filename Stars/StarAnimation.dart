class __HeaderBoxWidgetState extends State<_HeaderBoxWidget> {

  List<WhereStar> listStar = <WhereStar>[];
  Animation _animation;
  Animation animatedStar1, animatedStar2, animatedStar3, animatedStar4;


void initState() {
    super.initState();
    
    final animationCurve = CurvedAnimation(
        curve: Curves.easeInExpo,
        reverseCurve: Curves.easeIn,
        parent: widget.animationController);
    _animation = Tween<double>(begin: 5, end: 6).animate(animationCurve)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.animationController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          widget.animationController.forward();
        }
      });

    animatedStar1 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: Interval(0.0, 0.5)));
    animatedStar1.addListener(() {
      setState(() {});
    });
    animatedStar2 = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: Interval(0.5, 1.0)));
    animatedStar2.addListener(() {
      setState(() {});
    });
    animatedStar3 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: Interval(0.0, 0.5)));
    animatedStar3.addListener(() {
      setState(() {});
    });
    animatedStar4 = Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: widget.animationController, curve: Interval(0.5, 1.0)));
    animatedStar4.addListener(() {
      setState(() {});
    });

    for (int i = 0; i < 500; i++) {
      listStar.add(WhereStar(
          left: Random().nextDouble() * 500,
          // bottom: Random().nextDouble() * 200,
          top: Random().nextDouble() * 400,
          extraSize: Random().nextDouble() * 8,
          angle: Random().nextDouble(),
          typeFade: Random().nextInt(4),
          color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255))));
    }
    widget.animationController.forward();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  // Drawing Stars on the Promotion Car page
  Widget buildStar(double left, double top, double extraSize, double angle,
      int typeFade, Color color) {
    return Positioned(
      child: Container(
        child: Transform.rotate(
          child: Transform.translate(
            offset: Offset(_animation.value, 100.0),
            child: Opacity(
              child: Icon(
                Icons.star,
                color: color,
                size: _animation.value * 1.5 + extraSize,
              ),
              opacity: (typeFade == 1)
                  ? animatedStar1.value
                  : (typeFade == 2)
                      ? animatedStar2.value
                      : (typeFade == 3)
                          ? animatedStar3.value
                          : animatedStar4.value,
            ),
          ),
          angle: angle,
        ),
        alignment: FractionalOffset.center,
      ),
      left: left,
      top: top,
    );
  }

  Widget buildGroupStar() {
    List<Widget> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(buildStar(
        listStar[i].left,
        listStar[i].top,
        listStar[i].extraSize,
        listStar[i].angle,
        listStar[i].typeFade,
        listStar[i].color,
      ));
    }
    return Stack(children: list);
  }
  
   child: Stack(
      children: [
         if (controlPromotionCar())
        Positioned(
          top: 0,
          left: 0,
          child: Stack(
            children: [
              Container(
                width: 500,
                height: 1000,
                child: buildGroupStar(),
              )
            ],
          ),
        ),
      ],
    ),
        
}

class WhereStar {
  double left;
  double top;
  double extraSize;
  double angle;
  int typeFade;
  Color color;

  WhereStar({
    @required this.left,
    @required this.top,
    @required this.extraSize,
    @required this.angle,
    @required this.typeFade,
    @required this.color,
  });
}
