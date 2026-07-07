import 'package:url_launcher/url_launcher.dart';

void openLinkedIn() async {
  final url = Uri.parse("https://www.linkedin.com/in/krunal-maisuriya");
  await launchUrl(url);
}

void openGithub() async {
  final url = Uri.parse("https://github.com/krunal-maisuriya");
  await launchUrl(url);
}

void sendEmail() async {
  final email = Uri.parse("mailto:akkimaisuriya@gmail.com");
  await launchUrl(email);
}

void callPhone() async {
  final phone = Uri.parse("tel:+971502883728");
  await launchUrl(phone);
}