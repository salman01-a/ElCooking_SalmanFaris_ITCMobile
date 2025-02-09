import 'package:flutter/material.dart';
import 'model.dart';
import 'detailpage.dart';
import 'likedpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  bool _showSearch = false;

  List<Recipe> get _filteredRecipes {
    if (_searchQuery.isEmpty) return recipes;
    return recipes.where((recipe) {
      return recipe.title.toLowerCase().contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: _showSearch
            ? TextField(
                // controller: _searchController,
                autofocus: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Cari resep...',
                  hintStyle: TextStyle(color: Colors.white70),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.restaurant_menu, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "EL Cooking",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
        actions: [
          IconButton(
            icon: Icon(
              _showSearch ? Icons.close : Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  // _searchController.clear();
                  _searchQuery = '';
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LikedRecipesPage(),
                ),
              );
              setState(() {});
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _filteredRecipes.length,
        itemBuilder: (context, index) {
          final recipe = _filteredRecipes[index];
          return Column(
            children: [
              SizedBox(height: 10),
              ListTile(
                tileColor: Colors.grey,
                leading: Hero(
                  tag: recipe.image,
                  child: Image.network(
                    recipe.image,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(recipe.title),
                subtitle: Text(recipe.description),
                trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      recipe.like = !recipe.like;
                    });
                  },
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
