import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static targets = ["activities", "map", "button"];
  static values = {
    apiKey: String,
    markers: Array
  };

  hide(event) {
    event.preventDefault();
    this.activitiesTarget.classList.toggle("d-none");
    this.mapTarget.classList.toggle("d-none");

    if (this.activitiesTarget.classList.contains("d-none")) {
      this.buttonTarget.textContent = "Activities";
      this.loadMap();
    } else {
      this.buttonTarget.textContent = "Map";
    }
  }

  loadMap() {
    if (this.map) return;

    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: 'mapbox://styles/sandorlaz-art/cm4b3fzgo00bo01qt4ga85w2g'
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
  }
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 18, duration: 10000 })
  }
}
