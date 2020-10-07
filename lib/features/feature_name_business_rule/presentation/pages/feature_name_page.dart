import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/feature_name_bloc/bloc.dart';

class FeatureNamePage extends StatefulWidget {
  @override
  _FeatureNamePageState createState() => _FeatureNamePageState();
}

class _FeatureNamePageState extends State<FeatureNamePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<FeatureNameBloc>(
        create: (context) => sl<FeatureNameBloc>(),
        child: BlocBuilder<FeatureNameBloc, FeatureNameState>(
          builder: (context, state) {
            if (state is FeatureNameErrorState) {
              return Center(child: Text(state.message));
            }
            if (state is FeatureNameResultState) {
              return Center(
                child: Container(
                    color: Colors.green,
                    child: Text(state.result.value.toString())),
              );
            }
            //Loading Widget
            return GestureDetector(
              onTap: () {
                BlocProvider.of<FeatureNameBloc>(context).add(
                    GetFeatureNameEvent(properties: 'do something with this'));
              },
              child: Container(
                color: Colors.greenAccent,
              ),
            );
          },
        ),
      ),
    );
  }
}
