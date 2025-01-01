'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/asset/font/Nanum_Myeongjo/NanumMyeongjo-Bold.ttf": "9d54daa2146d5d6fe0ae7f3ceba71ebb",
"assets/asset/font/Nanum_Myeongjo/NanumMyeongjo-ExtraBold.ttf": "8d8f02c800a76ea1747d9921526a76b4",
"assets/asset/font/Nanum_Myeongjo/NanumMyeongjo-Regular.ttf": "9c62bed5b605c9eb184cd2932626edf4",
"assets/asset/font/NotoSansKR/NotoSansKR-Black.otf": "05c077164c27fa722dcafe63ed38355e",
"assets/asset/font/NotoSansKR/NotoSansKR-Bold.otf": "e2406ff1791c401bc93e73d9e44e6d2b",
"assets/asset/font/NotoSansKR/NotoSansKR-Light.otf": "e914a10a1bd0088fb8f743fc7569749f",
"assets/asset/font/NotoSansKR/NotoSansKR-Medium.otf": "32666ae307200b0bcab5553590672bb1",
"assets/asset/font/NotoSansKR/NotoSansKR-Regular.otf": "210989664066c01d8ffdbdf56bb773cd",
"assets/asset/font/NotoSansKR/NotoSansKR-Thin.otf": "277434d967d5f33b857fc3f2dbaff15b",
"assets/asset/img/bride.png": "ba8aa603958ee889340c84f1a9e4fdfe",
"assets/asset/img/calender.png": "0eac04038f97809c1a30e9ffde016706",
"assets/asset/img/groom.png": "c4ae8baae242b7e4d5695f6a59a51f20",
"assets/asset/img/home.jpg": "8d9196c498f9803d6cb7e15b52860927",
"assets/asset/img/home_screen.png": "ac91b660ad73ebff0706b2fdcd6ac0b2",
"assets/asset/img/imgs/image1.jpg": "a4487923cacc619f0ba6db4d74cec6ce",
"assets/asset/img/imgs/image2.jpg": "b4ae95d0280b70eaf9f88575a2f607b8",
"assets/asset/img/imgs/image3.jpg": "3154bd9fd07a39291e03c129452b0427",
"assets/asset/img/imgs/image4.jpg": "d89421b996dd0f0051305bc1f5fc17fa",
"assets/asset/img/imgs/image5.jpg": "e6e125037e15372c1ffc6870a401696f",
"assets/asset/img/imgs/image6.jpg": "846007852147b7eab251457bbf1d72c2",
"assets/asset/img/imgs/image7.jpg": "583338f514802e66398f27f2b614e5e2",
"assets/asset/img/imgs/image8.jpg": "683cf3880fd72045cf3f7693c9125595",
"assets/asset/img/imgs/image9.jpg": "8387092f3c66c0cc19f2e5798f2a81ab",
"assets/asset/img/maps.png": "2a41751f9d5ca829e0998383525b1e31",
"assets/asset/lottie/flower_lottie.json": "178f31d36ef1fd65393d05f99562fcb4",
"assets/asset/lottie/grey_lottie.json": "ffaa524e5eed6ebfc66d03c47fc15f6f",
"assets/asset/lottie/invitiation_lottie.json": "ed3574c07db0317ccdb6dd40021da5ee",
"assets/AssetManifest.bin": "3696548ad29e9e31dde82b40d9af7e5a",
"assets/AssetManifest.bin.json": "c56f3c0b2bf86e2b78ab6195b7c56359",
"assets/AssetManifest.json": "a414521cf9ad4563a42fc54fbcc2f814",
"assets/FontManifest.json": "10cfcfd1a18328e0c8796d85b264f641",
"assets/fonts/MaterialIcons-Regular.otf": "177c7bf03c53517a103fe7b0662673c5",
"assets/NOTICES": "e4a28ed9b9d4d13b9d0eeba11fee5f9c",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "8bd11c2e1f034113106b4475ffcfb663",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "0a9fe94171de16bdc04d13e5c29eec65",
"/": "0a9fe94171de16bdc04d13e5c29eec65",
"main.dart.js": "9985cacda6cb253cfb9b30cd24844eb5",
"manifest.json": "b92868f57b572fffe893732e764b7338",
"version.json": "c29a6ae10b04b7e4d352af872bbd2488"};
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
