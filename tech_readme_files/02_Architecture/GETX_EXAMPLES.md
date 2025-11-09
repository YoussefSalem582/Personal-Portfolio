# 🚀 GetX State Management - Quick Reference

## Basic Usage Examples

### 1. **Using Theme Controller**

```dart
import 'package:get/get.dart';
import 'package:personal_portfolio/controllers/theme_controller.dart';

// In any widget
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    
    return Obx(() => Text(
      themeController.isDarkMode ? 'Dark Mode' : 'Light Mode',
    ));
  }
}

// Toggle theme
onPressed: () => Get.find<ThemeController>().toggleTheme()
```

### 2. **Using Portfolio Controller**

```dart
import 'package:get/get.dart';
import 'package:personal_portfolio/controllers/portfolio_controller.dart';

class ProjectsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final portfolioController = Get.find<PortfolioController>();
    
    return Obx(() {
      if (portfolioController.isLoading) {
        return CircularProgressIndicator();
      }
      
      return ListView.builder(
        itemCount: portfolioController.projects.length,
        itemBuilder: (context, index) {
          final project = portfolioController.projects[index];
          return ListTile(title: Text(project.title));
        },
      );
    });
  }
}

// Refresh data
onPressed: () => Get.find<PortfolioController>().refreshProjects()
```

### 3. **Show Snackbar**

```dart
import 'package:personal_portfolio/utils/getx_helper.dart';

// Success message
GetXHelper.showSuccess('Success', 'Data saved successfully');

// Error message
GetXHelper.showError('Error', 'Something went wrong');

// Info message
GetXHelper.showInfo('Info', 'New updates available');

// Warning message
GetXHelper.showWarning('Warning', 'Please check your input');
```

### 4. **Show Loading Dialog**

```dart
import 'package:personal_portfolio/utils/getx_helper.dart';

// Show loading
GetXHelper.showLoading('Saving data...');

// Perform async operation
await Future.delayed(Duration(seconds: 2));

// Hide loading
GetXHelper.hideLoading();
```

### 5. **Confirmation Dialog**

```dart
import 'package:personal_portfolio/utils/getx_helper.dart';

final confirmed = await GetXHelper.showConfirmDialog(
  title: 'Delete Project',
  message: 'Are you sure you want to delete this project?',
  confirmText: 'Delete',
  cancelText: 'Cancel',
);

if (confirmed) {
  // Delete the project
}
```

### 6. **Navigation**

```dart
import 'package:get/get.dart';

// Navigate to new page
Get.to(() => DetailsPage());

// Navigate with arguments
Get.to(() => DetailsPage(), arguments: {'id': 123});

// Navigate and replace current page
Get.off(() => HomePage());

// Navigate and clear all previous routes
Get.offAll(() => LoginPage());

// Go back
Get.back();

// Go back with result
Get.back(result: {'success': true});
```

### 7. **Reactive Variables**

```dart
import 'package:get/get.dart';

class CounterController extends GetxController {
  // Simple observable
  final count = 0.obs;
  
  // Observable list
  final items = <String>[].obs;
  
  // Observable map
  final data = <String, dynamic>{}.obs;
  
  // Nullable observable
  final user = Rxn<User>();
  
  // Methods
  void increment() => count.value++;
  void addItem(String item) => items.add(item);
  void updateData(String key, dynamic value) => data[key] = value;
}

// In Widget
Obx(() => Text('Count: ${controller.count}'))
```

### 8. **GetX Lifecycle**

```dart
class MyController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Called immediately after controller is created
    print('Controller initialized');
  }
  
  @override
  void onReady() {
    super.onReady();
    // Called after widget is rendered on screen
    print('Controller ready');
  }
  
  @override
  void onClose() {
    // Called before controller is disposed
    print('Controller closing');
    super.onClose();
  }
}
```

### 9. **Workers (Reactions)**

```dart
class SearchController extends GetxController {
  final searchText = ''.obs;
  final results = <String>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    
    // Called every time searchText changes
    ever(searchText, (_) => print('Search text changed'));
    
    // Called only once when searchText changes
    once(searchText, (_) => print('First time user searched'));
    
    // Wait 1 second after user stops typing
    debounce(
      searchText,
      (_) => performSearch(),
      time: Duration(seconds: 1),
    );
    
    // Called every 3 seconds while searchText is changing
    interval(
      searchText,
      (_) => print('User is typing...'),
      time: Duration(seconds: 3),
    );
  }
  
  void performSearch() {
    // Perform search operation
  }
}
```

