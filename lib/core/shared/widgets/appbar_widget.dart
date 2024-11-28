import 'package:flutter/material.dart';
import 'package:teste_betalent/core/theme/theme_colors.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
      child: AppBar(
        leading: CircleAvatar(
          backgroundColor: ThemeColors.gray5,
          child: Text(
            'CG',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SizedBox(
              height: 32.0,
              width: 32.0,
              child: Stack(
                children: [
                  const Icon(
                    Icons.notifications_outlined,
                    size: 32.0,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 8.0,
                      child: Text(
                        '02',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 10.0, color: ThemeColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68.0);
}
