import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flowers/data/dataprovider/mainhttp.dart';
import 'package:flowers/data/models/mainmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {

  final BuildContext context;

  MainBloc(this.context) : super(LoadingState());
  final MainHttps _mainHttps = MainHttps();
  MainModel _mainModel;
  String data;


  @override
  Stream<MainState> mapEventToState(MainEvent event,) async* {
    if (event is LaunchEvent) {

    }
  }



}
