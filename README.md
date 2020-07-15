# annotation_fluro

A Fluro router config mapping solution based on source_gen through annotation

一个以注解方式实现的fluro路由映射解决方案。

## Description

[Fluro](https://github.com/theyakka/fluro)是一个强大的企业级路由管理器，但其路由的注册比较麻烦，每个页面都需要进行相应的注册处理。[annotation_fluro](https://github.com/shiwenwen/annotation_fluro)通过dart编译期注解，自动生成路由注册代码，让你轻松管理路由。并对已有工程无侵害，不需要修改已有的路由代码。

## Installation
```
dev_dependencies:
  annotation_fluro: any
```
## Usage

1. 在你的页面组件上使用`@Fouter('/path')`进行注解即可：
```Dart
import 'package:annotation_fluro/route.dart';

@FRoute('/a')
class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ...
  }
}
```
1.1 通常情况下，你可能只需像上面那样配置一个路径的`url`就可以了。**`annotation_fluro`会自动查找页面的构造器，并根据构造器的需要参数，从路由参数中取同名的参数的值进行传递给构造器。** `@Fouter`也可以配置自定义构造器`constructor`和`fluro`原有属性，如默认转场动画类型`transitionType`，路由处理函数`handlerFunc`。
> 自动传参时，会对于基本数据类型`Number`, `bool`等自动进行类型转换。
```Dart
class FRoute extends BaseFRoute {
  final String routePath;
  final HandlerType handlerType;
  final HandlerFunc handlerFunc;
  final TransitionType transitionType;
  final String constructor;

  const FRoute(this.routePath,
      {this.handlerType = HandlerType.route,
      this.handlerFunc,
      this.transitionType,
      this.constructor});
}
```
上面的`PageA`，会自动调用构造器`PageA()`创建页面。

> 由于`PageA`未实现构造器方法，会生成一个默认构造器`PageA()`。

1.2 如果页面实现了多个构造器，那么`annotation_fluro`会默认调用第一个构造函数。如果你需要指定构造函数，那么使用`constructor`即可：
```Dart
import 'package:annotation_fluro/route.dart';

@FRoute('/c', constructor: 'PageC.from') // 指定使用构造函数 PageC.from
class PageC extends StatelessWidget {
  final String from;
  PageC() : this.from = '';
  PageC.from({this.from});

  @override
  Widget build(BuildContext context) {
    ...
  }
}
```
通过 `router.navigateTo(context, '/c?from=PageB')`跳转`PageC`，会通过`PageC.from({this.from})`构造函数创建`PageC`。并且把`from=PageB`传递给`PageC`。

1.3 如果自动构造满足不了需求，那么可以通过实现`handlerFunc`进行处理：
```Dart
Widget pageDHandler(BuildContext _, Map<String, List<String>> params) => PageD(
      from: params['from']?.first,
    );

@FRoute('/d', handlerFunc: pageDHandler)
class PageD extends StatelessWidget {
  final String from;

  PageD({this.from});

  @override
  Widget build(BuildContext context) {
    ...
  }
}
```

2. 你需要给你原先的路由管理类（可以是任何类，甚至是你的`MyAPP`）添加`@FRootRoute()`注解。我相信你会有个路由管理类，如果没有，你可以建立一个空类，他只是生成注解代码的一个桥梁。
```Dart
import 'routers.f_route.g.dart'; // 会根据当前rootRoute类文件自动生成

@FRootRoute()
class Routers {
  
}
```
2.1 然后终端执行:
```shell
flutter packages pub run build_runner clean
flutter packages pub run build_runner build --delete-conflicting-outputs
```
进行注解代码生成。

2.2 你需要初始化时调用`*f_route.g.dart`中`registerFluroRouter({Router aRouter})`进行路由统一注册，如果你项目中已有全局的`ruoter`了，那么将`router`传递进去即可。否则`registerFluroRouter`会自动生成一个`router`并返回，你应该将这个`router`进行全局处理，因为你需要用它进行导航操作。
```Dart
/// routers.dart

@FRootRoute()
class Routers {
  static final Router router = registerFluroRouter();
}

///main.dart
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: Routers.router.generator,
      home: MyHomePage(),
    );
  }
}
```
3. 具体使用可参考`example`。