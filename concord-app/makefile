setup:
	# https://fvm.app/docs/getting_started/overview
	brew tap leoafarias/fvm
	brew install fvm
	fvm install
	
	# https://melos.invertase.dev
	fvm flutter pub global activate melos
	make bootstrap

bootstrap:
	fvm flutter pub global run melos bootstrap

clean:
	fvm flutter pub global run melos clean

watch: 
	sh tooling/scripts/watch.sh apps
	sh tooling/scripts/watch.sh features/chat
	sh tooling/scripts/watch.sh features/login
	sh tooling/scripts/watch.sh concord_ui
	sh tooling/scripts/watch.sh concord_core