class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: "Decide What You Want",
      image: 'assets/c.png',
      discription: "Discover all the products that you need"),
  UnbordingContent(
      title: 'Live Tracking',
      image: 'assets/c.png',
      discription:
          "Real time tracking of your commands once you placed the order "),
  UnbordingContent(
      title: 'Manage All Things',
      image: 'assets/c.png',
      discription: "Manage you services.Api.clients,incoms and much more "),
];
