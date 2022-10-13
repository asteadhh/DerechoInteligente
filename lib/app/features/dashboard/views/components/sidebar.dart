part of dashboard;

class Sidebar extends StatelessWidget {
  Sidebar({
    required this.data,
    Key? key,
  }) : super(key: key);

  final controller = Get.put(LoginController());
  final ProjectCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).cardColor,
      child: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(kSpacing),
              // child: ProjectCard(
              //   data: data,
              // ),
              child: buildProfileDashboard(data: getProfil()),
            ),
            const Divider(thickness: 1),
            SelectionButton(
              data: [
                SelectionButtonData(
                  activeIcon: EvaIcons.grid,
                  icon: EvaIcons.gridOutline,
                  label: "Dashboard",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.archive,
                  icon: EvaIcons.archiveOutline,
                  label: "Reports",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.calendar,
                  icon: EvaIcons.calendarOutline,
                  label: "Calendar",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.email,
                  icon: EvaIcons.emailOutline,
                  label: "Email",
                  totalNotif: 20,
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.person,
                  icon: EvaIcons.personOutline,
                  label: "Profile",
                ),
                SelectionButtonData(
                  activeIcon: EvaIcons.settings,
                  icon: EvaIcons.settingsOutline,
                  label: "Setting",
                ),
              ],
              onSelected: (index, value) {
                log("index : $index | label : ${value.label}");
              },
            ),
            const Divider(thickness: 1),
            const SizedBox(height: kSpacing * 2),

            // SUSCRIPCION!!! Screen de pago!
            UpgradePremiumCard(
              backgroundColor: Theme.of(context).canvasColor.withOpacity(.4),
              onPressed: () {
                //TEMPORAL
                controller.signOut();
              },
            ),
            const SizedBox(height: kSpacing),
          ],
        ),
      ),
    );
  }

  Profile getProfil() {
    return Profile(
      photo: AssetImage(ImageRasterPath.avatar1),
      //   photo: CachedNetworkImage(
      //     imageUrl: "http://via.placeholder.com/350x150",
      //     placeholder: (context, url) => new CircularProgressIndicator(),
      //     errorWidget: (context, url, error) => new AssetImage(ImageRasterPath.avatar1),
      //  ),
      // photo: CachedNetworkImageProvider('http://via.placeholder.com/350x150'),
      name: FirebaseAuth.instance.currentUser!.displayName.toString(),
      email: FirebaseAuth.instance.currentUser!.email.toString(),
    );
  }
}
