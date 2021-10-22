part of 'values.dart';

class CertificationData {
  CertificationData({
    required this.title,
    required this.image,
    required this.imageSize,
    required this.url,
    required this.awardedBy,
  });

  final String image;
  final double imageSize;
  final String url;
  final String title;
  final String awardedBy;
}

class OthersProjectDetails {
  OthersProjectDetails({
    required this.projectName,
    required this.isOnPlayStore,
    required this.isPublic,
    required this.technologyUsed,
    required this.isWeb,
    required this.isLive,
    this.projectDescription,
    this.playStoreUrl,
    this.webUrl,
    this.hasBeenReleased,
    this.gitHubUrl,
  });

  final String projectName;
  final bool isPublic;
  final bool isOnPlayStore;
  final bool isWeb;
  final String? projectDescription;
  final bool isLive;
  final bool? hasBeenReleased;
  final String? playStoreUrl;
  final String? gitHubUrl;
  final String? webUrl;
  final String? technologyUsed;
}

class ExperienceData {
  ExperienceData({
    required this.position,
    required this.roles,
    required this.location,
    required this.duration,
    required this.company,
    this.companyUrl,
  });

  final String company;
  final String? companyUrl;
  final String location;
  final String duration;
  final String position;
  final List<String> roles;
}

class SkillData {
  SkillData({
    required this.skillName,
    required this.skillLevel,
  });

  final String skillName;
  final double skillLevel;
}

class SubMenuData {
  SubMenuData({
    required this.title,
    this.isSelected,
    this.content,
    this.skillData,
    this.isAnimation = false,
  });

  final String title;
  final String? content;
  final List<SkillData>? skillData;
  bool isAnimation;
  bool? isSelected;
}

class Data {
  static List<NavItemData> menuItems = [
    NavItemData(name: HOME, route: HOME_SCREEN),
    NavItemData(name: ABOUT, route: ABOUT_PAGE),
    NavItemData(name: WORKS, route: WORKS_PAGE),
    NavItemData(
      name: EXPERIENCE,
      route: EXPERIENCE_PAGE,
    ),
    //NavItemData(name: CONTACT, route: CONTACT_PAGE),
  ];

  static List<SocialData> socialData = [
    SocialData(
      name: GITHUB,
      iconData: FontAwesomeIcons.github,
      url: GITHUB_URL,
    ),
    SocialData(
      name: LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: LINKED_IN_URL,
    ),
    SocialData(
      name: FACEBOOK,
      iconData: FontAwesomeIcons.twitter,
      url: FACEBOOK_URL,
    ),

  ];

  static List<String> mobileTechnologies = [
    "Android",
    "Flutter",
    "Dart",
    "Java Android",

  ];

  static List<String> otherTechnologies = [
    "Git",
    "Dart",
    "C#",
    "SQL",
    "Firebase",
    "Figma",
    "Adobe XD",
    "Unity 3D",
  ];
  static List<SocialData> socialData1 = [
    SocialData(
      name: GITHUB,
      iconData: FontAwesomeIcons.github,
      url: GITHUB_URL,
    ),
    SocialData(
      name: LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: LINKED_IN_URL,
    ),
    SocialData(
      name: FACEBOOK,
      iconData: FontAwesomeIcons.twitter,
      url: FACEBOOK_URL,
    ),
  ];

  static List<SocialData> socialData2 = [
    SocialData(
      name: LINKED_IN,
      iconData: FontAwesomeIcons.linkedin,
      url: LINKED_IN_URL,
    ),
    SocialData(
      name: FACEBOOK,
      iconData: FontAwesomeIcons.twitter,
      url: FACEBOOK_URL,
    ),
    SocialData(
      name: GITHUB,
      iconData: FontAwesomeIcons.github,
      url: GITHUB_URL,
    ),
  ];