### 10. **Dependency Injection**

```dart
// Lazy put (only created when first used)
Get.lazyPut<MyController>(() => MyController());

// Put (created immediately)
Get.put(MyController());

// Put async (for services that need initialization)
Get.putAsync(() async {
  final service = MyService();
  await service.init();
  return service;
});

// Find controller
final controller = Get.find<MyController>();

// Delete controller
Get.delete<MyController>();

// Check if controller exists
if (Get.isRegistered<MyController>()) {
  // Controller exists
}
```

## Common Patterns

### Pattern 1: Form Handling

```dart
class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  final isLoading = false.obs;
  final errorMessage = RxnString();
  
  Future<void> login() async {
    if (emailController.text.isEmpty) {
      errorMessage.value = 'Email is required';
      return;
    }
    
    isLoading.value = true;
    errorMessage.value = null;
    
    try {
      await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );
      Get.offAll(() => HomePage());
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
  
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
```

### Pattern 2: API Data Loading

```dart
class DataController extends GetxController {
  final data = <Item>[].obs;
  final isLoading = false.obs;
  final error = RxnString();
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  
  Future<void> loadData() async {
    isLoading.value = true;
    error.value = null;
    
    try {
      final result = await apiService.fetchData();
      data.value = result;
    } catch (e) {
      error.value = e.toString();
      GetXHelper.showError('Error', 'Failed to load data');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> refresh() => loadData();
}
```

### Pattern 3: Filter and Search

```dart
class ProductController extends GetxController {
  final allProducts = <Product>[].obs;
  final filteredProducts = <Product>[].obs;
  final searchQuery = ''.obs;
  final selectedCategory = 'All'.obs;
  
  @override
  void onInit() {
    super.onInit();
    
    // Auto-filter when search or category changes
    ever(searchQuery, (_) => filterProducts());
    ever(selectedCategory, (_) => filterProducts());
    
    loadProducts();
  }
  
  void filterProducts() {
    var products = allProducts.where((p) {
      final matchesSearch = p.name
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase());
      
      final matchesCategory = selectedCategory.value == 'All' ||
          p.category == selectedCategory.value;
      
      return matchesSearch && matchesCategory;
    }).toList();
    
    filteredProducts.value = products;
  }
  
  Future<void> loadProducts() async {
    final products = await apiService.getProducts();
    allProducts.value = products;
    filterProducts();
  }
}
```

## Tips and Best Practices

1. **Use `.obs` for reactive variables**
   ```dart
   final count = 0.obs;  // Good
   int count = 0;        // Not reactive
   ```

2. **Access observable values with `.value`**
   ```dart
   count.value++;        // Good
   count++;              // Won't work
   ```

3. **Use `Obx()` for reactive UI**
   ```dart
   Obx(() => Text('${controller.count}'))  // Good
   Text('${controller.count}')             // Won't update
   ```

4. **Clean up resources in `onClose()`**
   ```dart
   @override
   void onClose() {
     textController.dispose();
     scrollController.dispose();
     super.onClose();
   }
   ```

5. **Use `Get.find()` carefully**
   ```dart
   // Make sure controller is already registered
   final controller = Get.find<MyController>();
   
   // Or check first
   if (Get.isRegistered<MyController>()) {
     final controller = Get.find<MyController>();
   }
   ```

## Performance Tips

1. Use `GetBuilder` for non-reactive updates (more efficient)
2. Use `Obx` only where necessary
3. Dispose controllers when not needed
4. Use `lazyPut` instead of `put` when possible
5. Avoid creating too many observables

## Common Mistakes to Avoid

1. ❌ Forgetting `.value` when accessing observables
2. ❌ Not wrapping reactive widgets with `Obx()`
3. ❌ Trying to use `Get.find()` before controller is registered
4. ❌ Not disposing resources in `onClose()`
5. ❌ Using `Get.put()` multiple times for same controller

---

**Happy coding with GetX! 🚀**
