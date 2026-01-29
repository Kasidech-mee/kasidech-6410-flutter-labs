import 'package:flutter/material.dart';
import 'package:kasidech_widgets_exercises/models/article_model.dart';
import 'package:kasidech_widgets_exercises/utils/responsive.dart';

final List<Article> articles = const [
  Article(
    title: 'Introduction to Flutter',
    description: 'Learn the basics of Flutter development...',
    date: '2024-01-05',
    readingTimeMinutes: 5,
  ),
  Article(
    title: 'Advanced Widget Patterns',
    description: 'Discover advanced patterns in Flutter...',
    date: '2024-01-04',
    readingTimeMinutes: 8,
  ),
  Article(
    title: 'State Management in Flutter',
    description: 'Explore different state management approaches...',
    date: '2024-01-03',
    readingTimeMinutes: 12,
  ),
  Article(
    title: 'Building Responsive UIs',
    description: 'Create apps that work on any screen size...',
    date: '2024-01-02',
    readingTimeMinutes: 10,
  ),
];

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "News Feed",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (Responsive.isMobile(constraints.maxWidth)) {
            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index].title,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        articles[index].description,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articles[index].date,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          Text(
                            "${articles[index].readingTimeMinutes.toString()} min read",
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (Responsive.isTablet(constraints.maxWidth)) {
            return GridView.builder(
              itemCount: articles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 3
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index].title,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        articles[index].description,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articles[index].date,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          Text(
                            "${articles[index].readingTimeMinutes.toString()} min read",
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return GridView.builder(
              itemCount: articles.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                childAspectRatio: 3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.surfaceContainer, borderRadius: BorderRadius.circular(8.0)),
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        articles[index].title,
                        style: Theme.of(context).textTheme.titleLarge
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                      ),
                      Text(
                        articles[index].description,
                        style: Theme.of(context).textTheme.bodyMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            articles[index].date,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                          Text(
                            "${articles[index].readingTimeMinutes.toString()} min read",
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
