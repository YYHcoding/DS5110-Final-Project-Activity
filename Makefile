REPO := YYHcoding/DS5110-Final-Project-Activity
URL  := https://data.insideairbnb.com/united-states/ma/boston
RELEASE_URL := https://github.com/$(REPO)/releases/download/data-v1
SHA := $(shell command -v sha256sum >/dev/null 2>&1 && echo sha256sum || echo shasum -a 256)

# get(snapshot, folder, file): download from the portal, fall back to the GitHub release
get = mkdir -p data/raw/$(1) && \
      (curl -fsSL -o data/raw/$(1)/$(3) $(URL)/$(1)/$(2)/$(3) || \
       curl -fsSL -o data/raw/$(1)/$(3) $(RELEASE_URL)/$(1)_$(3))

.PHONY: data
data:
	$(call get,2026-06-15,data,listings.csv.gz)
	$(call get,2026-06-15,data,calendar.csv.gz)
	$(call get,2026-06-15,data,reviews.csv.gz)
	$(call get,2026-06-15,visualisations,neighbourhoods.geojson)
	$(call get,2026-09-19,data,listings.csv.gz)
	$(call get,2026-09-19,data,calendar.csv.gz)
	$(call get,2026-09-19,data,reviews.csv.gz)
	$(call get,2026-09-19,visualisations,neighbourhoods.geojson)
	cd data/raw && $(SHA) -c ../../MANIFEST.sha256