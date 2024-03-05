'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "f23305dec3f12f9a2c369d71d1aec729",
"assets/AssetManifest.bin.json": "edd9eaba7762f746ff8312cfbddacd99",
"assets/AssetManifest.json": "54bb7b3449fa6b2c6b7fdcc81167539f",
"assets/assets/fonts/Gilroy-Black.woff": "a5e18ce935001d241734d402ae6efce6",
"assets/assets/fonts/Gilroy-BlackItalic.woff": "68bdadbbec1a438735b15bdfd450cd1e",
"assets/assets/fonts/Gilroy-Bold.woff": "3ca17cce1c4f3024d70da4447f5b7d50",
"assets/assets/fonts/Gilroy-BoldItalic.woff": "18d85c61e7df3171bb1e252ff58f4fb8",
"assets/assets/fonts/Gilroy-ExtraBold.woff": "bc3a01669ab88aa1005c52012e13a5e8",
"assets/assets/fonts/Gilroy-ExtraBoldItalic.woff": "ff7c4c09daa56e8fcf9bcff4a03bd785",
"assets/assets/fonts/Gilroy-Heavy.woff": "791d301cd017ac3c1a5b4098ed9f39ce",
"assets/assets/fonts/Gilroy-HeavyItalic.woff": "d9bdf85a60ee18b7c63f063981bee7a8",
"assets/assets/fonts/Gilroy-Light.woff": "679cd8013e1e98981a3daa13995f5949",
"assets/assets/fonts/Gilroy-LightItalic.woff": "10e81c7d9939899fb07b3957f3bcc575",
"assets/assets/fonts/Gilroy-Medium.woff": "7ab5484c73169bf74b17343ed54799ef",
"assets/assets/fonts/Gilroy-MediumItalic.woff": "9dfbc96bfb71ecad05e7900fd41e3f6c",
"assets/assets/fonts/Gilroy-Regular.woff": "2abef08d922206ae58ff5e8f75015547",
"assets/assets/fonts/Gilroy-RegularItalic.woff": "24092ab804aaf6af9d8c3f945446c3ce",
"assets/assets/fonts/Gilroy-SemiBold.woff": "9d2a1b7951deb82bbd6fa49268ff2e93",
"assets/assets/fonts/Gilroy-SemiBoldItalic.woff": "d9a3442790f7b7e920079cb0712a1fa0",
"assets/assets/fonts/Gilroy-UltraLight.woff": "86a228ffc0e00c9351247fdf09d7ef48",
"assets/assets/fonts/Gilroy-UltraLightItalic.woff": "2569b9308b3380d827855df9945e5860",
"assets/assets/fonts/propertifyicon.ttf": "2d7a967dbccde291400127267569d8fd",
"assets/assets/images/propertify-adminlogo.svg": "9bed4b0bb9ed5016bc2cb0d00bc64940",
"assets/assets/images/propertifyweb-1.jpg": "d58977d5e6ba88d1afbe7e716ef6e21c",
"assets/FontManifest.json": "bfac8e615ea1c4e18c93f05ef8b54dbb",
"assets/fonts/MaterialIcons-Regular.otf": "2de8a5e5dc7a6b289969802544a2ad38",
"assets/NOTICES": "e841b38888c3ac6c793ebf6d48afadd3",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/fluttertoast/assets/toastify.css": "910ddaaf9712a0b0392cf7975a3b7fb5",
"assets/packages/fluttertoast/assets/toastify.js": "18cfdd77033aa55d215e8a78c090ba89",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "711c72d5a78934ac4399959366fed78e",
"/": "711c72d5a78934ac4399959366fed78e",
"main.dart.js": "363c98cd9f5500495703f6373ce8335a",
"manifest.json": "bff428e62157d9fde1db893b6a502cdf",
"version.json": "14f5dd3cb328e2e7b9ea370a61111e43"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
