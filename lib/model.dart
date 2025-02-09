class Recipe {
  final String title;
  final String description;
  final String image;
  final String ingredients;
  final String steps;
  bool like;

  Recipe({
    required this.title,
    required this.description,
    required this.image,
    required this.ingredients,
    required this.steps,
    required this.like,
  });
}

List<Recipe> recipes = [
  Recipe(
      title: "Nasi Goreng",
      description: "Nasi goreng sigma",
      image:
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT51lAlx0ctKCDEJdnKbIDxvTODh8I4wfGP3b8rLe5upnqggC0m0dFjTn6fMIZhZZTry2VgUiRO2DtOGfnegx7AgIG7FW324li75xXWQg",
      ingredients: "- Nasi\n- Telur\n- Kecap Manis\n- Bawang Putih",
      steps:
          "1. Tumis bawang putih\n2. Masukkan telur, aduk rata\n3. Masukkan nasi dan kecap, aduk hingga matang",
      like: false),
  Recipe(
    title: "Mie Goreng",
    description: "Mie Goreng Sigma",
    image:
        "data:image/webp;base64,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",
    ingredients: "- Mie Instan\n- Telur\n- Sayuran\n- Saus Kecap",
    steps:
        "1. Rebus mie, tiriskan\n2. Tumis bumbu dan telur\n3. Masukkan mie dan aduk rata dengan saus",
    like: false,
  ),
  Recipe(
      title: "Ayam Bakar",
      description: "Ayam bakar dengan bumbu spesial",
      image:
          "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcStL_D_2xaqusRpsTexOKcFpUROhjefnBOCWT-LP0MwZLmVhcZ7etje6gmw1huky52B1yh2SnynlX0Y8kO65PDkPF5yrNqNqqoGIpLg_w",
      ingredients: "- Ayam\n- Kecap Manis\n- Bumbu Rempah\n- Jeruk Nipis",
      steps:
          "1. Lumuri ayam dengan bumbu dan jeruk nipis\n2. Diamkan selama 30 menit\n3. Bakar ayam hingga matang sambil dioles kecap",
      like: false),
  Recipe(
      title: "Sate Ayam",
      description: "Sate ayam dengan bumbu kacang",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSBiFFH9-Ugx_jCDBerd01wcH9Lh1Vr_4-xq8gOaNdQxWn7prGSw5-nM81qHBKjcDiyXjI&usqp=CAU",
      ingredients:
          "- Daging Ayam\n- Kecap Manis\n- Bumbu Kacang\n- Bawang Merah",
      steps:
          "1. Potong ayam dan tusuk dengan tusukan sate\n2. Campur ayam dengan kecap dan bumbu\n3. Bakar hingga matang dan sajikan dengan bumbu kacang",
      like: false),
  Recipe(
      title: "Bakso Kuah",
      description: "Bakso dengan kuah gurih",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBPakoZZTKsZdeRMstQ0C2cl-yOgoMA7iMqgNXZENWAGWInoqp968jTr1C1B8xYCSBx3A&usqp=CAU",
      ingredients: "- Bakso\n- Kuah Kaldu\n- Mie\n- Seledri",
      steps:
          "1. Panaskan kuah kaldu\n2. Masukkan bakso dan mie\n3. Sajikan dengan seledri dan bawang goreng",
      like: false),
];
