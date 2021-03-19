import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Componentes{



  static bottomSheet({BuildContext context, double  sizeScreen}){
    showMaterialModalBottomSheet(

        enableDrag:true,
        duration: Duration(milliseconds: 600),
        context: context,
        builder: (context) => SingleChildScrollView(
          controller:
          ModalScrollController.of(context),
          child: Container(
            height: sizeScreen,
            child: Column(
              mainAxisAlignment:
              MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Комментарий",
                          style: TextStyle(
                              fontWeight:
                              FontWeight.w600,
                              color: Colors.black,
                              fontSize: sizeScreen *
                                  0.06),
                        ),
                        Divider(),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction:
                          Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                          EdgeInsets.symmetric(
                              horizontal: 4.0),
                          itemBuilder:
                              (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          children: [
                            Text(
                              "рейтинг",
                              style: TextStyle(
                                  fontSize:
                                  sizeScreen *
                                      0.025,
                                  color:
                                  Colors.black,
                                  fontWeight:
                                  FontWeight
                                      .w600),
                            ),
                            SizedBox(width: 10),
                          ],
                        ),
                        Divider(),
                      ],
                    )),
                CupertinoTextField(
                  autofocus: true,

                  minLines: 8,
                  maxLines: 10,
                ),
                MaterialButton(
                  minWidth: sizeScreen * 0.9,
                  color: Colors.white,
                  child: Text("Комментировать"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}