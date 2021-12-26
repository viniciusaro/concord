# Concord App
## Installation Instructions

Enter concord-app directory
```
cd concord-app
```

Install [FVM](https://fvm.app/docs/getting_started/overview):
```shell
brew tap leoafarias/fvm
brew install fvm
```

Install Flutter
```shell
fvm install
```

Install [Melos](https://melos.invertase.dev)
```shell
dart pub global activate melos
```

Bootstrap Project
```shell
fvm flutter pub global run melos bootstrap
```
