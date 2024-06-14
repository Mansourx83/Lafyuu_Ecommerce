import 'package:ecommerce_trining/my_import.dart';

class CustomOutLineBotton extends StatelessWidget {

  final String text;
  final Icon icon;
  void Function()? onPressed;
   CustomOutLineBotton({super.key, required this.text, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: OutlinedButton.styleFrom(
        alignment: Alignment.centerLeft,
        fixedSize: Size(context.width, 60),
      ),
      onPressed: onPressed,
      icon: Icon(icon.icon, size: 26),
      label: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
}
}
