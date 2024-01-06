import 'package:dookanti/feuters/dashboard/presintation/view/categorys_view.dart';
import 'package:dookanti/feuters/dashboard/presintation/view/users_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class DashBoardViewBody extends StatelessWidget {
  const DashBoardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Expanded(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.6,
              ),
              children: const [
                DashBoardGridViewItem(
                  title: 'Users',
                  icon: IconlyLight.user3,
                  number: '216',
                  color: Color(0xff15AFF2),
                  navigator: UsersView.id,
                ),
                DashBoardGridViewItem(
                  title: 'Categorys',
                  icon: IconlyLight.category,
                  number: '10',
                  color: Color(0xff0ECA12),
                  navigator: CategorysView.id,
                ),
                DashBoardGridViewItem(
                  title: 'Products',
                  icon: IconlyLight.bag2,
                  number: '200',
                  color: Color(0xff0E3EE7),
                  navigator: UsersView.id,
                ),
                DashBoardGridViewItem(
                  title: 'Orders',
                  icon: IconlyLight.buy,
                  number: '30',
                  color: Color(0xffF7851D),
                  navigator: UsersView.id,
                ),
                DashBoardGridViewItem(
                  title: 'Conect Us',
                  icon: IconlyLight.call,
                  number: '5',
                  color: Color(0xffF11111),
                  navigator: UsersView.id,
                ),
                DashBoardGridViewItem(
                  title: 'Complaints',
                  icon: IconlyLight.document,
                  number: '5',
                  color: Color(0xffF20505),
                  navigator: UsersView.id,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DashBoardGridViewItem extends StatelessWidget {
  const DashBoardGridViewItem({
    super.key,
    required this.title,
    required this.icon,
    required this.number,
    required this.color,
    required this.navigator,
  });
  final String title;
  final IconData icon;
  final String number;
  final Color color;
  final String navigator;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, navigator);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 1),
              blurRadius: 6,
              color: Colors.grey.shade200,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: color,
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
            const Spacer(),
            Text(
              number,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
