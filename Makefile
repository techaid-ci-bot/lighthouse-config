.PHONY: dashboard
TAG=v1.7.602
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

dashboard:
	curl -sL https://raw.githubusercontent.com/tektoncd/dashboard/master/scripts/release-installer | bash -s -- install latest --read-only
	kubectl apply -f ingress.yaml
