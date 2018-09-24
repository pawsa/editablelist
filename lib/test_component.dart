import 'dart:async';

import 'package:angular/angular.dart';

import 'package:angular_components/laminate/popup/module.dart';
import 'package:angular_components/material_button/material_button.dart';
import 'package:angular_components/material_list/material_list.dart';
import 'package:angular_components/material_list/material_list_item.dart';
import 'package:angular_components/material_select/material_dropdown_select.dart';
import 'package:angular_components/model/selection/selection_model.dart';
import 'package:angular_components/model/selection/selection_options.dart';
import 'package:angular_components/model/selection/string_selection_options.dart';
class Item {
  String person;
  String month;
  SelectionModel selected;
  Item(String person, String month) {
    this.person = person;
    this.month = month;
    this.selected = SelectionModel.single(selected: month);
    this.selected.selectionChanges.listen((e) {
          print('Almost Got change for ' + this.month);
          this.month = selected.selectedValues.first.toString();
          print('REALLY Got change to ' + this.month);
        });
  }
  String get selectedMonth => selected.selectedValues.isEmpty
    ? "?" : selected.selectedValues.first.toString();


  blurred() {
    print('Blurred ' + person + ' ' + month + ' ' + selectedMonth);
  }
}

@Component(
    selector: 'test-list',
    styleUrls: [ 'test_component.css'],
    templateUrl: 'test_component.html',
    providers: popupBindings,
    directives: [
      coreDirectives,
      MaterialButtonComponent,
      MaterialDropdownSelectComponent,
    ],
)
class TestListComponent implements OnInit {
  var daswidth = 300;
  var primary = SelectionModel.single(selected: 'January');
  
  var items = [Item('A', 'January'), Item('B', 'February')];

  var allowed = SelectionOptions<String>.fromList([
    'January', 'February', 'March', 'April', 'May', 'June'
  ]);

  void ngOnInit() async {
    print('TestList oninit');
  } 

  String get primaryText => primary.selectedValues.isEmpty
    ? "?" : primary.selectedValues.first.toString();


  printItems() {
    items.forEach((i) => print('i' + i.person + ' ' + i.month +
            ' :' + i.selectedMonth));
  }
}