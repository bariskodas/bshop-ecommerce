import 'package:bariskodas_testc/api/models/user_model.dart';
import 'package:bariskodas_testc/riverpod/riverpods.dart';
import 'package:bariskodas_testc/ui_components/loading_widget.dart';
import 'package:bariskodas_testc/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My profile"),
        actions: [
          IconButton(
              onPressed: () => ref.refresh(userProvider),
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: const DecorationImage(
                    image: AssetImage("assets/profile.jpeg"),
                    fit: BoxFit.cover),
              )),
          const Divider(),
          //! FutureProvider example
          ref.watch(userProvider).when(
              data: (UserModel _user) {
                return Padding(
                  padding: Constants.hPadding16,
                  child: Column(
                    children: [
                      ListTile(
                          title: Text(_user.name.toString()),
                          leading: const Icon(Icons.person_outline, size: 30),
                          trailing: const Icon(Icons.arrow_forward_ios)),
                      ListTile(
                        title: Text(_user.email.toString()),
                        leading: const Icon(Icons.mail, size: 30),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                          title: Text(_user.phone.toString()),
                          leading: const Icon(
                              CupertinoIcons.device_phone_portrait,
                              size: 30),
                          trailing: const Icon(Icons.arrow_forward_ios)),
                      ListTile(
                        title:
                            Text("Zip: " + _user.address!.zipcode.toString()),
                        leading: const Icon(Icons.code, size: 30),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        title: Text(
                            "${_user.address!.street}, ${_user.address!.city}"),
                        leading:
                            const Icon(Icons.location_on_rounded, size: 30),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => const LoadingWidget()),
        ],
      ))),
    );
  }
}
