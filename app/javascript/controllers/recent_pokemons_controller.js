import { Controller } from "@hotwired/stimulus";
import EmblaCarousel from "embla-carousel";

export default class extends Controller {
  connect() {
    if (!this.element) return;

    const options = { loop: false, dragFree: true };
    EmblaCarousel(this.element, options);
  }
}
