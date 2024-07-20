import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/internet_bloc.dart';

class BuildWid extends StatelessWidget {  // Make sure class names are capitalized
  const BuildWid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetState>(
      builder: (context, state) {
        if (state is ConnectedState) {
          return Text(state.message);
        } else if (state is NotConnectedState) {  // Correct spelling
          return Text(state.message);
        }
        return Center(
          child: SizedBox(
            child: Text('Checking connectivity...'),  // Message when state is unknown
          ),
        );
      },
    );
  }
}
