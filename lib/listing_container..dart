import 'package:flutter/material.dart';
class ListingContainer extends StatefulWidget {
  const ListingContainer({super.key});

  @override
  State<ListingContainer> createState() => _ListingContainerState();
}

class _ListingContainerState extends State<ListingContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Style Bottom Sheet'),
      ),
      body: Stack(
        children: [
          // Google Map Placeholder (Replace with GoogleMap widget)
          Container(
            color: Colors.blue[200],
            child: Center(
              child: Text(
                "Google Map Placeholder",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          // Draggable Scrollable Bottom Sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3, // Initial height of the bottom sheet
            minChildSize: 0.2, // Minimum height
            maxChildSize: 0.8, // Maximum height
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // Drag Handle
                    Container(
                      width: 50,
                      height: 5,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.location_on),
                            title: Text('Location $index'),
                            subtitle: Text('Description of location $index'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
