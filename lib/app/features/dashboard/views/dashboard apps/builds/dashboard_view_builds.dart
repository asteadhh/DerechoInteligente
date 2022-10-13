import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../shared_components/chatting_card.dart';
import '../../../../../shared_components/list_profil_image.dart';
import '../../../../../shared_components/progress_card.dart';
import '../../../../../shared_components/progress_report_card.dart';
import '../../../../../shared_components/project_card.dart';
import '../../../../../shared_components/task_card.dart';
import '../../screens/drawer_screen.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget buildHeaderDashboard({Function()? onPressedMenu}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Row(
      children: [
        if (onPressedMenu != null)
          Padding(
            padding: const EdgeInsets.only(right: kSpacing),
            child: IconButton(
              onPressed: onPressedMenu,
              icon: const Icon(EvaIcons.menu),
              tooltip: "menu",
            ),
          ),
        const Expanded(child: HeaderDashboard()),
      ],
    ),
  );
}

Widget buildProgressDashboard({Axis axis = Axis.horizontal}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: (axis == Axis.horizontal)
        ? Row(
            children: [
              Flexible(
                flex: 5,
                child: ProgressCard(
                  data: const ProgressCardData(
                    totalUndone: 10,
                    totalTaskInProress: 2,
                  ),
                  onPressedCheck: () {},
                ),
              ),
              const SizedBox(width: kSpacing / 2),
              const Flexible(
                flex: 4,
                child: ProgressReportCard(
                  data: ProgressReportCardData(
                    title: "1st Sprint",
                    doneTask: 5,
                    percent: .3,
                    task: 3,
                    undoneTask: 2,
                  ),
                ),
              ),
            ],
          )
        : Column(
            children: [
              ProgressCard(
                data: const ProgressCardData(
                  totalUndone: 10,
                  totalTaskInProress: 2,
                ),
                onPressedCheck: () {},
              ),
              const SizedBox(height: kSpacing / 2),
              const ProgressReportCard(
                data: ProgressReportCardData(
                  title: "1st Sprint",
                  doneTask: 5,
                  percent: .3,
                  task: 3,
                  undoneTask: 2,
                ),
              ),
            ],
          ),
  );
}

Widget buildTaskOverviewDashboard({
  required List<TaskCardData> data,
  int crossAxisCount = 6,
  int crossAxisCellCount = 2,
  Axis headerAxis = Axis.horizontal,
}) {
  return StaggeredGridView.countBuilder(
    crossAxisCount: crossAxisCount,
    itemCount: data.length + 1,
    addAutomaticKeepAlives: false,
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemBuilder: (context, index) {
      return (index == 0)
          ? Padding(
              padding: const EdgeInsets.only(bottom: kSpacing),
              child: OverviewHeaderDashboard(
                axis: headerAxis,
                onSelected: (task) {},
              ),
            )
          : TaskCard(
              data: data[index - 1],
              onPressedMore: () {},
              onPressedTask: () {},
              onPressedContributors: () {},
              onPressedComments: () {},
            );
    },
    staggeredTileBuilder: (int index) =>
        StaggeredTile.fit((index == 0) ? crossAxisCount : crossAxisCellCount),
  );
}

Widget buildActiveProjectDashboard({
  required List<ProjectCardData> data,
  int crossAxisCount = 6,
  int crossAxisCellCount = 2,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: ActiveProjectCardDashboard(
      onPressedSeeAll: () {},
      child: StaggeredGridView.countBuilder(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: crossAxisCount,
        itemCount: data.length,
        addAutomaticKeepAlives: false,
        mainAxisSpacing: kSpacing,
        crossAxisSpacing: kSpacing,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProjectCard(data: data[index]);
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.fit(crossAxisCellCount),
      ),
    ),
  );
}

Widget buildProfileDashboard({required Profile data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: ProfilTileDashboard(
      data: data,
      onPressedNotification: () {
        //FOR LOGOUT
      },
    ),
  );
}

Widget buildTeamMemberDashboard({required List<ImageProvider> data}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: kSpacing),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TeamMemberDashboard(
          totalMember: data.length,
          onPressedAdd: () {},
        ),
        const SizedBox(height: kSpacing / 2),
        ListProfilImage(maxImages: 6, images: data),
      ],
    ),
  );
}

Widget buildRecentMessagesDashboard({required List<ChattingCardData> data}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: kSpacing),
        child: RecentMessagesDashboard(onPressedMore: () {}),
      ),
      const SizedBox(height: kSpacing / 2),
      ...data
          .map(
            (e) => ChattingCard(data: e, onPressed: () {}),
          )
          .toList(),
    ],
  );
}
