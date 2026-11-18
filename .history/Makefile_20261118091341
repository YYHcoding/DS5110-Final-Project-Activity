REPO := YYHcoding/DS5110-Final-Project-Activity
URL  := https://data.insideairbnb.com/united-states/ma/boston

# get(snapshot, folder, file): download from the portal, fall back to the GitHub release
get = mkdir -p data/raw/$(1) && \
      (curl -fsSL -o data/raw/$(1)/$(3) $(URL)/$(1)/$(2)/$(3) || \
       gh release download data-v1 --repo $(REPO) -p $(1)_$(3) -O data/raw/$(1)/$(3) --clobber)

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
	cd data/raw && shasum -a 256 -c ../../MANIFEST.sha256