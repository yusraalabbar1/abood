import 'package:abood/constant/colors.dart';
import 'package:flutter/material.dart';

class welcomStore extends StatelessWidget {
  final formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var nameFake;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          // margin: EdgeInsets.only(top: 35),
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          color: Colors.black,
          // decoration: const BoxDecoration(
          //   color: Color.fromARGB(255, 37, 37, 37),
          //   image: DecorationImage(
          //     image: AssetImage("assets/images/7.png"),
          //     fit: BoxFit.contain,
          //   ),
          // ),
          child: Image.asset("assets/images/10.jpg"),
        ),
        Container(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                expandedHeight: 380,
                elevation: 0.0,
                backgroundColor: Colors.transparent,
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          color: Color.fromARGB(255, 21, 21, 21),
                          child: Image.asset("assets/images/10.jpg"),
                        ),
                        Column(
                          children: [
                            Container(
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                        color: Color.fromARGB(255, 46, 45, 48),
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(40),
                                          topLeft: Radius.circular(40),
                                        ),
                                        gradient: LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.black38,
                                            Color.fromARGB(255, 151, 152, 152),
                                          ],
                                        )),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const SizedBox(
                                          height: 60,
                                        ),
                                        const Text(
                                          "Welcom..",
                                          style: TextStyle(
                                              color: MyColors.color3,
                                              fontFamily: 'Nunito',
                                              fontSize: 50),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.only(
                                              left: 30, right: 30),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "This is a merchant app to help you with basic operation.",
                                            style: TextStyle(
                                                color: MyColors.color3,
                                                fontSize: 20,
                                                fontFamily: 'majallab'),
                                          ),
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 60,
                                          margin: const EdgeInsets.only(
                                              bottom: 10,
                                              right: 30,
                                              left: 30,
                                              top: 30),
                                          child: RaisedButton(
                                            color: Colors.white,
                                            elevation: 10,
                                            splashColor: MyColors.color3,
                                            shape: const RoundedRectangleBorder(
                                                // borderRadius:
                                                //     BorderRadius.circular(25),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(40),
                                                  bottomLeft:
                                                      Radius.circular(40),
                                                  bottomRight:
                                                      Radius.circular(40),
                                                ),
                                                side: BorderSide(
                                                    color: Colors.white,
                                                    width: 2)),
                                            onPressed: () {
                                              Navigator.of(context)
                                                  .pushReplacementNamed(
                                                      "MainScreenStor");
                                            },
                                            child: const Text(
                                              "Get Start",
                                              style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontFamily: 'Nunito',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}

Widget buildSliverAppBar() {
  return SliverAppBar(
    expandedHeight: 350,
    elevation: 0.0,
    flexibleSpace: FlexibleSpaceBar(
      centerTitle: true,
      background: Hero(
        tag: 1,
        child: Container(
          color: Colors.transparent,
        ),
      ),
    ),
  );
}
