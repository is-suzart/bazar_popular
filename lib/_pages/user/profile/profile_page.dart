import 'package:bazar_popular/shared/emitter/emitter_store.dart';
import 'package:bazar_popular/shared/helpers/local.dart';
import 'package:bazar_popular/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProfilePage extends StatelessWidget {
  final _emitterStore = emitterStore;
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_emitterStore.userInfo == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return LayoutGrid(columnSizes: twelveGrid, rowSizes: [
        1.0.fr
      ], children: [
        Card(
          margin: const EdgeInsets.only(top: 36),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 48),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          setImageUrl(_emitterStore.userInfo!.profilePicture)),
                    ),
                    Text(_emitterStore.userInfo!.name,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: primaryColor)),
                  ],
                ),
                Text(_emitterStore.userInfo!.email),
                Text(_emitterStore.userInfo!.telephone),
              ],
            ),
          ),
        ).withGridPlacement(columnSpan: 8, columnStart: 2, rowStart: 0),
      ]);
    });
  }
}
