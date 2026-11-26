# به‌روزرسانی SDK دارت و فلاتر

به‌روزرسانی SDK دارت و فلاتر

می‌خواهیم همه‌ی آن‌ها را به‌روز کنیم.

## جایگزینی در این تیکت <a id="replace-in-this-ticket"></a>

- `134` با شماره‌ی تیکت شما


## ساختن یک تیکت <a id="create-a-ticket"></a>

از قبل یک فضای کاری (workspace) gg به نام ggdna داریم.
همه‌ی مخزن‌های ggdna به master اضافه شده‌اند.

```bash
cd ~/dev/ggdna
gg do create ticket 134 -m"Update dart and flutter"
cd 134
```

## افزودن همه‌ی مخزن‌های ggdna به تیکت <a id="add-all-dnagitorg-repos-to-the-ticket"></a>

چون سرآیند حق نشر (copyright header) روی وابستگی‌ها اثری ندارد، می‌توانیم
مخزن‌ها را با گزینه‌ی `--no-localize` اضافه کنیم.

```bash
gg do add --org ggdna --no-localize
```

## به‌روزرسانی دارت به آخرین نسخه <a id="update-dart-to-latest-version"></a>

```bash
flutter upgrade
dart pub global activate gg
pana
dart --version
flutter --version
```

به Claude بگویید:

```
In all pubspec.yaml files, fix the sdk to the latest version:

sdk: ">=3.13.0<4.0.0"

Update also flutter SDK to the latest version.
```

## اعمال اصلاحات خودکار دارت <a id="apply-dart-auto-fixes"></a>

```bash
gg do exec cmd "dart fix --apply"
```


## ارتقای همه‌ی وابستگی‌ها <a id="upgrade-all-dependencies"></a>

```bash
gg do upgrade deps
```

## انتشار بدون بارگذاری در رجیستری <a id="publish-without-uploading-to-registry"></a>

تغییرات را در همه‌ی مخزن‌های اضافه‌شده commit کنید

```bash
 gg do commit -m"Update dart and flutter"
```

## ساختن یک pull request <a id="create-a-pull-request"></a>

```bash
 gg do review
```

## ساختن یک pull request <a id="create-a-pull-request"></a>

```bash
 gg do publish
```

