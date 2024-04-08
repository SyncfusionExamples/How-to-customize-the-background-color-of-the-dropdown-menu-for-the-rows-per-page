import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

/// The application that contains datagrid on it.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Syncfusion DataGrid Demo',
      theme: ThemeData(useMaterial3: false),
      home: const MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.

class MyHomePage extends StatefulWidget {
  /// Creates the home page.

  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

int _rowsPerPage = 2;

const double _dataPagerHeight = 60.0;

List<Employee> _pageEmployee = [];

List<Employee> _paginatedEmployee = [];

class _MyHomePageState extends State<MyHomePage> {
  List<GridColumn> columns = [];
  late EmployeeDataSource employeeDataSource;
  bool showCheckboxColumn = false;
  int i = 10;

  @override
  void initState() {
    super.initState();
    _pageEmployee = getEmployeeData();
    columns = getColumns();
    employeeDataSource = EmployeeDataSource(employeeData: _pageEmployee);
  }

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

  Widget _buildDataGrid(BoxConstraints constraint) {
    return SfDataGrid(
      allowSorting: true,
      allowFiltering: true,
      showCheckboxColumn: showCheckboxColumn,
      source: employeeDataSource,
      columnWidthMode: ColumnWidthMode.fill,
      columns: columns,
    );
  }

  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'id',
          label: Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const Text(
                'ID',
              ))),
      GridColumn(
          columnName: 'name',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Name'))),
      GridColumn(
          columnName: 'designation',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text(
                'Designation',
                overflow: TextOverflow.ellipsis,
              ))),
      GridColumn(
          columnName: 'salary',
          label: Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.center,
              child: const Text('Salary'))),
    ];
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 20000),
      Employee(10002, 'Kathryn', 'Manager', 30000),
      Employee(10003, 'Lara', 'Developer', 15000),
      Employee(10004, 'Michael', 'Designer', 15000),
      Employee(10005, 'Martin', 'Developer', 15000),
      Employee(10006, 'Newberry', 'Developer', 15000),
      Employee(10007, 'Balnc', 'Developer', 15000),
      Employee(10008, 'Perry', 'Developer', 15000),
      Employee(10009, 'Gable', 'Developer', 15000),
      Employee(10010, 'Grimes', 'Developer', 15000),
      Employee(10011, 'Doran', 'Developer', 15000),
      Employee(10012, 'Banda', 'Developer', 15000),
      Employee(10013, 'Banks', 'Developer', 15000),
      Employee(10014, 'Santana', 'Developer', 15000),
      Employee(10015, 'Banks', 'Developer', 15000),
      Employee(10016, 'Santana', 'Developer', 15000),
      Employee(10017, 'Banks', 'Developer', 15000),
      Employee(10018, 'Santana', 'Developer', 15000),
      Employee(10019, 'Banks', 'Developer', 15000),
      Employee(10020, 'Santana', 'Developer', 15000),
      Employee(10021, 'Banks', 'Developer', 15000),
      Employee(10022, 'Santana', 'Developer', 15000),
      Employee(10023, 'Banks', 'Developer', 15000),
      Employee(10024, 'Santana', 'Developer', 15000),
      Employee(10025, 'Banks', 'Developer', 15000),
      Employee(10026, 'Santana', 'Developer', 15000),
      Employee(10027, 'Banks', 'Developer', 15000),
      Employee(10028, 'Santana', 'Developer', 15000),
      Employee(10029, 'Banks', 'Developer', 15000),
      Employee(10030, 'Santana', 'Developer', 15000),
      Employee(10031, 'James', 'Project Lead', 20000),
      Employee(10032, 'Kathryn', 'Manager', 30000),
      Employee(10033, 'Lara', 'Developer', 15000),
      Employee(10034, 'Michael', 'Designer', 15000),
      Employee(10035, 'Martin', 'Developer', 15000),
      Employee(10036, 'Newberry', 'Developer', 15000),
      Employee(10037, 'Balnc', 'Developer', 15000),
      Employee(10038, 'Perry', 'Developer', 15000),
      Employee(10039, 'Gable', 'Developer', 15000),
      Employee(10040, 'Grimes', 'Developer', 15000),
      Employee(10041, 'James', 'Project Lead', 20000),
      Employee(10042, 'Kathryn', 'Manager', 30000),
      Employee(10043, 'Lara', 'Developer', 15000),
      Employee(10044, 'Michael', 'Designer', 15000),
      Employee(10045, 'Martin', 'Developer', 15000),
      Employee(10046, 'Newberry', 'Developer', 15000),
      Employee(10047, 'Balnc', 'Developer', 15000),
      Employee(10048, 'Perry', 'Developer', 15000),
      Employee(10049, 'Gable', 'Developer', 15000),
      Employee(10050, 'Grimes', 'Developer', 15000),
      Employee(10051, 'James', 'Project Lead', 20000),
      Employee(10052, 'Kathryn', 'Manager', 30000),
      Employee(10053, 'Lara', 'Developer', 15000),
      Employee(10054, 'Michael', 'Designer', 15000),
      Employee(10055, 'Martin', 'Developer', 15000),
      Employee(10056, 'Newberry', 'Developer', 15000),
      Employee(10057, 'Balnc', 'Developer', 15000),
      Employee(10058, 'Perry', 'Developer', 15000),
      Employee(10059, 'Gable', 'Developer', 15000),
      Employee(10060, 'Grimes', 'Developer', 15000),
    ];
  }
}

/// Custom business object class which contains properties to hold the detailed

/// information about the employee which will be rendered in datagrid.

class Employee {
  /// Creates the employee class with required details.

  Employee(this.id, this.name, this.designation, this.salary);

  /// Id of an employee.

  final int id;

  /// Name of an employee.

  final String name;

  /// Designation of an employee.

  final String designation;

  /// Salary of an employee.

  final int salary;

  int? age;
}

/// An object to set the employee collection data source to the datagrid. This

/// is used to map the employee data to the datagrid widget.

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.

  EmployeeDataSource({required List<Employee> employeeData}) {
    _paginatedEmployee = employeeData.getRange(0, 2).toList(growable: false);

    buildPaginatedDataGridRows();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  @override
  Future<bool> handlePageChange(int oldPageIndex, int newPageIndex) async {
    int startIndex = newPageIndex * _rowsPerPage;

    int endIndex = startIndex + _rowsPerPage;

    if (startIndex < _pageEmployee.length && endIndex <= _pageEmployee.length) {
      _paginatedEmployee =
          _pageEmployee.getRange(startIndex, endIndex).toList(growable: false);

      buildPaginatedDataGridRows();

      notifyListeners();
    } else {
      _paginatedEmployee = [];
    }

    return true;
  }

  void buildPaginatedDataGridRows() {
    _employeeData = _paginatedEmployee
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<int>(columnName: 'id', value: e.id),
              DataGridCell<String>(columnName: 'name', value: e.name),
              DataGridCell<String>(
                  columnName: 'designation', value: e.designation),
              DataGridCell<int>(columnName: 'salary', value: e.salary),
              if (e.age != null)
                DataGridCell<int>(columnName: 'age', value: e.age),
            ]))
        .toList(growable: false);
  }

  void updateDataGriDataSource() {
    notifyListeners();
  }
}
