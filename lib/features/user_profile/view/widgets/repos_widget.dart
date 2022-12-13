import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gethubsearch/core/const/const.dart';

import '../../../../core/utls/utls.dart';
import '../../view_model/cubit/users_cubit.dart';
import '../screens/repository_web_view_screen.dart';

class ReposWidget extends StatefulWidget {
  const ReposWidget({
    Key? key,
    required this.reposUrl,
  }) : super(key: key);
  final String reposUrl;
  @override
  State<ReposWidget> createState() => _ReposWidgetState();
}

class _ReposWidgetState extends State<ReposWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UsersCubit>(context)
        .getRepositoryInformationByRepositoryUrlAndContributors(
            widget.reposUrl);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsersCubit, UsersState>(
      builder: (context, state) {
        switch (state.repositoryGetByRepositoryUrlRequestStatues) {
          case RepositoryGetByRepositoryUrlRequestStatues.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RepositoryGetByRepositoryUrlRequestStatues.success:
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Repositories',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: AppHeight.h10,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.repositoryInformationModel.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 2,
                        mainAxisSpacing: AppWidth.w10,
                      ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            navigatePushTo(
                                navigateTO: ReposWebViewScreen(
                                  repoUrl: state
                                      .repositoryInformationModel[index]
                                      .repoUrl,
                                ),
                                context: context);
                          },
                          child: Card(
                            color: AppColors.seconderyColor,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(AppRadius.r10),
                            ),
                            child: ListTile(
                              title: Text(
                                state
                                    .repositoryInformationModel[index].repoName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context).primaryColor),
                              ),
                              subtitle: Text(
                                DateTimeFormat.format(
                                    DateTime.parse(state
                                        .repositoryInformationModel[index]
                                        .createdAt),
                                    format: 'd M Y'),
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ),
                          ),
                        );
                      }),
                ],
              ),
            );

          case RepositoryGetByRepositoryUrlRequestStatues.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      },
    );
  }
}
