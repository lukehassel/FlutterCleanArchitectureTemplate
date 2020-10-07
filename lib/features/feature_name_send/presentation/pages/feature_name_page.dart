import 'package:clean_architecture_template/core/service_locator.dart';
import 'package:clean_architecture_template/features/feature_name_send/domain/entities/feature_name_request_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    SchedulerBinding.instance.addPostFrameCallback((_) {
      /*BlocProvider.of<FeatureNameBloc>(context)
          .add(GetFeatureNameEvent(aid: '1'));*/
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<FeatureNameBloc>(
        create: (context) => sl<FeatureNameBloc>(),
        child: BlocBuilder<FeatureNameBloc, FeatureNameState>(
          builder: (context, state) {
            if (state is FeatureNameLoadedState) {
              return GestureDetector(
                onTap: () {
                  FeatureNameRequestEntity requestEntity =
                      new FeatureNameRequestEntity();
                  requestEntity.page = 3;
                  requestEntity.total = 4;

                  BlocProvider.of<FeatureNameBloc>(context)
                      .add(GetFeatureNameEvent(requestEntity: requestEntity));
                },
                child: Container(
                  height: 400,
                  color: Colors.blueGrey,
                  child: Text(state.model.ad.text),
                ),
              );
            }
            if (state is FeatureNameErrorState) {
              return GestureDetector(
                onTap: () {
                  FeatureNameRequestEntity requestEntity =
                      new FeatureNameRequestEntity();
                  requestEntity.page = 3;
                  requestEntity.total = 4;

                  BlocProvider.of<FeatureNameBloc>(context)
                      .add(GetFeatureNameEvent(requestEntity: requestEntity));
                },
                child: Container(
                  color: Colors.redAccent,
                  child: Text(state.message),
                ),
              );
            }
            if (state is FeatureNameOfflineState) {
              return Center(
                child:
                    Container(color: Colors.indigo, child: Text(state.message)),
              );
            }
            //Loading Widget
            return GestureDetector(
              onTap: () {
                FeatureNameRequestEntity requestEntity =
                    new FeatureNameRequestEntity();
                requestEntity.page = 3;
                requestEntity.total = 4;

                BlocProvider.of<FeatureNameBloc>(context)
                    .add(GetFeatureNameEvent(requestEntity: requestEntity));
              },
              child: Container(
                color: Colors.pink,
              ),
            );
          },
        ),
      ),
    );
  }
}
