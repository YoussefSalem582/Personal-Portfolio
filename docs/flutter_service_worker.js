'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "f31737fb005cd3a3c6bd9355efd33061",
"icons/Icon-512.png": "7de79b843106b8c8281aece80aeba423",
"icons/Icon-maskable-512.png": "7de79b843106b8c8281aece80aeba423",
"icons/Icon-192.png": "41f7ecf36895ee437027a6aa4bfb35d5",
"icons/Icon-maskable-192.png": "41f7ecf36895ee437027a6aa4bfb35d5",
"manifest.json": "a7f06816a28713137cc07f7b8a5ea8b0",
"main.dart.mjs": "8ea338d18d70375dbf9439b0be268fee",
"index.html": "9bdcbd42ec5f2b9e22d406b26b6ad8c7",
"/": "9bdcbd42ec5f2b9e22d406b26b6ad8c7",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "aefacca27a33bdce2a70d9688e8a14a5",
"assets/assets/icons/social/upwork_icon.svg": "a14a6e761ae44a216412573ae53142a6",
"assets/assets/icons/social/mostaql_Logo.png": "151b84a6de17f13b0a33adc4e459b9df",
"assets/assets/icons/social/github_icon.svg": "f9fc58ffd4bc65f8704ea4f0ed7f7f2e",
"assets/assets/icons/social/youtube_icon.svg": "48c6349de1346cba287916b6082d55d2",
"assets/assets/icons/social/linkedin_icon.svg": "9419e9f024acae4e057ac247710e7e2f",
"assets/assets/icons/cv.gif": "60d951c6e9a2e1b44c56d455a098b35c",
"assets/assets/icons/skills/rest-api.svg": "385c583959ca02162bd9d2d7ee5847cb",
"assets/assets/icons/skills/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/icons/skills/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/icons/skills/pgsql.svg": "f26d45fe1cdb978febf177145699471e",
"assets/assets/icons/skills/python.svg": "a1872cef0fb917ddf4d387e298d9f160",
"assets/assets/icons/skills/java.svg": "832331d4937e354c16dd25d25b9281c3",
"assets/assets/icons/skills/vercel.svg": "06e7048a2fc31b583cc9c4de35e127b6",
"assets/assets/icons/skills/firebase.svg": "029fd3c092480d94d80837b5fc4d2744",
"assets/assets/documents/projects/emosense_app.pdf": "5b03664c85c52d9ef593c3c09b40a508",
"assets/assets/documents/projects/Music%2520App.pdf": "df6b8acf116cc8e51d3e233ee3fbae06",
"assets/assets/documents/projects/facial_recognition_system_report.pdf": "4718fd0bc2f397f88adf5f8c649b28b0",
"assets/assets/documents/projects/Chat%2520App.pdf": "4a697b1b5e705f58c5e918fb4386b2be",
"assets/assets/documents/projects/carpool_ride_sharing_app_report.pdf": "8896579c6b0806e3f5e56cb8f9299854",
"assets/assets/documents/projects/EV%2520Station%2520Finder%2520App.pdf": "005fcd5764185cc8bcce35c565992078",
"assets/assets/documents/projects/emosense_app_report.pdf": "8972c3d04bb9ec2f552afaae972e4156",
"assets/assets/documents/projects/Gogesh%2520App.pdf": "a8e992824fb4fb71c6d1078a243f6fed",
"assets/assets/documents/projects/threejs_project.pdf": "7913181e38624822400fc86e51571ec7",
"assets/assets/documents/projects/pothole_detection_project_report.pdf": "65dffa81577c85164cb908de913de347",
"assets/assets/documents/projects/sign_language_translator_reort.pdf": "60d4c038dedcbd25b74fb3d18a26db9a",
"assets/assets/documents/projects/pothole_detection_project_code.html": "cb5d618c47e8991f92de6d022e82b04c",
"assets/assets/documents/Youssef-Hassan-cv.pdf": "1196df5999be31c35b64062be9a98caf",
"assets/assets/images/projects/carpool_ride_sharing_app/user_login.png": "aaa269f3a613fcde9b285a5e35ce89e9",
"assets/assets/images/projects/carpool_ride_sharing_app/class_diagram.png": "3ade004a867806b28e4616e1794b90eb",
"assets/assets/images/projects/carpool_ride_sharing_app/selected_ride_detail_screen.png": "33e539a38757ed8398ea61ab6d4d5fe7",
"assets/assets/images/projects/carpool_ride_sharing_app/driver_signup.png": "57b5777b619135da76c999a37a34796e",
"assets/assets/images/projects/carpool_ride_sharing_app/onboarding3.png": "f9b74919412a5c287409444a9997921e",
"assets/assets/images/projects/carpool_ride_sharing_app/notification_screen.png": "695b2b13e726b9d4b8bc81d1161d4aca",
"assets/assets/images/projects/carpool_ride_sharing_app/side_drawer_navigation.png": "552acbe3871dfe1afe62890a05863e71",
"assets/assets/images/projects/carpool_ride_sharing_app/use_case_diagram.png": "2b3bed2f51cf2633574a4938c59f6548",
"assets/assets/images/projects/carpool_ride_sharing_app/my_trips_screen_1.png": "635421413cf8d9e42b8b52dd34cce023",
"assets/assets/images/projects/carpool_ride_sharing_app/pickup_place_screen.png": "df43f56213e74aaa327a7d71090c0056",
"assets/assets/images/projects/carpool_ride_sharing_app/onboarding2.png": "a0dc87a8f44ec8d4dd3648d9783fa3c5",
"assets/assets/images/projects/carpool_ride_sharing_app/user_signup.png": "f357ed7d16f8f8d700ebfe1975836d7d",
"assets/assets/images/projects/carpool_ride_sharing_app/driver_login.png": "759beae95f484f8aa4c20af95054adc5",
"assets/assets/images/projects/carpool_ride_sharing_app/select_your_ride_screen.png": "2fa6900ac876da63bf031b3cde78715c",
"assets/assets/images/projects/carpool_ride_sharing_app/onboarding1.png": "8cdfc17b1597f89ab2658560389c9950",
"assets/assets/images/projects/carpool_ride_sharing_app/app_logo.png": "363005e35562c41abf58a8a0e71c3187",
"assets/assets/images/projects/carpool_ride_sharing_app/home_screen.png": "14e254eb40856e27d68b7c5ef3581715",
"assets/assets/images/projects/carpool_ride_sharing_app/my_trips_screen_2.png": "38ca4d17db33d79586b1fa90d294be09",
"assets/assets/images/projects/pothole_detection_project/confusion_matrix.png": "dc1fa7f9c97f68edaf2505c4c1e434ad",
"assets/assets/images/projects/pothole_detection_project/decision_tree_visualization.png": "0ac5cb9499a2a469662a48cc5b912699",
"assets/assets/images/projects/pothole_detection_project/pothole_image_dimensions.png": "59c9ee1e3d64dbab9d6ad1d8431f0cdf",
"assets/assets/images/projects/pothole_detection_project/image_counts.png": "9498515636ec721c17149822743efe69",
"assets/assets/images/projects/pothole_detection_project/no_pothole_image_dimensions.png": "1205ddb947d03b27b6baf8132b768304",
"assets/assets/images/projects/pothole_detection_project/samples.png": "fed77646300199428c5bef0c9a40eea4",
"assets/assets/images/projects/pothole_detection_project/results_and_analysis.png": "a70a741dafb72d37d3d6941c825b8436",
"assets/assets/images/projects/pothole_detection_project/training_and_validation.png": "c630a3a1023f82b1a692ef3e2e918f5b",
"assets/assets/images/projects/music_app/Home%2520Screen%25202.png": "59447f563b1804c7fe6a290dc724b91f",
"assets/assets/images/projects/music_app/music_app_logo.jpg": "b4576d047dedf7724fb64a2b3904072e",
"assets/assets/images/projects/music_app/playlist%2520screen.png": "e21e883b6d79c60d37a3f39e4db6e977",
"assets/assets/images/projects/music_app/palyer%2520screen.png": "457ac8dcad50f756edda128d3634bc04",
"assets/assets/images/projects/music_app/Home%2520Screen%25201.png": "ad186c6f043e3ad9166554e5311f1ecf",
"assets/assets/images/projects/music_app/home_page.png": "638267a198a67bf45cb89b8720d1e997",
"assets/assets/images/projects/music_app/liked%2520songs%2520page.png": "71e96998007e6cf99c7326149dc2dbd7",
"assets/assets/images/projects/music_app/Music%2520player%2520screen.png": "949deffe0abe55413bc13a2939b6d887",
"assets/assets/images/projects/music_app/playlist.png": "bf3b4568bb4d3ba2a4cca9dd30b18eee",
"assets/assets/images/projects/music_app/Liked%2520Songs%2520screen.png": "e41c09f736eb0b635380c8d29f146b6f",
"assets/assets/images/projects/facial_recognition_system/homepage_ex.jpg": "0ab86166c12acbcf5484d71715996298",
"assets/assets/images/projects/facial_recognition_system/homepage.jpg": "0386d555cc395ff425a3bf3e155f21d8",
"assets/assets/images/projects/sprints_shop/login_and_signin.png": "ffe3df1f63caa6949f192c5bcbea92ee",
"assets/assets/images/projects/sprints_shop/order_screen_2.png": "356143c5b137025a9aef366bdd7ef929",
"assets/assets/images/projects/sprints_shop/login_and_sign_up_2.png": "9e5806b104578da25320fba6bba03804",
"assets/assets/images/projects/sprints_shop/sign_up.png": "8a640d97371b0212860f4d00518041c4",
"assets/assets/images/projects/sprints_shop/login_2.png": "5773c2264326366e5f48728264e31633",
"assets/assets/images/projects/sprints_shop/cart_screen.png": "daf79ff46b7740e22adbfb3b4e4bdc20",
"assets/assets/images/projects/sprints_shop/products_screen.png": "2850c97bdb8bd44872dc4714a80f71c3",
"assets/assets/images/projects/sprints_shop/product_detail_screen.png": "cbd0f7ea0e11bf0d26ddb21069340dd1",
"assets/assets/images/projects/sprints_shop/order_screen.png": "718cdb5b079775189e5be9f7ea1029bb",
"assets/assets/images/projects/sprints_shop/login.png": "81852a1d5d8730e761a982478d65bc62",
"assets/assets/images/projects/sprints_shop/payment_screen.png": "4c1741e07e13c148f2e764571977ebe5",
"assets/assets/images/projects/sprints_shop/app_logo.png": "6453fb028d12bd6196294e2ea4eb99e2",
"assets/assets/images/projects/sprints_shop/home_screen.png": "f4a28949e4dc15b56b3ab6fece871822",
"assets/assets/images/projects/sprints_shop/payment_screen_2.png": "52ab799514e7466083527420e40faf35",
"assets/assets/images/projects/gogesh/user_home_screen.png": "15b690a3d65d932f9801f4e290c269f1",
"assets/assets/images/projects/gogesh/user_home_screen_2.png": "8639e015bc255f197550a4c8c18fd17b",
"assets/assets/images/projects/gogesh/cta_button_screen.png": "588edac65c05beb2569e94abaa0bdbcc",
"assets/assets/images/projects/gogesh/login_or_signup.png": "7b594c2b3c0d8ed5dc8454fe0cd2e524",
"assets/assets/images/projects/gogesh/cta_button_screen_2.png": "8b007dffe1da6759f1e1ae08c3fb2a18",
"assets/assets/images/projects/gogesh/splash.png": "80f41dc9fe1e46a16f993b205e4021cc",
"assets/assets/images/projects/gogesh/filter.png": "f84bba535dfab2266e997b382caba274",
"assets/assets/images/projects/gogesh/signup_screen_10.png": "9223df8107e87348218a27c27c2ff709",
"assets/assets/images/projects/gogesh/merchant_product_detail_screen.png": "68a0d14385c6be56d484876d7ac5aafc",
"assets/assets/images/projects/gogesh/category_result_screen.png": "735d1a82982e39aef685e1322d017d99",
"assets/assets/images/projects/gogesh/product%2520filter.png": "2f4d999b1119f0981a094e358ddc6b00",
"assets/assets/images/projects/gogesh/onboard_2.png": "f875fcaa75794b90075aceab8947b468",
"assets/assets/images/projects/gogesh/onboard_1.png": "450626a371e7fa99298e5169121b0071",
"assets/assets/images/projects/gogesh/merchant_home_screen.png": "48bab8101cf36633146a2dec1219b32d",
"assets/assets/images/projects/gogesh/signup_screen_3.png": "e6716cea16ede2d84c72331668ff4bec",
"assets/assets/images/projects/gogesh/phone_login_2.png": "9613e6c87cda3b7d2f246f2a3628c770",
"assets/assets/images/projects/gogesh/notification_screen.png": "85367f7e72e9629e8ed563d6ad74dd42",
"assets/assets/images/projects/gogesh/offers_screen.png": "34bb9c3d2309f620b12cffddb9ee9ef1",
"assets/assets/images/projects/gogesh/create_account_screen.png": "860a2fb03003cc3b668c5c9c0ef93beb",
"assets/assets/images/projects/gogesh/signup_screen_11.png": "b0c545181f65496f0866bb8d04d54211",
"assets/assets/images/projects/gogesh/signup_screen_7.png": "a9234b7b0a9403082f08f70668871975",
"assets/assets/images/projects/gogesh/signup_screen_4.png": "578da008816acf4d21d7cdd4f276636e",
"assets/assets/images/projects/gogesh/onboard_3.png": "b9594b5152cc6804c957a19104ccb9d7",
"assets/assets/images/projects/gogesh/signup_screen_9.png": "7b84c17a644161e7a69af039d62e171b",
"assets/assets/images/projects/gogesh/signup_screen_5.png": "3789cc2e7f9430d0e9d2138de64f1d84",
"assets/assets/images/projects/gogesh/category_detail_screen.png": "0cb6462eba13b8e5068bb56d40929085",
"assets/assets/images/projects/gogesh/product_screen.png": "32e4aaf3ca6353b3b37fc5c0ac71e466",
"assets/assets/images/projects/gogesh/chat_screen.png": "ac443617cf0b8e66a7acdca8751f2e40",
"assets/assets/images/projects/gogesh/signup_screen_2.png": "33a8b00d34be76abc8c74c8e1943632c",
"assets/assets/images/projects/gogesh/signup_screen_8.png": "42a48b4a9a65e949ea11e3e108d9a8e3",
"assets/assets/images/projects/gogesh/category_screen.png": "1a1b7e30eaa42826770b48f271c7611f",
"assets/assets/images/projects/gogesh/signup_screen.png": "ec08b7bb15d05e35401f7451e8b2a52f",
"assets/assets/images/projects/gogesh/chat_screen_2.png": "9c1c2fe2a6c8e31cee058e4248682426",
"assets/assets/images/projects/gogesh/signup_screen_12.png": "37d022f628939e3cfaec2b66e9a605c9",
"assets/assets/images/projects/gogesh/favorite_screen.png": "6b765cb4a7e8f34f7f82bc38921df8dd",
"assets/assets/images/projects/gogesh/phone_login.png": "936129684e1f604aefa0519aa3e7d30d",
"assets/assets/images/projects/gogesh/report.png": "25ed40efb26458fab172f79681eea327",
"assets/assets/images/projects/gogesh/signup_screen_13.png": "583eeedc84a50bc68a2cb457d2c001eb",
"assets/assets/images/projects/gogesh/ads_screen.png": "b190aced4b5486d053a6373dd6244468",
"assets/assets/images/projects/gogesh/signup_screen_6.png": "a713d82943641b7cfb040fe62c0cda61",
"assets/assets/images/projects/gogesh/cta_button_screen_3.png": "742ad81dcbc1432be22da3c553d65bfc",
"assets/assets/images/projects/gogesh/merchant_profile_screen.png": "32dbf1be30dba9d577941b016fe6906c",
"assets/assets/images/projects/gogesh/app_main_search.png": "12aacd282c416763e6cb1167f281a3fc",
"assets/assets/images/projects/gogesh/signup_screen_14.png": "c52a5a95d2a4913ad3caa29eec2c9fef",
"assets/assets/images/projects/gogesh/gogesh_app_logo.png": "68dfd8226e353c99b80c9aca4fed8a6a",
"assets/assets/images/projects/gogesh/report_2.png": "58d22c76483e23901d84fbc26fce0818",
"assets/assets/images/projects/sign_language_translator/collected_samples.png": "3b6e27225f69bd88c8d7e4cf12778a12",
"assets/assets/images/projects/sign_language_translator/sign_language_translator_project.png": "e39443e90aded4e191d63063d6bf942f",
"assets/assets/images/projects/sign_language_translator/creatig_datasets.png": "7d563e67cb4ae325463ff7e1b5de862e",
"assets/assets/images/projects/sign_language_translator/block_diagram.png": "d2d3ed11431803305f89974607ad6060",
"assets/assets/images/projects/sign_language_translator/flowchart.png": "af187155fd83a726d48722fe6306dbde",
"assets/assets/images/projects/sign_language_translator/results.png": "d9ffaa06fd51d65a4f3145e127b4f811",
"assets/assets/images/projects/threejs_project/image2.png": "750d1fba1b68db3b51653e666e11a75d",
"assets/assets/images/projects/threejs_project/image1.png": "9e96403e464524fad81d53c7d8828069",
"assets/assets/images/projects/threejs_project/image3.png": "3be360723b3557b5aa8d544da1ebf761",
"assets/assets/images/projects/chat_app/drawer.png": "ba3e1ada6d3341a592b240237c4ea341",
"assets/assets/images/projects/chat_app/chat.png": "d8257f8558cc4156e7cd72bc46562906",
"assets/assets/images/projects/chat_app/home_page.png": "b77af69ebdfd7bac9b138d89ef0e310a",
"assets/assets/images/projects/chat_app/lightmode.png": "6c199ccd683e3dce80548d70f05be74f",
"assets/assets/images/projects/chat_app/register.png": "b75abe33e2b86586fae925d93bad6888",
"assets/assets/images/projects/chat_app/settings_page.png": "a295dedae508cb65be8e0b40004dd867",
"assets/assets/images/projects/chat_app/login.png": "fe31ec66598a40abeb3cc6ea029d6042",
"assets/assets/images/projects/chat_app/app_logo.png": "ce39c48f0c43a6d61ef6159131f8f8ad",
"assets/assets/images/projects/QuoteHub/Home%2520Screen%2520with%2520Quotes.png": "056c0d867b546a555a434fff5b28477a",
"assets/assets/images/projects/QuoteHub/Favorite%2520Page.png": "bcd8c0191f463d12241a60e27835c561",
"assets/assets/images/projects/QuoteHub/Select%2520Category.png": "01561ac6531b0baf7ca052e8602cf6ea",
"assets/assets/images/projects/QuoteHub/Home%2520Screen.png": "23982037c4e3957484f86281df1ff44a",
"assets/assets/images/projects/QuoteHub/qoutehub_app_logo.jpg": "ceb1a1ce45d987ee79bab02c5cac3341",
"assets/assets/images/projects/quiz_hub/home_screen_2.png": "ada97dba4690c3ffee7523a65acc62e2",
"assets/assets/images/projects/quiz_hub/quiz.png": "45d720ef203f188f6d02d73cf3181819",
"assets/assets/images/projects/quiz_hub/correct_answer.png": "8eb4c32646cf0ad013dae93b428da7e7",
"assets/assets/images/projects/quiz_hub/review_page.png": "d1a8b2b11657d8c93c98ede6bcb5f7c7",
"assets/assets/images/projects/quiz_hub/qui_completed.png": "1ce650eff92b28742a30c9c3749b817c",
"assets/assets/images/projects/quiz_hub/quiz_app_logo.jpg": "e6ba491900691dd1889c1da01c3b8752",
"assets/assets/images/projects/quiz_hub/home_screen.png": "c1add1ea6052fbae4b90adee651e911d",
"assets/assets/images/projects/quiz_hub/incorrect_answer.png": "ec87f578f02cc3c09ad1435eaee14c4f",
"assets/assets/images/projects/emosense_photos/admin/system_screen._2.png": "7da6c6dc6ca497504e09a1026eed0684",
"assets/assets/images/projects/emosense_photos/admin/system_screen.png": "2356181e08114edfbfc5420658e3d8a7",
"assets/assets/images/projects/emosense_photos/admin/profile_screen.png": "f7686f0c540c6b8ce0bf2d717fcaa882",
"assets/assets/images/projects/emosense_photos/admin/profile_screen__2.png": "e8b4c719c35a5e00327b87dcc5000cb5",
"assets/assets/images/projects/emosense_photos/admin/amin_home_screen.png": "b199e2bcd484faa5fd1d5cd6fcfcccdc",
"assets/assets/images/projects/emosense_photos/admin/support_tickets_screen.png": "9e433db2078d279a503c5958d50bbc88",
"assets/assets/images/projects/emosense_photos/admin/user_managment_screen.png": "527b57c9f5149573a0b69246429f308f",
"assets/assets/images/projects/emosense_photos/use_case_diagram.png": "b0bfeec62662dc56e3d3dbf9308dafb0",
"assets/assets/images/projects/emosense_photos/employee/voice_analysis_screen_3.png": "12332491e912ed045ba01cf66cdfae84",
"assets/assets/images/projects/emosense_photos/employee/text_analysis_screen.png": "d2e71f7d839d315bb4977732e3c5be0a",
"assets/assets/images/projects/emosense_photos/employee/voice_analysis_screen_2.png": "5edceb6ef03412d53ff663f87b2148aa",
"assets/assets/images/projects/emosense_photos/employee/tools_screen.png": "a52f4b2d3b09ba7509dee7832c1e5dc8",
"assets/assets/images/projects/emosense_photos/employee/video_analysis_screen.png": "0b9989095ceda9169e773d460a651874",
"assets/assets/images/projects/emosense_photos/employee/login_2.png": "cf00474d091ccd3c228ccdf0e39959c1",
"assets/assets/images/projects/emosense_photos/employee/profile_sceen_2.png": "e3d822ee3ceb261b5dc976c00a4798bb",
"assets/assets/images/projects/emosense_photos/employee/video_analysis_screen_4.png": "6126b2587cd5375de08791488f949b35",
"assets/assets/images/projects/emosense_photos/employee/tickets_screen_2.png": "71d677cce4cc2d8cb49df454797a523b",
"assets/assets/images/projects/emosense_photos/employee/employee_home_screen.png": "3f4cf37d74047339c6fac13e015a9637",
"assets/assets/images/projects/emosense_photos/employee/voice_analysis_screen.png": "bdfefb538b1fb44ca4f00f39f622d4db",
"assets/assets/images/projects/emosense_photos/employee/onboarding_2.png": "fc810bf4a55f81f32ae59221aee0f43c",
"assets/assets/images/projects/emosense_photos/employee/tickets_screen_3.png": "454c8827fce93ab64a8c4e8d69f81c77",
"assets/assets/images/projects/emosense_photos/employee/profiel_screen.png": "b6f6aebee2505c69ed4b4e9c0908d9b1",
"assets/assets/images/projects/emosense_photos/employee/signin_employee.png": "0f51607f9e9f1ea53544fa23980654f9",
"assets/assets/images/projects/emosense_photos/employee/splash_screen.png": "e5355e7139a0fd517abbe0e560bb2a8b",
"assets/assets/images/projects/emosense_photos/employee/profile_screen_3.png": "463e26e788fe55cafa4febefb4966e8e",
"assets/assets/images/projects/emosense_photos/employee/text_analysis_screen_2.png": "6ccb5a79b7a25f5a834d401a623383fb",
"assets/assets/images/projects/emosense_photos/employee/signin_and_login.png": "02a885e781d806f4b789f5bae108a7e7",
"assets/assets/images/projects/emosense_photos/employee/onboarding_1.png": "c59f39ff3fc444ab2a4467d41262cf27",
"assets/assets/images/projects/emosense_photos/employee/video_analysis_screen_2.png": "fd338dcf36e046c73dbd68c312a711b6",
"assets/assets/images/projects/emosense_photos/employee/tickets_screen.png": "8cd189adebf0580bc04d0da8089624aa",
"assets/assets/images/projects/emosense_photos/employee/onboarding_3.png": "0821b74643a17897d01c40a2886e750a",
"assets/assets/images/projects/emosense_photos/employee/signin_admin.png": "d31e8cdf07af0fb4e15e465eb59ef1cc",
"assets/assets/images/projects/emosense_photos/employee/login.png": "2139bf56116bbbcb2c841a4573107919",
"assets/assets/images/projects/emosense_photos/employee/video_analysis_screen_3.png": "ebe07c6e170bb37929acfc1789395b2f",
"assets/assets/images/projects/emosense_photos/employee/login_loading.png": "0ab614bdb4ba28729b89c66517b108c7",
"assets/assets/images/projects/emosense_photos/employee/onboarding_4.png": "6105e972b928e77c34d8c1ec6bef1078",
"assets/assets/images/projects/emosense_photos/app_icon.png": "0373754ec5e537c6f81b094178154935",
"assets/assets/images/projects/chargehub/Map.png": "33c163229bb464d3d96f7994ccd65a05",
"assets/assets/images/projects/chargehub/homescreen.png": "1b760cbacca274041b6cc2eedc950e86",
"assets/assets/images/projects/chargehub/gas%2520car%25201.png": "bfff7cee99529f557eaed41cbe365782",
"assets/assets/images/projects/chargehub/ev%2520car1.png": "d52e63bb783ebcc31407764452496dfd",
"assets/assets/images/projects/chargehub/cars.png": "1bf308dffa59f6223ec156f0196c1e3c",
"assets/assets/images/projects/chargehub/gas%2520car.png": "d7af925f7266cc29c9d3742ad805150a",
"assets/assets/images/projects/chargehub/signup.png": "058b84a2c4dab86846cb20d2d072774e",
"assets/assets/images/projects/chargehub/chargeHub.png": "7bc1d6fe94f90d0c5afa810928de787e",
"assets/assets/images/projects/chargehub/EV%2520car.png": "b705c9677bb03db750237305e865e17a",
"assets/assets/images/projects/chargehub/login.png": "55ef4b7c6f4c647c69a1eeca334c5678",
"assets/assets/images/profile.jpg": "76b7a075d5b51a4ee84f279fea09bc87",
"assets/assets/images/certificates/UGRF%25201.jpg": "f72b105cb9fe18f99307aa29c6cc304d",
"assets/assets/images/certificates/CodeAlpha%2520Certificate.png": "71a721ebfe73ee26209aabf71b843dc0",
"assets/assets/images/certificates/we_certificate.png": "c662f0b30ff8c4ab4d04d9fa64f4bcb6",
"assets/assets/images/certificates/Route%2520Flutter%2520Diploma%2520Certificate.png": "0e9fd694f6b36dac951276bc5b8cc026",
"assets/assets/images/certificates/ml_depi_certificate.png": "dc9c707331af8c732fc5f4684741a05b",
"assets/assets/images/certificates/ECPC.jpg": "b51407184b56ea785b2f9eee5b8e4eb4",
"assets/assets/images/certificates/uneeq_intern_certificate.png": "7be0b92000596d1907046f3361c1b34f",
"assets/assets/images/certificates/UGRF%2520.jpg": "8df92f7e8a487f64c2039d43ec6b120f",
"assets/assets/images/portfolio_logo.png": "1bb2843e254f461fae15919f6e9909d7",
"assets/assets/fonts/PlaywriteAUTAS-VariableFont_wght.ttf": "0afa6c77395d574a505389acf97323db",
"assets/fonts/MaterialIcons-Regular.otf": "54d770cc7ea1f4c06b465b4aeab6294e",
"assets/NOTICES": "716176613bb7e75d5f07d4e48e318431",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin": "df4e684f38ba0f247933d545d72bde60",
"assets/AssetManifest.json": "3b32c7ebc212ef9a6695364cf6d8c8b0",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/chromium/canvaskit.js": "87325e67bf77a9b483250e1fb1b54677",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "9fa2ffe90a40d062dd2343c7b84caf01",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/canvaskit.js": "5fda3f1af7d6433d53b24083e2219fa0",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"favicon.png": "085b63e659eba1c795bf8b75dd3f5ca4",
"main.dart.wasm": "336f9dfdc6686e45fb25b677c8517323",
"service-worker.js": "3155d0b854ae08b78d5fa21481caa239",
"robots.txt": "2a1e41c5d90c5422223424ae7649c2d1",
"_headers": "e1c1f7e87f90ef0b147a62e3126fd738",
"sitemap.xml": "782c807ddf6ea435017d2ae4b95736a6",
"flutter_bootstrap.js": "ba77c36277b770c979327aeacf707365",
"version.json": "2a4bdd3370ee966319e180d97d91e050",
"main.dart.js": "761242b9cc0e13fd6a15ca9fe3e321ef"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
