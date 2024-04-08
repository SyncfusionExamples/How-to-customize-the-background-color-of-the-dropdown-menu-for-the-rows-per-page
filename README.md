# How to customize the background color of the dropdown menu for the rows per page in Flutter DataGrid (SfDataGrid)?

In this article, you can learn about how to customize the color of the checkbox in [Flutter DataGrid](https://www.syncfusion.com/flutter-widgets/flutter-datagrid).

Initialize the [SfDataGrid](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataGrid-class.html) widget with all the required properties. You can customize the background color of the dropdown menu by using the [Theme](https://api.flutter.dev/flutter/material/Theme-class.html) widget. To achieve this, wrap the [SfDataPager](https://pub.dev/documentation/syncfusion_flutter_datagrid/latest/datagrid/SfDataPager-class.html) as a child of the Theme widget. The [copyWith](https://api.flutter.dev/flutter/material/TextTheme/copyWith.html) method is used to create a copy of the current theme data and set the desired values for [canvasColor](https://api.flutter.dev/flutter/material/ThemeData/canvasColor.html) in the Theme class.

```dart
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
      body: LayoutBuilder(builder: (context, constraint) {
        return Column(children: [
          SizedBox(
              height: constraint.maxHeight - _dataPagerHeight,
              width: constraint.maxWidth,
              child: _buildDataGrid(constraint)),
          SizedBox(
            height: _dataPagerHeight,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.red),
              child: SfDataPager(
                delegate: employeeDataSource,
                pageCount: _pageEmployee.length / _rowsPerPage,
                availableRowsPerPage: const [2, 5, 10],
                onRowsPerPageChanged: (value) {
                  setState(() {
                    if (value != null) {
                      _rowsPerPage = value;
                    }
                  });
                },
                direction: Axis.horizontal,
              ),
            ),
          )
        ]);
      }),
    );
  }
```

Download the example from [GitHub](https://github.com/SyncfusionExamples/How-to-customize-the-background-color-of-the-dropdown-menu-for-the-rows-per-page).