  static List<SkillData> skillData = [
    SkillData(skillLevel: 95, skillName: FLUTTER),
    SkillData(skillLevel: 70, skillName: JAVA),
    SkillData(skillLevel: 78, skillName: ANDROID),
    SkillData(skillLevel: 70, skillName: KOTLIN),
    SkillData(skillLevel: 80, skillName: JAVASCRIPT),
    SkillData(skillLevel: 80, skillName: PHP),
    SkillData(skillLevel: 80, skillName: LARAVEL),
    SkillData(skillLevel: 80, skillName: SQL),
    SkillData(skillLevel: 90, skillName: WORDPRESS),
    SkillData(skillLevel: 80, skillName: BOOTSTRAP),
    SkillData(skillLevel: 80, skillName: HTML_CSS),
  ];

  static List<ProjectItemData> recentWorks = [
    Projects.FLUTTER_DURONTO_APP,

    Projects.vDOC,

  ];

  static List<ProjectItemData> projects = [
    Projects.FLUTTER_DURONTO_APP,
    Projects.vDOC,
    Projects.BMART_APP,
    Projects.MYSPORTS_APP,
    Projects.SURVEY_APP,

  ];

  static List<OthersProjectDetails> othersProjects = [
    OthersProjectDetails(
      projectName: ASSISTANT_APP,
      isPublic: true,
      isOnPlayStore: true,
      isWeb: true,
      technologyUsed: FLUTTER,
      projectDescription: ASSITANT_APP_DETAIL,
      gitHubUrl: ASSITANT_APP_GITHUB_URL,
      webUrl: ASSITANT_APP_WEB_URL,
      isLive: true,
    ),


    OthersProjectDetails(
      projectName: DIET_ACHIVER_APP,
      isPublic: false,
      isOnPlayStore: false,
      isWeb: false,
      technologyUsed: FLUTTER,
      projectDescription: DIET_ACHIVER_APP_DETAIL,
      gitHubUrl: DIET_ACHIVER_APP_GITHUB_URL,
      isLive: false,
    ),

  ];

  static List<CertificationData> certificationData = [
    CertificationData(
      title: ASSOCIATE_ANDROID_DEV,
      url: ASSOCIATE_ANDROID_DEV_URL,
      image: ImagePath.ASSOCIATE_ANDROID_DEV,
      imageSize: 0.325,
      awardedBy: GOOGLE,
    ),
    CertificationData(
      title: DATA_SCIENCE,
      url: DATA_SCIENCE_CERT_URL,
      image: ImagePath.DATA_SCIENCE_CERT,
      imageSize: 0.325,
      awardedBy: UDACITY,
    ),
    CertificationData(
      title: ANDROID_BASICS,
      url: ANDROID_BASICS_CERT_URL,
      image: ImagePath.ANDROID_BASICS_CERT,
      imageSize: 0.325,
      awardedBy: UDACITY,
    ),
  ];

  static List<ExperienceData> experienceData = [
    ExperienceData(
      company: COMPANY_1,
      position: POSITION_1,
      companyUrl: COMPANY_1_URL,
      roles: [
        COMPANY_1_ROLE_1,
        COMPANY_1_ROLE_2,
        COMPANY_1_ROLE_3,
      ],
      location: LOCATION_1,
      duration: DURATION_1,
    ),

    ExperienceData(
      company: COMPANY_2,
      position: POSITION_2,
      companyUrl: COMPANY_2_URL,
      roles: [
        COMPANY_2_ROLE_1,
        COMPANY_2_ROLE_2,
      ],
      location: LOCATION_2,
      duration: DURATION_2,
    ),

    ExperienceData(
      company: COMPANY_4,
      position: POSITION_4,
      companyUrl: COMPANY_4_URL,
      roles: [
        COMPANY_4_ROLE_1,
        COMPANY_4_ROLE_2,
        COMPANY_4_ROLE_3,
        COMPANY_4_ROLE_4,
      ],
      location: LOCATION_4,
      duration: DURATION_4,
    ),

  ];
}

