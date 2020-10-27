import 'package:ecommerce_full/ui/ios/pages/home.page.dart';
import 'package:flutter/cupertino.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        backgroundColor: CupertinoColors.lightBackgroundGray,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            title: Text('Carrinho'),
          )
        ],
      ),
      tabBuilder: (context, index) {
        CupertinoTabView(
          builder: (context) {
            switch (index) {
              case 0:
                return HomePage();

              case 1:
                return Container(
                  color: CupertinoColors.activeGreen,
                );

              default:
                return Container(
                  color: CupertinoColors.activeGreen,
                );
            }
          },
        );
      },
    );
  }
}
