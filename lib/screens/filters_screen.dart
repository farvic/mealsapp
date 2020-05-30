import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _glutenFree = false;

  initState(){
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
    _glutenFree = widget.currentFilters['gluten'];
    
    super.initState();
  }


  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(
        description
      ),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegetarian': _vegetarian,
                'vegan': _vegan,
              };
              widget.saveFilters(selectedFilters);
            },
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding:  EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          //Expanded: A container which ensures that its child widget takes up as much space
          //as it can get in the surround column or row
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals.',
                  _vegetarian,
                  (newValue){setState(() {
                      _vegetarian = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue){setState(() {
                      _vegan = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue){setState(() {
                      _glutenFree = newValue;
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include gluten-free meals.',
                  _lactoseFree,
                  (newValue){setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                ),
              ]
            ),
          ),
        ],    
      ),
    );
  }
}