import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data_provider.dart';
import 'model.dart';

class DataHomeScreen extends ConsumerWidget {
  const DataHomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userData = ref.watch(userDataProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("User Data"),
        centerTitle: true,
      ),
      body: userData.when(data: (data){
        List<Data> userList = data.map((e) => e).toList();
        return SafeArea(child: Padding(padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text("${userList[index].firstName!} ${userList[index].lastName!}", style: TextStyle(fontSize: 16),),
                        subtitle: Text(userList[index].email!, style: TextStyle(fontSize: 14),),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(userList[index].avatar!),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
      },
          error: (err, s) => Center(child: Text(err.toString()),),
          loading: () => Center(child: CircularProgressIndicator(color: Colors.white,),)),
    );
  }
}