class Projects {
  static ProjectItemData FLUTTER_DURONTO_APP = ProjectItemData(
    title: FLUTTER_DURONTO,
    subtitle: FLUTTER_DURONTO,
    platform: FLUTTER_DURONTO_PLATFORM,
    primaryColor: flutter_catalog,
    image: ImagePath.FLUTTER_DURONTO_COVER,
    coverUrl: ImagePath.FLUTTER_DURONTO_COVER,
    navSelectedTitleColor: flutterCatalogSelectedNavTitle,
    appLogoColor: flutterCatalogAppLogo,
    category: FLUTTER_DURONTO_CATEGORY,
    portfolioDescription: FLUTTER_DURONTO_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: FLUTTER,
    gitHubUrl: FLUTTER_DURONTO_GITHUB_URL,
    playStoreUrl: FLUTTER_DURONTO_PLAYSTORE_URL,
  );

  static ProjectItemData vDOC = ProjectItemData(
    title: VDOC,
    subtitle: VDOC,
    primaryColor: vDoc,
    category: VDOC_CATEGORY,
    designer: VDOC_DESIGNER,
    platform: VDOC_PLATFORM,
    image: ImagePath.vDOC_COVER,
    coverUrl: ImagePath.vDOC_COVER,
    navTitleColor: vDocNavTitle,
    navSelectedTitleColor: vDocSelectedNavTitle,
    appLogoColor: vDocAppLogo,
    portfolioDescription: VDOC_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: FLUTTER,
    gitHubUrl: VDOC_GITHUB_URL,
    playStoreUrl: VDOC_PLAYSTORE_URL,
  );

  static ProjectItemData BMART_APP = ProjectItemData(
    title: BMART,
    subtitle: BMART_SUBTITLE,
    primaryColor: bmart,
    category: BMART_CATEGORY,
    designer: BMART_DESIGNER,
    platform: BMART_PLATFORM,
    image: ImagePath.BMART_COVER,
    coverUrl: ImagePath.BMART_COVER,
    navTitleColor: bmartNavTitle,
    navSelectedTitleColor: bmartSelectedNavTitle,
    appLogoColor: bmartAppLogo,
    portfolioDescription: BMART_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: FLUTTER,
    gitHubUrl: BMART_GITHUB_URL,
    playStoreUrl: BMART_PLAYSTORE_URL,
  );

  static ProjectItemData MYSPORTS_APP = ProjectItemData(
    title: MYSPORTS,
    subtitle: MYSPORTS_SUBTITLE,
    primaryColor: mySports,
    category: MYSPORTS_CATEGORY,
    designer: MYSPORTS_DESIGNER,
    platform: MYSPORTS_PLATFORM,
    image: ImagePath.MYSPORTS_COVER,
    coverUrl: ImagePath.MYSPORTS_COVER,
    navTitleColor: mySportsNavTitle,
    navSelectedTitleColor: mySportsSelectedNavTitle,
    appLogoColor: mySportsAppLogo,
    portfolioDescription: MYSPORTS_DETAIL,
    isPublic: false,
    isOnPlayStore: true,
    technologyUsed: FLUTTER,
    gitHubUrl: MYSPORTS_GITHUB_URL,
    playStoreUrl: MYSPORTS_PLAYSTORE_URL,
  );

  static ProjectItemData SURVEY_APP = ProjectItemData(
    title: SURVEY,
    subtitle: SURVEY_SUBTITLE,
    primaryColor: survey,
    category: SURVEY_CATEGORY,
    designer: SURVEY_DESIGNER,
    platform: SURVEY_PLATFORM,
    image: ImagePath.SURVEY_COVER,
    coverUrl: ImagePath.SURVEY_COVER,
    navTitleColor: surveyNavTitle,
    navSelectedTitleColor: surveySelectedNavTitle,
    appLogoColor: surveyAppLogo,
    portfolioDescription: SURVEY_DETAIL,
    isPublic: true,
    isOnPlayStore: true,
    technologyUsed: FLUTTER,
    gitHubUrl: SURVEY_GITHUB_URL,
    playStoreUrl: SURVEY_PLAYSTORE_URL,
  );

}

final kContactIcons = [
  Icons.home,
  Icons.phone,
  Icons.mail,
];

final kContactTitles = [
  "Location",
  "Phone",
  "Email",
];

final kContactDetails = [
  "Attock, Pakistan",
  "(+92) 346 0159889",
  "hamza@mhmz.dev"
];
