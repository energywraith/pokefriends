import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {}

  click() {
    const navbar = document.querySelector("#navbar-default");
    const navbarToggle = document.querySelector(
      "[data-collapse-toggle=navbar-default]"
    );

    const isExpanded = navbarToggle.getAttribute("aria-expanded");
    const shouldBeVisible = isExpanded === "false";
    navbarToggle.setAttribute(
      "aria-expanded",
      shouldBeVisible ? "true" : "false"
    );

    if (shouldBeVisible) {
      navbar.classList.remove("hidden");
      return;
    }

    navbar.classList.add("hidden");
  }
}
