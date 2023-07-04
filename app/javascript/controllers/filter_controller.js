import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filter"
export default class extends Controller {
  toggle(e) {
    const type = e.currentTarget.dataset.type
    const url = `${window.location.pathname}?type=${type}`;

    Turbo.cache.clear();
    Turbo.visit(url);

  }
}
