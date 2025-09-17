import 'package:flutter/material.dart';
import '../services/api_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService = ApiService();
  List<dynamic> movies = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  void loadMovies() async {
    try {
      final result = await apiService.getPopularMovies();
      setState(() {
        movies = result;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      print("Erreur lors du chargement des films: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.purple,
            child: Text(
              "Movie",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Container(
            width: double.infinity,
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavButton("Tout"),
                _buildNavButton("Western"),
                _buildNavButton("Horreur"),
                _buildNavButton("Comédie"),
              ],
            ),
          ),

          // Grande image en dessous des boutons
          Container(
            width: double.infinity,
            height: 200,
            child: Image.asset(
              'assets/images/CvRkG5qUMAAJ6rz.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Liste de films
          Expanded(
            child:
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      padding: EdgeInsets.all(10),
                      itemCount: movies.length > 3 ? 3 : movies.length,
                      itemBuilder: (context, index) {
                        return _buildCard(
                          title: movies[index]['title'] ?? 'Sans titre',
                          description:
                              movies[index]['overview'] ?? 'Pas de description',
                          imagePath: ApiService.getImageUrl(
                            movies[index]['poster_path'] ?? '',
                          ), // Utiliser une image par défaut
                        );
                      },
                    ),
          ),
        ],
      ),
    );
  }

  // Fonction pour créer un bouton de navigation
  Widget _buildNavButton(String text) {
    return TextButton(
      onPressed: () {
        // Action lors du clic sur le bouton
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
      ),
    );
  }

  // Fonction pour créer une carte avec image à gauche et texte à droite
  Widget _buildCard({
    required String title,
    required String description,
    required String imagePath,
  }) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      elevation: 4,
      child: Row(
        children: [
          // Partie image (à gauche)
          Expanded(
            flex: 2,
            child: Container(
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
          ),

          // Partie texte (à droite)
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
