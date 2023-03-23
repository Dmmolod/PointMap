![][ios] ![][swift] ![uikit] ![snapKit] ![MapBox] ![][MVP] ![][OSM]
# PointMap
## Приложение с использованием сервиса OpenStreetMap через API MapBox.
### Реализовано:
- Возможность ставить единственную метку на карте с нужным изображением.
- Центрирование на метку.
- Отрисовка прямой линии от метки до новой точки.
- Переключение режима установки метки и отрисовки линии.

# Как выглядит:
![01][01]

[01]: https://github.com/Dmmolod/PointMap/blob/master/gifs/01.gif

> Для возможности запустить, по документации, необходимо в домашней дирректории создать файл ".netrc"
> Файл должен выглядеть следующим образом и содержать приватный ключ:
> ```
> machine api.mapbox.com
> login mapbox
> password PRIVATE_API_KEY
> ```
> Из официального источника:
> > The `.netrc` file is a plain text file that is used in certain development environments to store credentials used to access remote servers. The login should always be `mapbox`. It should not be your personal username used to create the secret token. To set up the credentials required to download the SDK, add the following entry to your `.netrc` file. 
>
> Так же в info.plist необходимо указать публичный ключ, создав для него поле `MBXAccessToken`.
>
> Ссылка на инструкцию: https://docs.mapbox.com/ios/maps/guides/install/

[ios]: https://img.shields.io/badge/iOS-13.0-critical
[swift]: https://img.shields.io/badge/-Swift-9cf
[uikit]: https://img.shields.io/badge/-UIKit-blue
[snapKit]: https://img.shields.io/badge/-SnapKit-9cf
[MapBox]: https://img.shields.io/badge/-MapBox-blue
[MVP]: https://img.shields.io/badge/-MVP-9cf
[OSM]: https://img.shields.io/badge/-OpenStreetMap-red
