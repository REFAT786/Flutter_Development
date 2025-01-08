import 'package:flutter/material.dart';
import 'package:service_booking_app/seekers/common/widgets/custom_contact_us_list_tile.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({Key? key}) : super(key: key);

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  int _selectedTabIndex = 0;
  final List<String> _categories = ['General', 'Account', 'Service', 'Video', 'all'];
  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus.',
      'isExpanded': false,
    },
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
      'Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus.',
      'isExpanded': false,
    },
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
      'Maecenas eget condimentum velit, sit amet feugiat lectus.',
      'isExpanded': false,
    },
    {
      'question': 'Lorem ipsum dolor sit amet?',
      'answer':
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
      'isExpanded': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Help Center"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          // Tabs
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 0;
                    });
                  },
                  child: Text(
                    "FAQ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _selectedTabIndex == 0 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedTabIndex = 1;
                    });
                  },
                  child: Text(
                    "Contact us",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: _selectedTabIndex == 1 ? Colors.black : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          if (_selectedTabIndex == 0) ...[
            // Category Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categories
                    .map((category) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: Text(category, style: TextStyle(color: Colors.black),),
                    selected: _categories.indexOf(category) == 0,
                    onSelected: (_) {},
                    selectedColor: Colors.blue,
                    labelStyle: const TextStyle(color: Colors.white),
                  ),
                ))
                    .toList(),
              ),
            ),
            const SizedBox(height: 10),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.filter_alt)),
              )
            ),
            const SizedBox(height: 10),
            // FAQ List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _faqs.length,
                itemBuilder: (context, index) {
                  final faq = _faqs[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        faq['question'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(faq['answer']),
                        ),
                      ],
                      onExpansionChanged: (isExpanded) {
                        setState(() {
                          faq['isExpanded'] = isExpanded;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ] else ...[
            // Contact Us Tab Content
             Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                      return CustomContactUsListTile();
                    },
                    )

                  ],
                )
              ),
            ),
          ],
        ],
      ),
    );
  }
}
