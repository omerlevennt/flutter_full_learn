import 'package:flutter/material.dart';
import 'package:flutter_full_learn/202/lesson4/image_learn.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/model/resource_model.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/service/reqres_service.dart';
import 'package:flutter_full_learn/303/lesson3/reqres_resource/viewModel/reqres_provider.dart';
import 'package:flutter_full_learn/product/extension/string_extension.dart';
import 'package:flutter_full_learn/product/global/resource_context.dart';
import 'package:flutter_full_learn/product/global/theme_notifer.dart';
import 'package:flutter_full_learn/product/service/project_dio.dart';
import 'package:provider/provider.dart';

class ReqresViewAdvance extends StatefulWidget {
  const ReqresViewAdvance({super.key});

  @override
  State<ReqresViewAdvance> createState() => _ReqresViewAdvanceState();
}

class _ReqresViewAdvanceState extends State<ReqresViewAdvance>
    with ProjectDioMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReqresProvider>(
      create: (context) {
        return ReqresProvider(ResourceService(dio: service));
      },
      builder: (context, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              context.read<ThemeNotifer>().changeTheme();
            },
          ),
          appBar: AppBar(
            actions: const [_SaveAndNavigate()],
            title: context.watch<ReqresProvider>().isLoading
                ? const CircularProgressIndicator(
                    color: Colors.black,
                  )
                : const SizedBox.shrink(),
          ),
          body: Column(
            children: [
              const _TempPlaceholder(),
              Expanded(
                child: _resourceListView(
                    context, context.watch<ReqresProvider>().resourses),
              ),
            ],
          ),
        );
      },
    );
  }

  ListView _resourceListView(BuildContext context, List<Data> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
            color: Color(items[index].color?.colorValue ?? 0),
            child: Text(items[index].name ?? ''));
      },
    );
  }
}

class _SaveAndNavigate extends StatelessWidget {
  const _SaveAndNavigate();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          context
              .read<ReqresProvider>()
              .saveToLocale(context.read<ResourceContext>());
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) {
              return const ImageLearn();
            },
          ));
        },
        child: const Icon(Icons.abc_outlined));
  }
}

class _TempPlaceholder extends StatelessWidget {
  const _TempPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Selector<ReqresProvider, bool>(
      builder: (context, value, child) {
        return value ? const Placeholder() : const Text('data');
      },
      selector: (context, provider) {
        return provider.isLoading;
      },
    );
  }
}
