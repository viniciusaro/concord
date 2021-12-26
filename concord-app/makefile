setup:
	# https://fvm.app/docs/getting_started/overview
	brew tap leoafarias/fvm
	brew install fvm
	fvm install
	# https://melos.invertase.dev
	dart pub global activate melos
	make bootstrap

bootstrap:
	fvm flutter pub global run melos bootstrap

clean:
	fvm flutter pub global run melos clean