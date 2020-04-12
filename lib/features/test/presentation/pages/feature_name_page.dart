import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';

class FeatureNamePage extends StatefulWidget {
  @override
  _FeatureNamePageState createState() => _FeatureNamePageState();
}

class _FeatureNamePageState extends State<FeatureNamePage> {
  @override
  void initState() {
    super.initState();
    //test();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<FeatureNameBloc>(
        create: (context) => sl<FeatureNameBloc>(),
        child: BlocBuilder<FeatureNameBloc, FeatureNameState>(
          builder: (context, state) {
            if (state is FeatureNameLoadedState) {
              return Container(
                color: Colors.lightGreen,
                child: Text(state.model.ad.text),
              );
            }
            if (state is FeatureNameErrorState) {
              return Center(
                  child: Text(state.message));
            }
            if(state is FeatureNameOfflineState){
              return Center(child: Container(color: Colors.purple, child: Text(state.message)),);
            }
            //Loading Widget
            return GestureDetector(
              onTap: () {
                BlocProvider.of<FeatureNameBloc>(context).add(GetFeatureNameEvent(aid: '1'));
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
