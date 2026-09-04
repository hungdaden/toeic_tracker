l10n:
	dart run intl_utils:generate
build_runner:
	flutter clean && flutter pub get && flutter pub run build_runner build --delete-conflicting-outputs && make l10n
get_python:
	brew install python@3.13 && ln -s /Library/Developer/CommandLineTools/usr/bin/python3 /Library/Developer/CommandLineTools/usr/bin/python
build_widgetbook:
	cd widgetbook && flutter clean && flutter pub run build_runner build --delete-conflicting-outputs && flutter build web && cd ..
run_widgetbook:
	-@kill -9 $$(lsof -t -i:8008) 2>/dev/null || true
	cd widgetbook/build/web && nohup python3 -m http.server 8008 > ../widgetbook.log 2>&1 &
build_and_run_widgetbook:
	flutter clean && make build_widgetbook && make run_widgetbook