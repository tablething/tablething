.PHONY: patch minor major

# Cut a release. The version is derived from the latest published release;
# the build pulls the app source, stamps this version, signs, notarizes,
# and publishes with auto-update metadata.
#   make patch   x.y.z -> x.y.(z+1)
#   make minor   x.y.z -> x.(y+1).0
#   make major   x.y.z -> (x+1).0.0
patch minor major:
	@bash scripts/release.sh $@
