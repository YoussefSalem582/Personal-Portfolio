'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "3c81ec016d937c4643c4ac274c360130",
"assets/AssetManifest.bin.json": "ff18fbe281d64eb062e3ed8483fc8701",
"assets/AssetManifest.json": "9e75b41db91594364a6d4c765087e1e9",
"assets/assets/icons/cv.gif": "60d951c6e9a2e1b44c56d455a098b35c",
"assets/assets/icons/github_icon.svg": "b2517a5247c0a5193162a0039bf816d6",
"assets/assets/icons/linkedin_icon.svg": "9419e9f024acae4e057ac247710e7e2f",
"assets/assets/icons/upwork_icon.svg": "044ccb2f1247d91b28f33fc73163c0d5",
"assets/assets/icons/youtube_icon.svg": "48c6349de1346cba287916b6082d55d2",
"assets/assets/images/certificates/CodeAlpha%2520Certificate.pdf": "b77ee6011d344c2718f14e2a61f7afdc",
"assets/assets/images/certificates/CodeAlpha%2520LOR.pdf": "c8594f0c53f5a0b2f244cad34df59c0e",
"assets/assets/images/certificates/ECPC.pdf": "8ad54ae2d066606f793b8b54e134de5e",
"assets/assets/images/certificates/Intro%2520to%2520jupyter.pdf": "e792cf06f25d8c9f46ac43808e48520d",
"assets/assets/images/certificates/Intro%2520to%2520python.pdf": "906cee83b5260caac48302be83d9c01e",
"assets/assets/images/certificates/ml_depi_certificate.pdf": "65180c6a385c5f12eab1d2ffceae7253",
"assets/assets/images/certificates/pdf/CodeAlpha%2520Certificate.pdf": "b77ee6011d344c2718f14e2a61f7afdc",
"assets/assets/images/certificates/pdf/CodeAlpha%2520LOR.pdf": "c8594f0c53f5a0b2f244cad34df59c0e",
"assets/assets/images/certificates/pdf/ECPC.pdf": "8ad54ae2d066606f793b8b54e134de5e",
"assets/assets/images/certificates/pdf/Intro%2520to%2520jupyter.pdf": "e792cf06f25d8c9f46ac43808e48520d",
"assets/assets/images/certificates/pdf/Intro%2520to%2520python.pdf": "906cee83b5260caac48302be83d9c01e",
"assets/assets/images/certificates/pdf/ml_depi_certificate.pdf": "65180c6a385c5f12eab1d2ffceae7253",
"assets/assets/images/certificates/pdf/route_flutter_diploma_certificate.pdf": "53cc9f1ab65a79f4330b04895aad5ac7",
"assets/assets/images/certificates/pdf/uneeq_intern_certificate.pdf": "95a33bd8889cedf499082d45dba9aa62",
"assets/assets/images/certificates/pdf/we_certificate.pdf": "67b965c54e64e833b427d8ddb4ac7fba",
"assets/assets/images/certificates/photos/CodeAlpha%2520Certificate.png": "71a721ebfe73ee26209aabf71b843dc0",
"assets/assets/images/certificates/photos/ECPC.jpg": "b51407184b56ea785b2f9eee5b8e4eb4",
"assets/assets/images/certificates/photos/ml_depi_certificate.png": "dc9c707331af8c732fc5f4684741a05b",
"assets/assets/images/certificates/photos/Route%2520Flutter%2520Diploma%2520Certificate.png": "0e9fd694f6b36dac951276bc5b8cc026",
"assets/assets/images/certificates/photos/UGRF%2520.jpg": "8df92f7e8a487f64c2039d43ec6b120f",
"assets/assets/images/certificates/photos/UGRF%25201.jpg": "f72b105cb9fe18f99307aa29c6cc304d",
"assets/assets/images/certificates/photos/uneeq_intern_certificate.png": "7be0b92000596d1907046f3361c1b34f",
"assets/assets/images/certificates/photos/we_certificate.png": "c662f0b30ff8c4ab4d04d9fa64f4bcb6",
"assets/assets/images/certificates/route_flutter_diploma_certificate.pdf": "53cc9f1ab65a79f4330b04895aad5ac7",
"assets/assets/images/certificates/uneeq_intern_certificate.pdf": "95a33bd8889cedf499082d45dba9aa62",
"assets/assets/images/certificates/we_certificate.pdf": "67b965c54e64e833b427d8ddb4ac7fba",
"assets/assets/images/portfolio_logo.png": "1bb2843e254f461fae15919f6e9909d7",
"assets/assets/images/profile.jpeg": "70d45566e4d30e98c0d4b8ccb294b34d",
"assets/assets/images/projects/app_images/chargehub/cars.png": "1bf308dffa59f6223ec156f0196c1e3c",
"assets/assets/images/projects/app_images/chargehub/EV%2520car.png": "b705c9677bb03db750237305e865e17a",
"assets/assets/images/projects/app_images/chargehub/ev%2520car1.png": "d52e63bb783ebcc31407764452496dfd",
"assets/assets/images/projects/app_images/chargehub/gas%2520car%25201.png": "bfff7cee99529f557eaed41cbe365782",
"assets/assets/images/projects/app_images/chargehub/gas%2520car.png": "d7af925f7266cc29c9d3742ad805150a",
"assets/assets/images/projects/app_images/chargehub/homescreen.png": "1b760cbacca274041b6cc2eedc950e86",
"assets/assets/images/projects/app_images/chargehub/login.png": "55ef4b7c6f4c647c69a1eeca334c5678",
"assets/assets/images/projects/app_images/chargehub/Map.png": "33c163229bb464d3d96f7994ccd65a05",
"assets/assets/images/projects/app_images/chargehub/signup.png": "058b84a2c4dab86846cb20d2d072774e",
"assets/assets/images/projects/app_images/chat_app/chat.png": "d8257f8558cc4156e7cd72bc46562906",
"assets/assets/images/projects/app_images/chat_app/drawer.png": "ba3e1ada6d3341a592b240237c4ea341",
"assets/assets/images/projects/app_images/chat_app/home_page.png": "b77af69ebdfd7bac9b138d89ef0e310a",
"assets/assets/images/projects/app_images/chat_app/lightmode.png": "6c199ccd683e3dce80548d70f05be74f",
"assets/assets/images/projects/app_images/chat_app/login.png": "fe31ec66598a40abeb3cc6ea029d6042",
"assets/assets/images/projects/app_images/chat_app/register.png": "b75abe33e2b86586fae925d93bad6888",
"assets/assets/images/projects/app_images/chat_app/settings_page.png": "a295dedae508cb65be8e0b40004dd867",
"assets/assets/images/projects/app_images/emosense_photos/admin/amin_home_screen.png": "b199e2bcd484faa5fd1d5cd6fcfcccdc",
"assets/assets/images/projects/app_images/emosense_photos/admin/profile_screen.png": "f7686f0c540c6b8ce0bf2d717fcaa882",
"assets/assets/images/projects/app_images/emosense_photos/admin/profile_screen__2.png": "e8b4c719c35a5e00327b87dcc5000cb5",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163525.png": "b199e2bcd484faa5fd1d5cd6fcfcccdc",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163542.png": "527b57c9f5149573a0b69246429f308f",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163552.png": "9e433db2078d279a503c5958d50bbc88",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163601.png": "2356181e08114edfbfc5420658e3d8a7",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163611.png": "7da6c6dc6ca497504e09a1026eed0684",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163620.png": "f7686f0c540c6b8ce0bf2d717fcaa882",
"assets/assets/images/projects/app_images/emosense_photos/admin/Screenshot_20250717_163637.png": "e8b4c719c35a5e00327b87dcc5000cb5",
"assets/assets/images/projects/app_images/emosense_photos/admin/support_tickets_screen.png": "9e433db2078d279a503c5958d50bbc88",
"assets/assets/images/projects/app_images/emosense_photos/admin/system_screen.png": "2356181e08114edfbfc5420658e3d8a7",
"assets/assets/images/projects/app_images/emosense_photos/admin/system_screen._2.png": "7da6c6dc6ca497504e09a1026eed0684",
"assets/assets/images/projects/app_images/emosense_photos/admin/user_managment_screen.png": "527b57c9f5149573a0b69246429f308f",
"assets/assets/images/projects/app_images/emosense_photos/app_icon.png": "0373754ec5e537c6f81b094178154935",
"assets/assets/images/projects/app_images/emosense_photos/employee/employee_home_screen.png": "3f4cf37d74047339c6fac13e015a9637",
"assets/assets/images/projects/app_images/emosense_photos/employee/login.png": "2139bf56116bbbcb2c841a4573107919",
"assets/assets/images/projects/app_images/emosense_photos/employee/login_2.png": "cf00474d091ccd3c228ccdf0e39959c1",
"assets/assets/images/projects/app_images/emosense_photos/employee/login_loading.png": "0ab614bdb4ba28729b89c66517b108c7",
"assets/assets/images/projects/app_images/emosense_photos/employee/onboarding_1.png": "c59f39ff3fc444ab2a4467d41262cf27",
"assets/assets/images/projects/app_images/emosense_photos/employee/onboarding_2.png": "fc810bf4a55f81f32ae59221aee0f43c",
"assets/assets/images/projects/app_images/emosense_photos/employee/onboarding_3.png": "0821b74643a17897d01c40a2886e750a",
"assets/assets/images/projects/app_images/emosense_photos/employee/onboarding_4.png": "6105e972b928e77c34d8c1ec6bef1078",
"assets/assets/images/projects/app_images/emosense_photos/employee/profiel_screen.png": "b6f6aebee2505c69ed4b4e9c0908d9b1",
"assets/assets/images/projects/app_images/emosense_photos/employee/profile_sceen_2.png": "e3d822ee3ceb261b5dc976c00a4798bb",
"assets/assets/images/projects/app_images/emosense_photos/employee/profile_screen_3.png": "463e26e788fe55cafa4febefb4966e8e",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162654.png": "e5355e7139a0fd517abbe0e560bb2a8b",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162719.png": "c59f39ff3fc444ab2a4467d41262cf27",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162750.png": "fc810bf4a55f81f32ae59221aee0f43c",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162801.png": "0821b74643a17897d01c40a2886e750a",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162813.png": "6105e972b928e77c34d8c1ec6bef1078",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162822.png": "02a885e781d806f4b789f5bae108a7e7",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162836.png": "0f51607f9e9f1ea53544fa23980654f9",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162846.png": "d31e8cdf07af0fb4e15e465eb59ef1cc",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162859.png": "2139bf56116bbbcb2c841a4573107919",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162911.png": "cf00474d091ccd3c228ccdf0e39959c1",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162950.png": "0ab614bdb4ba28729b89c66517b108c7",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_162956.png": "3f4cf37d74047339c6fac13e015a9637",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163012.png": "d2e71f7d839d315bb4977732e3c5be0a",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163039.png": "6ccb5a79b7a25f5a834d401a623383fb",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163056.png": "0b9989095ceda9169e773d460a651874",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163106.png": "fd338dcf36e046c73dbd68c312a711b6",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163202.png": "ebe07c6e170bb37929acfc1789395b2f",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163214.png": "6126b2587cd5375de08791488f949b35",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163229.png": "bdfefb538b1fb44ca4f00f39f622d4db",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163239.png": "5edceb6ef03412d53ff663f87b2148aa",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163248.png": "12332491e912ed045ba01cf66cdfae84",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163304.png": "a52f4b2d3b09ba7509dee7832c1e5dc8",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163313.png": "8cd189adebf0580bc04d0da8089624aa",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163324.png": "454c8827fce93ab64a8c4e8d69f81c77",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163336.png": "71d677cce4cc2d8cb49df454797a523b",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163353.png": "b6f6aebee2505c69ed4b4e9c0908d9b1",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163400.png": "e3d822ee3ceb261b5dc976c00a4798bb",
"assets/assets/images/projects/app_images/emosense_photos/employee/Screenshot_20250717_163412.png": "463e26e788fe55cafa4febefb4966e8e",
"assets/assets/images/projects/app_images/emosense_photos/employee/signin_admin.png": "d31e8cdf07af0fb4e15e465eb59ef1cc",
"assets/assets/images/projects/app_images/emosense_photos/employee/signin_and_login.png": "02a885e781d806f4b789f5bae108a7e7",
"assets/assets/images/projects/app_images/emosense_photos/employee/signin_employee.png": "0f51607f9e9f1ea53544fa23980654f9",
"assets/assets/images/projects/app_images/emosense_photos/employee/splash_screen.png": "e5355e7139a0fd517abbe0e560bb2a8b",
"assets/assets/images/projects/app_images/emosense_photos/employee/text_analysis_screen.png": "d2e71f7d839d315bb4977732e3c5be0a",
"assets/assets/images/projects/app_images/emosense_photos/employee/text_analysis_screen_2.png": "6ccb5a79b7a25f5a834d401a623383fb",
"assets/assets/images/projects/app_images/emosense_photos/employee/tickets_screen.png": "8cd189adebf0580bc04d0da8089624aa",
"assets/assets/images/projects/app_images/emosense_photos/employee/tickets_screen_2.png": "71d677cce4cc2d8cb49df454797a523b",
"assets/assets/images/projects/app_images/emosense_photos/employee/tickets_screen_3.png": "454c8827fce93ab64a8c4e8d69f81c77",
"assets/assets/images/projects/app_images/emosense_photos/employee/tools_screen.png": "a52f4b2d3b09ba7509dee7832c1e5dc8",
"assets/assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen.png": "0b9989095ceda9169e773d460a651874",
"assets/assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_2.png": "fd338dcf36e046c73dbd68c312a711b6",
"assets/assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_3.png": "ebe07c6e170bb37929acfc1789395b2f",
"assets/assets/images/projects/app_images/emosense_photos/employee/video_analysis_screen_4.png": "6126b2587cd5375de08791488f949b35",
"assets/assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen.png": "bdfefb538b1fb44ca4f00f39f622d4db",
"assets/assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen_2.png": "5edceb6ef03412d53ff663f87b2148aa",
"assets/assets/images/projects/app_images/emosense_photos/employee/voice_analysis_screen_3.png": "12332491e912ed045ba01cf66cdfae84",
"assets/assets/images/projects/app_images/gogesh/ads_screen.png": "b190aced4b5486d053a6373dd6244468",
"assets/assets/images/projects/app_images/gogesh/app_main_search.png": "12aacd282c416763e6cb1167f281a3fc",
"assets/assets/images/projects/app_images/gogesh/category.png": "1a1b7e30eaa42826770b48f271c7611f",
"assets/assets/images/projects/app_images/gogesh/category_detail.png": "0cb6462eba13b8e5068bb56d40929085",
"assets/assets/images/projects/app_images/gogesh/category_result.png": "735d1a82982e39aef685e1322d017d99",
"assets/assets/images/projects/app_images/gogesh/chat.png": "9c1c2fe2a6c8e31cee058e4248682426",
"assets/assets/images/projects/app_images/gogesh/create.png": "860a2fb03003cc3b668c5c9c0ef93beb",
"assets/assets/images/projects/app_images/gogesh/empty_chat.png": "ac443617cf0b8e66a7acdca8751f2e40",
"assets/assets/images/projects/app_images/gogesh/favorite_screen.png": "6b765cb4a7e8f34f7f82bc38921df8dd",
"assets/assets/images/projects/app_images/gogesh/filter.png": "f84bba535dfab2266e997b382caba274",
"assets/assets/images/projects/app_images/gogesh/login_or_signup.png": "7b594c2b3c0d8ed5dc8454fe0cd2e524",
"assets/assets/images/projects/app_images/gogesh/notification_screen.png": "85367f7e72e9629e8ed563d6ad74dd42",
"assets/assets/images/projects/app_images/gogesh/offers_screen.png": "34bb9c3d2309f620b12cffddb9ee9ef1",
"assets/assets/images/projects/app_images/gogesh/onboard_1.png": "450626a371e7fa99298e5169121b0071",
"assets/assets/images/projects/app_images/gogesh/onboard_2.png": "f875fcaa75794b90075aceab8947b468",
"assets/assets/images/projects/app_images/gogesh/onboard_3.png": "b9594b5152cc6804c957a19104ccb9d7",
"assets/assets/images/projects/app_images/gogesh/phone_login.png": "936129684e1f604aefa0519aa3e7d30d",
"assets/assets/images/projects/app_images/gogesh/phone_national.png": "9613e6c87cda3b7d2f246f2a3628c770",
"assets/assets/images/projects/app_images/gogesh/product%2520filter.png": "2f4d999b1119f0981a094e358ddc6b00",
"assets/assets/images/projects/app_images/gogesh/product_screen.png": "32e4aaf3ca6353b3b37fc5c0ac71e466",
"assets/assets/images/projects/app_images/gogesh/report.png": "25ed40efb26458fab172f79681eea327",
"assets/assets/images/projects/app_images/gogesh/report_succse.png": "58d22c76483e23901d84fbc26fce0818",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_042850.png": "33a8b00d34be76abc8c74c8e1943632c",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_042909.png": "ec08b7bb15d05e35401f7451e8b2a52f",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_042943.png": "e6716cea16ede2d84c72331668ff4bec",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043105.png": "578da008816acf4d21d7cdd4f276636e",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043141.png": "3789cc2e7f9430d0e9d2138de64f1d84",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043314.png": "a713d82943641b7cfb040fe62c0cda61",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043343.png": "a9234b7b0a9403082f08f70668871975",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043611.png": "42a48b4a9a65e949ea11e3e108d9a8e3",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043617.png": "7b84c17a644161e7a69af039d62e171b",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043629.png": "9223df8107e87348218a27c27c2ff709",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043642.png": "b0c545181f65496f0866bb8d04d54211",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043731.png": "37d022f628939e3cfaec2b66e9a605c9",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043747.png": "583eeedc84a50bc68a2cb457d2c001eb",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043804.png": "c52a5a95d2a4913ad3caa29eec2c9fef",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043825.png": "48bab8101cf36633146a2dec1219b32d",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043835.png": "68a0d14385c6be56d484876d7ac5aafc",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043848.png": "32dbf1be30dba9d577941b016fe6906c",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043921.png": "15b690a3d65d932f9801f4e290c269f1",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_043945.png": "8639e015bc255f197550a4c8c18fd17b",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_044004.png": "588edac65c05beb2569e94abaa0bdbcc",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_044020.png": "8b007dffe1da6759f1e1ae08c3fb2a18",
"assets/assets/images/projects/app_images/gogesh/Screenshot_20250829_044026.png": "742ad81dcbc1432be22da3c553d65bfc",
"assets/assets/images/projects/app_images/gogesh/splash.png": "80f41dc9fe1e46a16f993b205e4021cc",
"assets/assets/images/projects/app_images/music_app/Home%2520Screen%25201.png": "ad186c6f043e3ad9166554e5311f1ecf",
"assets/assets/images/projects/app_images/music_app/Home%2520Screen%25202.png": "59447f563b1804c7fe6a290dc724b91f",
"assets/assets/images/projects/app_images/music_app/home_page.png": "638267a198a67bf45cb89b8720d1e997",
"assets/assets/images/projects/app_images/music_app/liked%2520songs%2520page.png": "71e96998007e6cf99c7326149dc2dbd7",
"assets/assets/images/projects/app_images/music_app/Liked%2520Songs%2520screen.png": "e41c09f736eb0b635380c8d29f146b6f",
"assets/assets/images/projects/app_images/music_app/Music%2520player%2520screen.png": "949deffe0abe55413bc13a2939b6d887",
"assets/assets/images/projects/app_images/music_app/palyer%2520screen.png": "457ac8dcad50f756edda128d3634bc04",
"assets/assets/images/projects/app_images/music_app/playlist%2520screen.png": "e21e883b6d79c60d37a3f39e4db6e977",
"assets/assets/images/projects/app_images/music_app/playlist.png": "bf3b4568bb4d3ba2a4cca9dd30b18eee",
"assets/assets/images/projects/app_images/quiz_hub/correct_answer.png": "8eb4c32646cf0ad013dae93b428da7e7",
"assets/assets/images/projects/app_images/quiz_hub/home_screen.png": "c1add1ea6052fbae4b90adee651e911d",
"assets/assets/images/projects/app_images/quiz_hub/home_screen_2.png": "ada97dba4690c3ffee7523a65acc62e2",
"assets/assets/images/projects/app_images/quiz_hub/incorrect_answer.png": "ec87f578f02cc3c09ad1435eaee14c4f",
"assets/assets/images/projects/app_images/quiz_hub/quiz.png": "45d720ef203f188f6d02d73cf3181819",
"assets/assets/images/projects/app_images/quiz_hub/qui_completed.png": "1ce650eff92b28742a30c9c3749b817c",
"assets/assets/images/projects/app_images/quiz_hub/review_page.png": "d1a8b2b11657d8c93c98ede6bcb5f7c7",
"assets/assets/images/projects/app_images/QuoteHub/Favorite%2520Page.png": "bcd8c0191f463d12241a60e27835c561",
"assets/assets/images/projects/app_images/QuoteHub/Home%2520Screen%2520with%2520Quotes.png": "056c0d867b546a555a434fff5b28477a",
"assets/assets/images/projects/app_images/QuoteHub/Home%2520Screen.png": "23982037c4e3957484f86281df1ff44a",
"assets/assets/images/projects/app_images/QuoteHub/Select%2520Category.png": "01561ac6531b0baf7ca052e8602cf6ea",
"assets/assets/images/projects/app_pdf/Chat%2520App.pdf": "4a697b1b5e705f58c5e918fb4386b2be",
"assets/assets/images/projects/app_pdf/emosense_app.pdf": "5b03664c85c52d9ef593c3c09b40a508",
"assets/assets/images/projects/app_pdf/EV%2520Station%2520Finder%2520App.pdf": "005fcd5764185cc8bcce35c565992078",
"assets/assets/images/projects/app_pdf/Gogesh%2520App.pdf": "a8e992824fb4fb71c6d1078a243f6fed",
"assets/assets/images/projects/app_pdf/Music%2520App.pdf": "df6b8acf116cc8e51d3e233ee3fbae06",
"assets/assets/images/resume.pdf": "30bba9075ae2079ba31ced7aeaccd172",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "1eebe6d8f113920e65ba0212ae8b5e89",
"assets/NOTICES": "f278097e19a9ac20ff32400b0da684b1",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "085b63e659eba1c795bf8b75dd3f5ca4",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "489481bb592cc3ef1e88f5a33a9e6803",
"icons/Icon-192.png": "41f7ecf36895ee437027a6aa4bfb35d5",
"icons/Icon-512.png": "7de79b843106b8c8281aece80aeba423",
"icons/Icon-maskable-192.png": "41f7ecf36895ee437027a6aa4bfb35d5",
"icons/Icon-maskable-512.png": "7de79b843106b8c8281aece80aeba423",
"index.html": "f2af628d978466447dd379d604223032",
"/": "f2af628d978466447dd379d604223032",
"main.dart.js": "4bbfbc90bf1aee4c302bb1b75b04c7dc",
"manifest.json": "a7f06816a28713137cc07f7b8a5ea8b0",
"robots.txt": "2e0b3ee9a3d40e56af4a9a96e45004c3",
"sitemap.xml": "692f00edf2f3fe1a58be8bd3d1ca416a",
"version.json": "2a4bdd3370ee966319e180d97d91e050"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
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
