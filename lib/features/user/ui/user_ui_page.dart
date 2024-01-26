import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:random_user_api/features/user/bloc/user_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late UserBloc userBloc = UserBloc();
  @override
  void initState() {
    super.initState();

    userBloc.add(UserInitialEvent());
  }

  @override
  void dispose() {
    userBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('R A N D O M  U S E R  A P I')),
        backgroundColor: Colors.red[200],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        bloc: userBloc,
        listenWhen: (previous, current) => current is UserActionState,
        buildWhen: (previous, current) => current is! UserActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case UserFetchingLoadingState:
              return Center(child: CircularProgressIndicator());
            case UserFetchingSuccessState:
              final users = state as UserFetchingSuccessState;
              return Container(
                  child: ListView.builder(
                      itemCount: users.user.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users.user[index].fullName),
                          subtitle: Text(users.user[index].email),
                        );
                      }));

            case UserFetchingErrorState:
              return Center(
                child: Text('API failed'),
              );
            default:
              return Container();
          }
        },
      ),
    );
  }
}
