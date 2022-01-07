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
	sh tooling/scripts/watch.sh features
	sh tooling/scripts/watch.sh concord_ui/tokens
	sh tooling/scripts/watch.sh concord_core/auth
	sh tooling/scripts/watch.sh concord_core/shared_models