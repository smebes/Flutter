

AnimationController _animationController;


  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animationController.repeat(reverse: false); 
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
  }
  
  FadeTransition(
    opacity: _animationController,
    child: GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Stack(
          children: [
            Container(
              width: 76,
              height: 32,
              decoration: const BoxDecoration(
                color: Color.fromARGB(159, 255, 255, 255),
                borderRadius: BorderRadius.all(Radius.circular(180))),

            ),
            Positioned(
              top: 0,
              left: 0,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0),
                    child:
                    Container(
                      height: 30,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/mini.png'),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    'Promotion',
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        final ProductDetailIntentHolder holder =
            ProductDetailIntentHolder(
                productId: promoteCarItemId,
                heroTagImage: '-1' + promoteCarItemId + PsConst.HERO_TAG__IMAGE,
                heroTagTitle: '-1' + promoteCarItemId + PsConst.HERO_TAG__TITLE);
        Navigator.pushNamed(context, RoutePaths.productDetail,
            arguments: holder);
      },
    ),
  ),

