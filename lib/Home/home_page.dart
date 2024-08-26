import 'package:complex_example_serialization/Home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc = HomeBloc();
  @override
  void initState() {
    homeBloc.add(FetchUserDataEvent());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "User Data",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
      ),
      body: BlocConsumer(
        bloc: homeBloc,
        listenWhen: (current, previous) => current is HomeActionState,
        buildWhen: (current, previous) => current is! HomeActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case FetchingUserState:
              final successState = state as FetchingUserState;
              return Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                color: Colors.grey.shade300,
                child: ListView.builder(
                    itemCount: successState.userList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(successState.userList[index].name.toString()),
                        subtitle: Text(successState
                            .userList[index].address!.geo!.lng
                            .toString()),
                        trailing: Text(successState.userList[index].company!.name
                            .toString()),
                      );
                    }),
              );
            case LoadingUserState:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case LoadingErrorState:
              return const Text("Nothing to show");

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
