import 'package:flowers/data/dataprovider/mainhttp.dart';
import 'package:flowers/data/models/productmodel.dart';
import 'package:flowers/presentation/pages/mainpage/cubitviewflowers/viewflowers_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:rating_dialog/rating_dialog.dart';

class ViewFlowers1 extends StatelessWidget {
  static String structure;
  static String height;
  static String descriptions;
  static String sellersId;
  static String prices;
  static String name;
  static String size;
  static String recommendation;

  static List<ProductModelImages> images;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ViewFlowersCubit>(
      create: (context) => ViewFlowersCubit(),
      child: ViewFlowers(),
    );
  }
}

class ViewFlowers extends StatefulWidget {
  @override
  _ViewFlowersState createState() => _ViewFlowersState();
}

class _ViewFlowersState extends State<ViewFlowers> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // images();
  }



  @override
  Widget build(BuildContext context) {
    double sizeScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height:MediaQuery.of(context).size.height*1.1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(
                    sizeScreen * 0.02, sizeScreen * 0.1, 1, 1),
                child: Row(
                  children: [
                    Container(
                      width: sizeScreen * 0.15,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(sizeScreen * 0.05),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueGrey.shade200,
                                blurRadius: 0.1,
                                offset: Offset(0.2, 0.1),
                                spreadRadius: 0.01)
                          ]),
                      child: Center(
                        child: IconButton(
                            icon: Icon(Icons.arrow_back_ios),
                            alignment: Alignment.center,
                            onPressed: () {
                              Navigator.of(context).pop();
                            }),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Цветы",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: sizeScreen * 0.1),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sizeScreen * 0.01,
              ),

              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 350,
                      width: sizeScreen*0.9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:ViewFlowers1.images.length,
                        itemBuilder: (context, index) {
                          return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // boxShadow: [
                                //   BoxShadow(
                                //       color: Colors.grey.shade200,
                                //       offset: Offset(0.2,0.2),
                                //       spreadRadius: 1,
                                //       blurRadius: 0.1
                                //   )
                                // ]
                            ),
                            child: Image.network(
                              'https://fl.route.uz/img/${ViewFlowers1.images[index].image}',
                              fit: BoxFit.cover,
                            ),
                          );
                      },),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Цена",
                              style: TextStyle(
                                  fontSize: sizeScreen * 0.04,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${ViewFlowers1.prices} sum",
                              style: TextStyle(
                                  fontSize: sizeScreen * 0.06,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Размер",
                              style: TextStyle(
                                  fontSize: sizeScreen * 0.04,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${ViewFlowers1.size}",
                              style: TextStyle(
                                  fontSize: sizeScreen * 0.06,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: Container(
                    width: sizeScreen,
                    padding: EdgeInsets.all(sizeScreen * 0.015),
                    margin: EdgeInsets.symmetric(
                        horizontal: sizeScreen * 0.01,
                        vertical: sizeScreen * 0.01),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 10,
                              spreadRadius: 0.1,
                              offset: Offset(0.2, 0.2))
                        ],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${ViewFlowers1.structure} ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: sizeScreen * 0.045,
                              fontWeight: FontWeight.w700),
                        ),
                        SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "${ViewFlowers1.descriptions}",
                                textAlign: TextAlign.justify,
                              ),
                              Text(
                                "${ViewFlowers1.recommendation}",
                                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w600),
                                textAlign: TextAlign.justify,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: sizeScreen * 0.03,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Container(
                                  width: sizeScreen * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          sizeScreen * 0.05),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey.shade200,
                                            blurRadius: 0.1,
                                            offset: Offset(0.2, 0.1),
                                            spreadRadius: 0.01)
                                      ]),
                                  child: Center(
                                    child: IconButton(
                                        icon: Icon(Icons.remove),
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          BlocProvider.of<ViewFlowersCubit>(
                                                  context)
                                              .decrement();
                                        }),
                                  ),
                                ),
                                SizedBox(
                                  width: sizeScreen * 0.03,
                                ),
                                BlocConsumer<ViewFlowersCubit, ViewFlowersState>(
                                  builder: (context, state) {
                                    return Text(
                                      "${state.counterValue.toString()}",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    );
                                  },
                                  listener: (context, state) {
                                    if (state.wasIncremented == true) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              duration:
                                                  Duration(milliseconds: 400),
                                              content: Text(
                                                  "${state.counterValue.toString()}")));
                                    } else if (state.wasIncremented == false) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              duration:
                                                  Duration(milliseconds: 400),
                                              content: Text("---")));
                                    }
                                  },
                                ),
                                SizedBox(
                                  width: sizeScreen * 0.03,
                                ),
                                Container(
                                  width: sizeScreen * 0.15,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          sizeScreen * 0.05),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.blueGrey.shade200,
                                            blurRadius: 0.1,
                                            offset: Offset(0.2, 0.1),
                                            spreadRadius: 0.01)
                                      ]),
                                  child: Center(
                                    child: IconButton(
                                        icon: Icon(Icons.add),
                                        alignment: Alignment.center,
                                        onPressed: () {
                                          BlocProvider.of<ViewFlowersCubit>(
                                                  context)
                                              .increment();
                                          // context.bloc<ViewFlowersCubit>(context).increment();
                                        }),
                                  ),
                                ),
                              ],
                            )),
                            Expanded(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    // #rating
                                    final _dialog = RatingDialog(
                                      // your app's name?
                                      title: 'Оценивать',
                                      // encourage your user to leave a high rating?
                                      commentHint: "Комментарий",
                                      message:
                                          'Коснитесь звездочки, чтобы установить свой рейтинг.'
                                          ' Добавьте сюда больше описания, если хотите.',
                                      // your app's logo?
                                      // image:
                                      image: Image.network(
                                          "https://fl.route.uz/img/products/1200/G75Pl6SKYtUG.jpg"),
                                      submitButton: 'Разместить',
                                      onCancelled: () => print('cancelled'),
                                      onSubmitted: (response) {
                                        print(
                                            'rating: ${response.rating}, comment: ${response.comment}');

                                        // TODO: add your own logic
                                        if (response.rating < 3.0) {
                                          // send their comments to your email or anywhere you wish
                                          // ask the user to contact you instead of leaving a bad review
                                        } else {
                                          // _rateAndReviewApp();
                                          print(response.rating);
                                          print(response.comment);
                                        }
                                      },
                                    );

// show the dialog
                                    showDialog(
                                      context: context,
                                      builder: (context) => _dialog,
                                    );
                                    // Componentes.bottomSheet(
                                    //     context: context, sizeScreen: sizeScreen);
                                  },
                                  child: Column(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Colors.orange,
                                      ),
                                      Text(
                                        "рейтинг",
                                        style: TextStyle(
                                            fontSize: sizeScreen * 0.025),
                                      ),
                                    ],
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {}),
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: sizeScreen * 0.03,
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    Container(
                                      width: sizeScreen * 0.3,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              sizeScreen * 0.05),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.blueGrey.shade200,
                                                blurRadius: 0.1,
                                                offset: Offset(0.2, 0.1),
                                                spreadRadius: 0.01)
                                          ]),
                                      child: Center(
                                        child: IconButton(
                                            icon: Icon(
                                                Icons.shopping_cart_outlined),
                                            alignment: Alignment.center,
                                            onPressed: () {}),
                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 3,
                                child: Row(
                                  children: [
                                    MaterialButton(
                                      onPressed: () {},
                                      color: Colors.white,
                                      child: Text(
                                        "Купи сейчас",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 22),
                                      ),
                                      minWidth: sizeScreen * 0.55,
                                      height: sizeScreen * 0.1,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                    ),
                                  ],
                                ))
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
