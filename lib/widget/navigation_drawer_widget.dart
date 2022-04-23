import 'package:flutter/material.dart';

class NavigationDrawerWidiget extends StatelessWidget {
  const NavigationDrawerWidiget({ Key? key }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color.fromRGBO(192, 13, 75, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(context: context),
            buildMenuItem(
              text: 'Entidades',
              icon: Icons.home_outlined,
              context: context,
              route: '/home'
            ),
            buildMenuItem(
              text: 'Minhas Doações',
              icon: Icons.payments_outlined,
              context: context,
              route: 'doacoes',
            ),
            const Divider(color: Colors.white54),
            buildMenuItem(
              text: 'Sair',
              icon: Icons.logout_outlined,
              context: context,
              route: '/logoff'
            )
          ],
        ),
      )
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    required BuildContext context,
    required String route,
  }) {
    
    const color = Colors.white;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        text,
        style: TextStyle(color: Colors.white.withOpacity(1.0)),
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget buildHeader({
    required BuildContext context,
  }) {
    
    return Container(
      color: Colors.white24,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        bottom: 15
      ),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 54,
            backgroundImage: NetworkImage('https://pbs.twimg.com/profile_images/1514638321007435782/AhXg9nWb_400x400.jpg'),
          ),
          SizedBox(height: 12),
          Text(
            'username',
            style: TextStyle(fontSize: 28, color: Colors.white)
          )
        ],
      ),
    );
  }
}