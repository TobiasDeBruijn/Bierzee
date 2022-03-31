import 'package:bierzee/entities/user.dart';
import 'package:bierzee/util/http.dart';
import 'package:bierzee/views/components/admin/beer_price.dart';
import 'package:bierzee/views/components/admin/recent_payments.dart';
import 'package:bierzee/views/components/admin/users.dart';
import 'package:bierzee/views/components/home/balance.dart';
import 'package:bierzee/views/components/home/beer.dart';
import 'package:bierzee/views/components/home/notification.dart';
import 'package:bierzee/views/components/home/payment.dart';
import 'package:bierzee/views/components/about/server_info.dart';
import 'package:bierzee/views/components/home/user.dart';
import 'package:bierzee/views/login.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  GlobalKey<BalanceComponentState> balanceComponentKey = GlobalKey();

  int _bottomNavigationIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      _getHomePage(),
      _getAboutPage(),
    ];

    List<BottomNavigationBarItem> navigationItems = [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Over'
      ),
    ];

    if(widget.user.isAdmin) {
      navigationItems.add(BottomNavigationBarItem(
        icon: Icon(Icons.admin_panel_settings),
        label: 'Admin'
      ));

      pages.add(_getAdminPage());
    }

    return Scaffold(
      appBar: _getAppBar(),
      body: pages[_bottomNavigationIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomNavigationIndex,
        onTap: (index) {
          setState(() {
            _bottomNavigationIndex = index;
          });
        },
        items: navigationItems
      ),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      title: const Text('Bierzee'),
      actions: [
        IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async {
            Response<void> success = await widget.user.doLogout();
            if(!success.handleNotOk(context)) {
              return;
            }

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => LoginView()));
          },
        )
      ],
    );
  }

  Widget _getAdminPage() {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          BeerPriceComponent(user: widget.user),
          AdminUserComponent(user: widget.user),
          RecentPaymentsComponent(user: widget.user),
        ],
      ),
    );
  }

  Widget _getAboutPage() {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          ServerInfoComponent(),
        ],
      )
    );
  }

  Widget _getHomePage() {
    return Container(
      padding: EdgeInsets.all(8),
      child: ListView(
        children: [
          UserComponent(user: widget.user),
          NotificationListComponent(user: widget.user),
          BalanceComponent(key: balanceComponentKey, user: widget.user),
          PaymentComponent(user: widget.user, balanceComponentKey: balanceComponentKey),
          BeerComponent(user: widget.user, balanceComponentKey: balanceComponentKey),
        ],
      ),
    );
  }
}