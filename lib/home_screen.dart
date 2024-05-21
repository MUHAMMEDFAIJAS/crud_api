import 'package:crud_functions/add_screen.dart';
import 'package:crud_functions/edit_screen.dart';
import 'package:crud_functions/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Serviceprovider>(builder: (context, pro, _) {
        return FutureBuilder(
          future: pro.fetchall(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('error${snapshot.hasError}'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final data = snapshot.data![index];

                  return ListTile(
                    title: Text(data.name.toString()),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditScreen(
                                      name: data.name.toString(),
                                      email: data.email.toString(),
                                      address: data.address.toString(),
                                      phone: data.phone.toString(),
                                      id: data.id)));
                      },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              pro.deletaAlldata(data.id!);
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
