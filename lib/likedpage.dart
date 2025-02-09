import 'package:flutter/material.dart';
import 'model.dart';
import 'detailpage.dart';

class LikedRecipesPage extends StatefulWidget {
  const LikedRecipesPage({super.key});

  @override
  State<LikedRecipesPage> createState() => _LikedRecipesPageState();
}

class _LikedRecipesPageState extends State<LikedRecipesPage> {
  List<Recipe> get _likedRecipes {
    return recipes.where((recipe) => recipe.like).toList();
  }

  void unlike(Recipe recipe) {
    setState(() {
      recipe.like = !recipe.like;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resep Favorit"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: _likedRecipes.isEmpty
          ? Center(
              child: Text("Tidak Ada Resep Favorit"),
            )
          : ListView.builder(
              itemCount: _likedRecipes.length,
              itemBuilder: (context, index) {
                final recipe = _likedRecipes[index];
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    ListTile(
                      tileColor: Colors.grey,
                      leading: Hero(
                        tag: recipe.image,
                        child: Image.network(recipe.image),
                      ),
                      title: Text(recipe.title),
                      subtitle: Text(recipe.description),
                      trailing: IconButton(
                        onPressed: () => unlike(recipe),
                        icon: Icon(
                          Icons.favorite,
                          color: recipe.like ? Colors.red : Colors.white,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail(
                              title: recipe.title,
                              description: recipe.description,
                              image: recipe.image,
                              ingredients: recipe.ingredients,
                              steps: recipe.steps,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
