import 'package:clean_architecture_template/core/network/basicRequest/basic_request.dart';
import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:dio/dio.dart';
import '../bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
    //test();
  }

  Future<void> test() async {
    Response response = await sl.get<BasicRequest>().send(url: '');

    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<TestBloc>(
        create: (context) => sl<TestBloc>(),
        child: BlocBuilder<TestBloc, TestState>(
          builder: (context, state) {
            if (state is TestLoadedState) {
              return Container(
                color: Colors.lightGreen,
                child: Text(state.model.ad.text),
              );
            }
            if (state is TestErrorState) {
              return Center(
                  child: Text(state.message));
            }
            if(state is TestOfflineState){
              return Center(child: Container(color: Colors.purple, child: Text(state.message)),);
            }
            //Loading Widget
            return GestureDetector(
              onTap: () {
                BlocProvider.of<TestBloc>(context).add(GetTestEvent(aid: '1'));
              },
              child: Container(
                color: Colors.orange,
              ),
            );
          },
        ),
      ),
    );
  }
}
